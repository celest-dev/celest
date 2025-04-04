import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/dart/analysis/session_helper.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:analyzer/src/dart/resolver/scope.dart';
import 'package:celest_cli/src/analyzer/analysis_error.dart';
import 'package:celest_cli/src/analyzer/resolver/project_resolver.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/init/edits/source_edit.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/json.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:source_span/source_span.dart';

enum CustomType {
  model,
  exception;

  String get dir => switch (this) {
        model => projectPaths.modelsDir,
        exception => projectPaths.exceptionsDir,
      };
}

mixin CelestAnalysisHelpers implements CelestErrorReporter {
  AnalysisContext get context;
  Set<InterfaceElement> get customExceptionTypes;
  Set<InterfaceElement> get customModelTypes;

  static final Expando<AnalysisSessionHelper> _sessionHelpers = Expando();
  AnalysisSessionHelper get helper =>
      _sessionHelpers[context.currentSession] ??=
          AnalysisSessionHelper(context.currentSession);

  final pendingEdits = <String, Set<SourceEdit>>{};

  static final Logger _logger = Logger('CelestAnalyzer');

  @mustCallSuper
  void reset() {
    pendingEdits.clear();
  }

  Set<InterfaceElement> namespaceForLibrary(
    LibraryElement library, {
    bool recursive = false,
  }) {
    final visited = Set<LibraryElement>.identity();

    Iterable<InterfaceElement> forNamespace(Namespace namespace) sync* {
      yield* namespace.definedNames.values.whereType();
      yield* namespace.definedNames.values
          .whereType<TypeAliasElement>()
          .map((el) => el.aliasedElement ?? el.aliasedType.element)
          .whereType();
    }

    Iterable<InterfaceElement> search(LibraryElement library) sync* {
      if (!visited.add(library)) {
        return;
      }
      yield* forNamespace(library.exportNamespace);
      if (!recursive) {
        return;
      }
      for (final importedLibrary in library.importedLibraries) {
        yield* search(importedLibrary).toList();
      }
    }

    return search(library).toSet();
  }

  Future<ResolvedLibraryResult> resolveLibrary(String path) async {
    final library = await context.currentSession.getResolvedLibrary(path);
    switch (library) {
      case ResolvedLibraryResult():
        return library;
      case NotLibraryButPartResult():
        return _resolvePartFile(path);
      case UriOfExternalLibraryResult():
      case CannotResolveUriResult():
      case DisposedAnalysisContextResult():
      case InvalidPathResult():
      case NotElementOfThisSessionResult():
      case NotPathOfUriResult():
      case InvalidResult():
      case _:
        throw StateError(
          'Could not resolve library at "$path": ${library.runtimeType}',
        );
    }
  }

  Future<LibraryElement> resolveLibraryByUri(String uri) async {
    final library = await context.currentSession.getLibraryByUri(uri);
    switch (library) {
      case LibraryElementResult(:final element):
        return element;
      default:
        throw StateError(
          'Could not resolve library by URI "$uri": ${library.runtimeType}',
        );
    }
  }

  Future<ResolvedLibraryResult> _resolvePartFile(String path) async {
    final unit = await context.currentSession.getResolvedUnit(path);
    if (unit case ResolvedUnitResult(:final libraryElement)) {
      final resolvedLibrary = await context.currentSession
          .getResolvedLibraryByElement(libraryElement);
      if (resolvedLibrary is! ResolvedLibraryResult) {
        throw StateError(
          'Could not resolve library for part file at "$path": ${unit.runtimeType}',
        );
      }
      return resolvedLibrary;
    }
    throw StateError(
      'Could not resolve part file at "$path": ${unit.runtimeType}',
    );
  }

  /// Collects exception types from project and imported libraries.
  Future<Set<DartType>> collectExceptionTypes(LibraryElement apiLibrary) async {
    final exceptionTypes = <DartType>{};

    final apiNamespace = namespaceForLibrary(apiLibrary, recursive: true);
    for (final interfaceElement in apiNamespace) {
      if (_validateExceptionType(interfaceElement) case final validType?) {
        exceptionTypes.add(validType);
      }
    }
    return exceptionTypes;
  }

  InterfaceType? _validateExceptionType(InterfaceElement interfaceElement) {
    final definitionPath = context.currentSession.uriConverter.uriToPath(
      interfaceElement.library.source.uri,
    );
    final errorSeverity = switch (definitionPath) {
      // We only care to report warnings for types defined within the project.
      // There will be plenty of types in the Dart/Flutter SDKs and in the
      // ecosystem that we don't support, but we don't want to spam the console
      // with warnings for them.
      final path? when p.isWithin(projectPaths.projectRoot, path) =>
        AnalysisErrorSeverity.warning,
      _ => AnalysisErrorSeverity.debug,
    };

    // TODO(dnys1): If the exception type is not in the transitive dependency
    // graph, we need to either: a) choose to add it, or b) skip the type.

    final typeUri =
        '${interfaceElement.library.source.uri}#${interfaceElement.name}';
    final overriddenBy = typeHelper.overrides[interfaceElement.thisType];
    final isOverriden = overriddenBy != null;
    if (isOverriden) {
      interfaceElement = overriddenBy.element;
    }
    final interfaceType = interfaceElement.thisType;
    final interfaceUri = interfaceElement.library.source.uri;
    final isExceptionType = identical(
          interfaceElement,
          typeHelper.coreTypes.coreExceptionType.element,
        ) ||
        typeHelper.typeSystem.isSubtypeOf(
          interfaceType.extensionTypeErasure,
          typeHelper.coreTypes.coreExceptionType,
        );
    final isErrorType = identical(
          interfaceElement,
          typeHelper.coreTypes.coreErrorType.element,
        ) ||
        typeHelper.typeSystem.isSubtypeOf(
          interfaceType.extensionTypeErasure,
          typeHelper.coreTypes.coreErrorType,
        );
    final isExceptionOrErrorType = isExceptionType || isErrorType;
    if (!isExceptionOrErrorType) {
      return null;
    }
    // Only types defined within the celest/ project folder need to be in
    // lib/ since all others can be imported on the client side.
    final (
      mustBeExportedFromExceptionsDart,
      exportedFromExceptionsDart,
    ) = switch (context.currentSession.uriConverter.uriToPath(interfaceUri)) {
      final path? => (
          p.isWithin(projectPaths.projectRoot, path),
          p.isWithin(projectPaths.projectLib, path),
        ),
      _ => (false, false),
    };
    if (!exportedFromExceptionsDart && mustBeExportedFromExceptionsDart) {
      reportError(
        'Custom exception types referenced in APIs must be defined within the '
        '`celest/lib/exceptions` folder',
        location: interfaceElement.sourceLocation,
        severity: errorSeverity,
      );
      return null;
    }
    final isInstantiable = switch (interfaceElement) {
      final ClassElement classElement => classElement.isConstructable ||
          classElement.constructors.any((ctor) => ctor.isFactory),
      ExtensionTypeElement() || EnumElement() => true,
      _ => false,
    };
    if (!isInstantiable) {
      _logger.finest('❌ $typeUri', 'Cannot be instantiated');
      return null;
    }
    final isSerializable = typeHelper.isSerializable(interfaceType);
    if (!isSerializable.isSerializable) {
      _logger.finest('❌ $typeUri', isSerializable.reasons.join(', '));
      // Serialization issues are only reported if the type is a custom type
      // (e.g. exported from `exceptions/`). Otherwise, users are still
      // allowed to throw it, but it will not be serialized in the response.
      if (exportedFromExceptionsDart) {
        for (final reason in isSerializable.reasons) {
          // TODO(dnys1): Add a helpful link/description for this error.
          reportError(
            'The exception type "${interfaceElement.name}" cannot be serialized '
            'as JSON. Hide this type from the API or make it serializable: '
            '$reason',
            location: interfaceElement.sourceLocation,
            severity: errorSeverity,
          );
        }
      }
      // TODO(dnys1): Warn based on whether the type is thrown directly or
      // just indirectly imported.
      //
      // Also codegen a comment in the generated client with the reason why
      // it's not included instead of reporting in console. (put behind a
      // --debug flag or something).
      reportError(
        'Cannot serialize the exception type "${interfaceElement.name}": '
        '${isSerializable.reasons.join('\n')}',
        location: interfaceElement.sourceLocation,
        severity: errorSeverity,
      );
      return null;
    }

    return interfaceType;
  }

  /// Ensures that a referenced type which will be surfaced in the client
  /// is defined in the `lib/` directory.
  void ensureClientReferenceable(
    InterfaceElement modelType,
    SourceSpan location, {
    required CustomType type,
  }) {
    final (isCustomType, isDefinedInLib) = switch (context
        .currentSession.uriConverter
        .uriToPath(modelType.library.source.uri)) {
      final path? => (
          p.isWithin(projectPaths.projectRoot, path),
          p.isWithin(projectPaths.projectLib, path),
        ),
      _ => (false, false),
    };
    if (isCustomType && !isDefinedInLib) {
      reportError(
        'Custom ${type.name} types referenced in APIs must be defined somewhere '
        'within the `celest/lib` folder.',
        location: location,
      );
    }
  }

  /// Resolves the schema version of a Drift database class.
  Future<int> resolveSchemaVersion(ClassElement2 databaseClass) async {
    final schemaVersionMethod =
        databaseClass.getGetter2('schemaVersion')?.variable3;
    if (schemaVersionMethod == null) {
      reportError(
        'Invalid database class: No `schemaVersion` getter.',
        severity: AnalysisErrorSeverity.error,
        location: databaseClass.sourceLocation,
      );
      return -1;
    }
    final declaration = await helper.getElementDeclaration(
      schemaVersionMethod.isSynthetic
          ? schemaVersionMethod.getter2!.firstFragment
          : schemaVersionMethod.firstFragment,
    );

    int? resolveExpression(Expression? expression) {
      switch (expression) {
        // int get schemaVersion => 1;
        case IntegerLiteral(value: final version?):
          return version;

        // int get schemaVersion => someConstVariable;
        case Identifier(
            staticElement: PropertyAccessorElement(:final variable2?)
          ):
          if (variable2.computeConstantValue()?.toIntValue()
              case final version?) {
            return version;
          }
      }

      return null;
    }

    switch (declaration?.node) {
      case VariableDeclaration(:final initializer):
        if (resolveExpression(initializer) case final version?) {
          return version;
        }

        // Could not determine schema version.
        reportError(
          'Invalid `schemaVersion` declaration: Must resolve to an integer.',
          severity: AnalysisErrorSeverity.error,
          location: schemaVersionMethod.sourceLocation,
        );
        return -1;

      case MethodDeclaration(:final body):
        switch (body) {
          case ExpressionFunctionBody(:final expression):
            if (resolveExpression(expression) case final version?) {
              return version;
            }
          case BlockFunctionBody():
          case EmptyFunctionBody():
          case NativeFunctionBody():
        }

        // Could not determine schema version.
        reportError(
          'Invalid `schemaVersion` declaration: Must use => syntax.',
          severity: AnalysisErrorSeverity.error,
          location: schemaVersionMethod.sourceLocation,
        );
        return -1;

      case final unknown:
        throw StateError(
          'Failed to resolve method declaration for $schemaVersionMethod: '
          'Got $unknown (${unknown.runtimeType})',
        );
    }
  }
}

