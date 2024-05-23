import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/dart/resolver/scope.dart';
import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/analyzer/resolver/project_resolver.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/path.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:source_span/source_span.dart';

enum CustomType {
  model,
  exception;

  String get legacyPath => switch (this) {
        model => projectPaths.modelsDart,
        exception => projectPaths.exceptionsDart,
      };

  String get dir => switch (this) {
        model => projectPaths.modelsDir,
        exception => projectPaths.exceptionsDir,
      };
}

final class SourceEdit {
  const SourceEdit(
    this.offset,
    this.length,
    this.replacement,
  );

  final int offset;
  final int length;
  final String replacement;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SourceEdit &&
        other.offset == offset &&
        other.length == length &&
        other.replacement == replacement;
  }

  @override
  int get hashCode => Object.hash(offset, length, replacement);

  @override
  String toString() {
    return 'SourceEdit(offset: $offset, length: $length, replacement: $replacement)';
  }
}

mixin CelestAnalysisHelpers implements CelestErrorReporter {
  AnalysisContext get context;
  Set<InterfaceElement> get customExceptionTypes;
  Set<InterfaceElement> get customModelTypes;

  final pendingEdits = <String, Set<SourceEdit>>{};

  @mustCallSuper
  void reset() {
    _apiNamespaceCache.clear();
    pendingEdits.clear();
  }

  static final _apiNamespaceCache =
      <(LibraryElement, bool recursive), Set<InterfaceElement>>{};
  static final Map<LibraryElement, List<InterfaceElement>>
      _libraryNamespaceCache = Map.identity();

  Set<InterfaceElement> namespaceForLibrary(
    LibraryElement library, {
    bool recursive = false,
  }) {
    if (_apiNamespaceCache[(library, recursive)] case final cached?) {
      return cached;
    }
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
        yield* _libraryNamespaceCache[importedLibrary] ??=
            search(importedLibrary).toList();
      }
    }

    return _apiNamespaceCache[(library, recursive)] = search(library).toSet();
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
      case NotLibraryButAugmentationResult():
      case NotPathOfUriResult():
      case InvalidResult():
      case _:
        throw StateError(
          'Could not resolve library at "$path": ${library.runtimeType}',
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

  Set<DartType> collectExceptionTypes(LibraryElement apiLibrary) {
    final apiNamespace = namespaceForLibrary(apiLibrary, recursive: true);
    final exceptionTypes = <DartType>{};
    for (var interfaceElement in apiNamespace) {
      final overriddenBy = typeHelper.overrides[interfaceElement.thisType];
      final isOverriden = overriddenBy != null;
      if (isOverriden) {
        interfaceElement = overriddenBy.element;
      }
      final interfaceType = interfaceElement.thisType;
      final interfaceUri = interfaceElement.library.source.uri;
      final isDartType = interfaceUri.scheme == 'dart';
      if (isDartType && !isOverriden) {
        continue;
      }
      final isExceptionType = typeHelper.typeSystem.isSubtypeOf(
        interfaceType.extensionTypeErasure,
        typeHelper.coreTypes.coreExceptionType,
      );
      final isErrorType = typeHelper.typeSystem.isSubtypeOf(
        interfaceType.extensionTypeErasure,
        typeHelper.coreTypes.coreErrorType,
      );
      final isExceptionOrErrorType = isExceptionType || isErrorType;
      if (!isExceptionOrErrorType) {
        continue;
      }
      final exportedFromExceptionsDart = isOverriden ||
          customExceptionTypes.contains(interfaceElement) ||
          customModelTypes.contains(interfaceElement);

      // Only types defined within the celest/ project folder need to be in
      // lib/ since all others can be imported on the client side.
      final mustBeExportedFromExceptionsDart =
          switch (context.currentSession.uriConverter.uriToPath(interfaceUri)) {
        final path? => p.isWithin(projectPaths.projectRoot, path),
        _ => false,
      };
      if (!exportedFromExceptionsDart && mustBeExportedFromExceptionsDart) {
        reportError(
          'Custom exception types referenced in APIs must be defined within the '
          '`celest/lib/exceptions` folder',
          location: interfaceElement.sourceLocation,
        );
        continue;
      }
      final isInstantiable = switch (interfaceElement) {
        final ClassElement classElement => classElement.isConstructable,
        ExtensionTypeElement() || EnumElement() => true,
        _ => false,
      };
      if (!isInstantiable) {
        continue;
      }
      final isSerializable = typeHelper.isSerializable(interfaceType);
      if (!isSerializable.isSerializable) {
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
            );
          }
        }
        continue;
      }
      exceptionTypes.add(interfaceType);
    }
    return exceptionTypes;
  }

  /// Ensures that a referenced type which will be surfaced in the client
  /// is defined in the `lib/` directory.
  void ensureClientReferenceable(
    InterfaceElement modelType,
    SourceSpan location, {
    required CustomType type,
  }) {
    final isCustomType = switch (context.currentSession.uriConverter
        .uriToPath(modelType.library.source.uri)) {
      final path? => p.isWithin(projectPaths.projectRoot, path),
      _ => false,
    };
    if (!isCustomType) {
      return;
    }
    final isDefinedInLib = switch (type) {
      CustomType.model => customModelTypes.contains(modelType),
      CustomType.exception => customExceptionTypes.contains(modelType),
    };
    if (!isDefinedInLib) {
      final expectedPath = p
          .relative(
            type.dir,
            from: projectPaths.projectRoot,
          )
          .to(p.url);
      reportError(
        'Custom ${type.name} types referenced in APIs must be defined within the '
        '`celest/$expectedPath` folder.',
        location: location,
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
          topLevelConstants.add(
            (element: topLevelVariable, value: constantValue),
          );
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
  DartObject value,
});

extension GetClassType on LibraryElementResult {
  DartType getClassType(String name) =>
      (element.exportNamespace.get(name) as ClassElement).thisType;
}