extension TopLevelConstants on LibraryElement {
  static final _logger = Logger('TopLevelConstants');

  (List<TopLevelConstant>, bool hasErrors) topLevelConstants({
    required CelestErrorReporter errorReporter,
  }) {
    var hasConstantEvalErrors = false;
    final topLevelConstants = <TopLevelConstant>[];
    final topLevelVariables = topLevelElements
        .whereType<TopLevelVariableElement>()
        .where((variable) => !variable.isPrivate);
    for (final topLevelVariable in topLevelVariables) {
      if (!topLevelVariable.isConst) {
        errorReporter.reportError(
          'All top-level variables must be `const`',
          location: topLevelVariable.sourceLocation,
        );
        hasConstantEvalErrors = true;
        continue;
      }
      switch (topLevelVariable.computeConstantValue()) {
        case final DartObject constantValue:
          topLevelConstants.add((
            element: topLevelVariable,
            value: constantValue,
          ));
        default:
          errorReporter.reportError(
            'Top-level constant could not be evaluated',
            location: topLevelVariable.sourceLocation,
          );
          hasConstantEvalErrors = true;
      }
    }
    _logger.finest(() {
      final constantInfo = {
        'hasConstantEvalErrors': '$hasConstantEvalErrors',
        'constants': {
          for (final constant in topLevelConstants)
            constant.element.name: {
              'type': constant.element.type.toString(),
              'value': constant.value.toString(),
            },
        },
      };
      return 'Resolved top-level constants in ${source.uri}: '
          '${prettyPrintJson(constantInfo)}';
    });
    return (topLevelConstants, hasConstantEvalErrors);
  }
}

typedef TopLevelConstant = ({
  TopLevelVariableElement element,
  DartObject value
});

extension GetClassType on LibraryElementResult {
  ClassElement getClassElement(String name) =>
      element.exportNamespace.get(name) as ClassElement;

  DartType getClassType(String name) => getClassElement(name).thisType;

  ExtensionTypeElement getExtensionTypeElement(String name) =>
      element.exportNamespace.get(name) as ExtensionTypeElement;

  DartType getExtensionType(String name) =>
      getExtensionTypeElement(name).thisType;
}
