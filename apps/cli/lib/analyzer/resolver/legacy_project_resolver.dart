import 'dart:collection';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:analyzer/src/source/source_resource.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/celest_analysis_helpers.dart';
import 'package:celest_cli/analyzer/resolver/config_value_resolver.dart';
import 'package:celest_cli/analyzer/resolver/project_resolver.dart';
import 'package:celest_cli/config/feature_flags.dart';
import 'package:celest_cli/project/celest_project.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/serialization_verdict.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/type_checker.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/list.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:file/file.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:source_span/source_span.dart';
import 'package:stream_transform/stream_transform.dart';

final class LegacyCelestProjectResolver extends CelestProjectResolver {
  LegacyCelestProjectResolver({
    required super.migrateProject,
    required this.featureFlags,
    required CelestErrorReporter errorReporter,
    required this.context,
  }) : _errorReporter = errorReporter;

  static final _logger = Logger('LegacyCelestProjectResolver');

  final CelestErrorReporter _errorReporter;
  final FeatureFlags featureFlags;

  @override
  final DriverBasedAnalysisContext context;

  @override
  Set<InterfaceElement> customModelTypes = {};

  @override
  Set<InterfaceElement> customExceptionTypes = {};

  late final _envVariableResolver = ConfigValueResolver(
    context: context,
    configValueElement: typeHelper.coreTypes.celestEnvElement,
    errorReporter: this,
    factory: ast.EnvironmentVariable.new,
  );

  late final _secretResolver = ConfigValueResolver(
    context: context,
    configValueElement: typeHelper.coreTypes.celestSecretElement,
    errorReporter: this,
    factory: (name, {dartName, docs = const [], value, required location}) {
      return ast.Secret(
        name,
        docs: docs,
        dartName: dartName,
        location: location,
      );
    },
  );

  @override
  void reportError(
    String error, {
    AnalysisErrorSeverity? severity,
    SourceSpan? location,
  }) {
    _errorReporter.reportError(
      error,
      severity: severity,
      location: location,
    );
  }

  Future<Set<InterfaceElement>> _collectCustomTypes(CustomType type) async {
    final files = <File>[];
    final dir = fileSystem.directory(type.dir);
    if (dir.existsSync()) {
      files.addAll(
        await dir.list(recursive: true).whereType<File>().toList(),
      );
    }
    final legacyBarrelFile = fileSystem.file(type.legacyPath);
    if (legacyBarrelFile.existsSync()) {
      files.add(legacyBarrelFile);
    }
    final customTypes = <InterfaceElement>{};
    await Future.wait([
      for (final file in files)
        resolveLibrary(file.path).then((library) {
          final types = namespaceForLibrary(library.element);
          customTypes.addAll(types);
        }),
    ]);
    return customTypes;
  }

  @override
  Future<void> resolveCustomTypes() async {
    final [customModelTypes, customExceptionTypes] = await Future.wait([
      _collectCustomTypes(CustomType.model),
      _collectCustomTypes(CustomType.exception),
    ]);
    this.customModelTypes = customModelTypes;
    this.customExceptionTypes = customExceptionTypes;
    typeHelper.overrides.clear();
    for (final element in customExceptionTypes.followedBy(customModelTypes)) {
      final overrideAnnotation = element.metadata
          .firstWhereOrNull((annotation) => annotation.isOverride);
      final isOverride = overrideAnnotation != null;
      final customOverrideAnnotation = element.metadata
          .firstWhereOrNull((annotation) => annotation.isCustomOverride);
      final isCustomOverride = customOverrideAnnotation != null;
      if (!isOverride && !isCustomOverride) {
        continue;
      }
      if (element is! ExtensionTypeElement) {
        reportError(
          'Only extension types may be marked as overrides',
          location: element.sourceLocation,
        );
        continue;
      }
      final elementUri = context.currentSession.uriConverter.uriToPath(
            element.librarySource.uri,
          ) ??
          p.fromUri(element.librarySource.uri);
      if (isOverride && migrateProject) {
        // `@override` -> `@customImplementation`
        final location = overrideAnnotation.sourceLocation(element.source);
        final overlay = pendingEdits[elementUri] ??= {};
        const editText = '@customOverride';
        _logger.finest(
          'Proposing edit: ${location.text} -> $editText (${location.sourceUrl})',
        );
        overlay.add(
          SourceEdit(
            location.start.offset,
            location.length,
            editText,
          ),
        );
      }
      final typeErasure = element.typeErasure;
      if (typeErasure is! InterfaceType) {
        reportError(
          'Only interface types may be overridden',
          location: element.sourceLocation,
        );
        continue;
      }
      if (typeErasure.element is ExtensionTypeElement) {
        reportError(
          'Extension types may not be overridden',
          location: element.sourceLocation,
        );
        continue;
      }
      final erasureSource = typeErasure.element.library.source.uri;
      if (erasureSource case Uri(scheme: 'dart', path: 'core')) {
        reportError(
          'Overriding types from `dart:core` is not allowed',
          location: element.sourceLocation,
        );
        continue;
      }
      final overridesCustomType = switch (
          context.currentSession.uriConverter.uriToPath(erasureSource)) {
        final path? => p.isWithin(projectPaths.projectRoot, path),
        _ => false,
      };
      if (overridesCustomType) {
        reportError(
          'Overriding custom types is not allowed',
          location: element.sourceLocation,
        );
        continue;
      }
      if (typeHelper.overrides[typeErasure] case final existing?) {
        reportError(
          'The type ${typeErasure.element.name} is already overridden by '
          '${existing.element.name} (${existing.element.library.source.uri}).',
          location: element.sourceLocation,
        );
        continue;
      }
      // TODO(dnys1): This shouldn't be required but having an `on` clause with
      // an exttype which doesn't implement the interface causes an error.
      if (!element.thisType.implementsRepresentationType) {
        reportError(
          'Custom overrides must implement their representation type',
          location: element.sourceLocation,
        );
        continue;
      }
      typeHelper.overrides[typeErasure] = element.thisType;
    }
  }

  @override
  Future<ast.Project?> resolveProject({
    required ParsedLibraryResult projectLibrary,
  }) async {
    final declarations = projectLibrary.units
        .expand((unit) => unit.unit.declarations)
        .whereType<TopLevelVariableDeclaration>()
        .expand((declaration) => declaration.variables.variables);

    final projectFilePath = projectPaths.projectDart;
    final projectFile =
        context.currentSession.getFile(projectFilePath) as FileResult;
    final projectFileSource = FileSource(
      projectFile.file,
      p.toUri(projectFilePath),
    );

    String? projectName;
    String? projectDisplayName;
    ast.Region? projectRegion;
    String? variableName;
    FileSpan? projectDefineLocation;

    for (final declaration in declarations) {
      if (declaration
          case VariableDeclaration(
            name: Token(lexeme: final name),
            initializer: MethodInvocation(
              methodName: SimpleIdentifier(name: 'Project'),
              :final argumentList,
            )
          )) {
        for (final argument in argumentList.arguments) {
          switch (argument) {
            case NamedExpression(
                name: Label(label: SimpleIdentifier(name: 'name')),
                expression: SimpleStringLiteral(:final value),
              ):
              projectName = value;
              variableName = name;
              projectDefineLocation =
                  declaration.sourceLocation(projectFileSource);
            case NamedExpression(
                name: Label(label: SimpleIdentifier(name: 'displayName')),
                expression: SimpleStringLiteral(:final value),
              ):
              projectDisplayName = value;
            case NamedExpression(
                name: Label(label: SimpleIdentifier(name: 'region')),
                expression: PrefixedIdentifier(
                  prefix: SimpleIdentifier(name: 'Region'),
                  identifier: SimpleIdentifier(name: final region),
                ),
              ):
              projectRegion = ast.Region.valueOf(region);
            default:
              performance.captureError(
                FormatException(
                  'Unknown argument to `Project`: $argument',
                  projectFileSource,
                ),
              );
          }
        }
      }
    }

    if (projectName == null) {
      reportError('$projectFilePath: No `Project` type found');
      return null;
    }

    // Validate `project` variable
    _logger
        .finer('Resolved project definition location: $projectDefineLocation');
    if (projectName.isEmpty) {
      reportError(
        'The project name cannot be empty.',
        location: projectDefineLocation,
      );
    }
    _logger.finer('Resolved project name: $projectName');

    final featureFlags = await FeatureFlags.load();

    return ast.Project(
      name: projectName,
      displayName: projectDisplayName,
      primaryRegion: projectRegion,
      reference: refer(
        variableName!,
        projectPaths.normalizeUri(p.toUri(projectFilePath)).toString(),
      ),
      sdkInfo: ast.SdkInfo(
        sdkVersion: Sdk.current.version,
        flutterSdkVersion: switch (await celestProject.determineProjectType()) {
          CelestProjectType.flutter => Sdk.current.flutterVersion!,
          _ => null,
        },
        enabledExperiments: celestProject.analysisOptions.enabledExperiments,
        featureFlags: featureFlags.toAst(),
      ),
      location: projectDefineLocation!,
    );
  }

  @override
  Future<Set<ast.EnvironmentVariable>> resolveEnvironmentVariables() async {
    // TODO(dnys1): Check reserved names
    // TODO(dnys1): Check for conflict with secrets
    return _envVariableResolver.resolve();
  }

  @override
  Future<Set<ast.Secret>> resolveSecrets() async {
    return _secretResolver.resolve();
  }

  (List<ast.ApiMetadata>, bool isCloud) _collectApiMetadata(
    Element element, {
    required bool hasAuth,
  }) {
    var hasAuthMetadata = false;
    var isCloud = false;
    final metadata =
        element.metadata.expand<ast.ApiMetadata>((annotation) sync* {
      final location = annotation.sourceLocation(element.source!);
      final value = annotation.computeConstantValue();
      final type = value?.type;
      if (value == null || type == null) {
        // TODO(dnys1): Add separate `hints` parameter to `reportError`
        /// for suggestions on how to resolve the error/links to docs.
        reportError(
          'Could not resolve annotation: $annotation.\n'
          'value=$value, type=$type',
          location: location,
        );
        return;
      }

      void assertSingleAuth() {
        if (hasAuthMetadata) {
          reportError(
            'Only one `@authenticated` or `@public` annotation '
            'may be specified on the same function or API library.',
            location: location,
          );
        }
        hasAuthMetadata = true;
      }

      switch (type) {
        case _ when type.isCloud:
          isCloud = true;
          return;
        case _ when type.isApiAuthenticated:
          if (!hasAuth) {
            reportError(
              'The `@authenticated` annotation may only be used in '
              'projects with authentication enabled.',
              location: location,
            );
          }
          assertSingleAuth();
          yield ast.ApiAuthenticated(location: location);
        case _ when type.isApiPublic:
          assertSingleAuth();
          yield ast.ApiPublic(location: location);
        case _ when type.isHttpConfig:
          final method = value.getField('method')?.toStringValue();
          final statusCode = value.getField('statusCode')?.toIntValue();
          if (method == null || statusCode == null) {
            unreachable('http=$value');
          }
          switch (statusCode) {
            case >= 200 && < 300 || >= 400 && < 600:
              break;
            default:
              reportError(
                'Invalid HTTP status code. Status codes must be in the range 200-299 or '
                '400-599. Redirection and other codes are not supported at '
                'this time.',
                location: location,
              );
              return;
          }
          yield ast.ApiHttpConfig(
            method: method,
            statusCode: statusCode,
            location: location,
          );
        case _ when type.isHttpError:
          final errorTypes = [
            value.getField('type')?.toTypeValue(),
            value.getField('type1')?.toTypeValue(),
            value.getField('type2')?.toTypeValue(),
            value.getField('type3')?.toTypeValue(),
            value.getField('type4')?.toTypeValue(),
            value.getField('type5')?.toTypeValue(),
            value.getField('type6')?.toTypeValue(),
            value.getField('type7')?.toTypeValue(),
          ].nonNulls.toList();
          final statusCode = value.getField('statusCode')?.toIntValue();
          if (errorTypes.isEmpty || statusCode == null) {
            unreachable('httpError=$value');
          }
          for (final errorType in errorTypes) {
            yield ast.ApiHttpError(
              type: typeHelper.toReference(errorType).toTypeReference,
              statusCode: statusCode,
              location: location,
            );
          }
        case _ when type.isMiddleware:
          // return ast.ApiMiddleware(
          //   type: typeHelper.toReference(type),
          //   location: location,
          // );
          unreachable();
        default:
          return;
      }
    }).toList();

    return (metadata, isCloud);
  }

  String _applicableHttpMethod({
    required Iterable<ast.ApiMetadata> apiMetadata,
    required Iterable<ast.ApiMetadata> functionMetadata,
  }) {
    return apiMetadata.whereType<ast.ApiHttpConfig>().firstOrNull?.method ??
        functionMetadata.whereType<ast.ApiHttpConfig>().firstOrNull?.method ??
        'POST';
  }

  ast.ApiAuth? _applicableAuth({
    required Iterable<ast.ApiMetadata> apiMetadata,
    required Iterable<ast.ApiMetadata> functionMetadata,
  }) {
    final functionAuth = functionMetadata.whereType<ast.ApiAuth>().firstOrNull;
    final apiAuth = apiMetadata.whereType<ast.ApiAuth>().firstOrNull;
    if (apiAuth is ast.ApiAuthenticated && functionAuth is ast.ApiPublic) {
      reportError(
        '`@public` has no effect when `@authenticated` is applied at the '
        'API level. It is recommended to move the `@public` method to '
        'another API.',
        location: functionAuth.location,
        severity: AnalysisErrorSeverity.warning,
      );
      return apiAuth;
    }
    if (functionAuth != null) {
      return functionAuth;
    }
    if (apiAuth != null) {
      return apiAuth;
    }
    return null;
  }

  // TODO: Implement structured headers for more complex types.
  // Actually, needed?
  // Do structured headers fit this criteria?
  // https://smithy.io/2.0/spec/http-bindings.html#httpheader-serialization-rules
  static final _validHeaderQueryTypes = TypeChecker.any(
    [
      typeHelper.coreTypes.boolType,
      typeHelper.coreTypes.numType,
      typeHelper.coreTypes.intType,
      typeHelper.coreTypes.doubleType,
      typeHelper.coreTypes.stringType,
      typeHelper.coreTypes.dateTimeType,
    ].map(TypeChecker.fromStatic),
  );

  ast.NodeReference? _parameterReference(
    ParameterElement parameter, {
    required Iterable<ast.EnvironmentVariable> environmentVariables,
    required Iterable<ast.Secret> secrets,
    required ast.ApiAuth? applicableAuth,
    required ast.StreamType? streamType,
  }) {
    final annotations = parameter.metadata;
    if (annotations.isEmpty) {
      return null;
    }
    if (annotations.length > 1) {
      reportError(
        'Only one annotation may be specified on a parameter',
        location: parameter.sourceLocation?.safeExpand(
          annotations.fold<FileSpan>(
            annotations[0].sourceLocation(parameter.source!),
            (span, el) {
              return span.safeExpand(el.sourceLocation(parameter.source!));
            },
          ),
        ),
      );
      return null;
    }
    final annotation = annotations.first;
    final location = annotation.sourceLocation(parameter.source!);
    final value = annotation.computeConstantValue();
    final annotationType = value?.type;
    if (value == null || annotationType == null) {
      reportError('Could not resolve annotation', location: location);
      return null;
    }
    const reservedEnvVars = ['PORT'];
    switch (annotationType) {
      case DartType(isEnvironmentVariable: true):
        // Check for migration
        // TODO(dnys1): Update for V1
        if (migrateProject) {
          switch ((annotation.element, annotation.library)) {
            case (
                PropertyAccessorElement(
                  enclosingElement: ClassElement(name: 'Env'),
                  :final name,
                ),
                final library?
              ):
              final libraryPath = p.fromUri(library.source.uri);
              assert(p.isWithin(projectPaths.projectRoot, libraryPath));
              final overlay = pendingEdits[libraryPath] ??= {};
              final editText = '@env.$name';
              _logger.finest(
                'Proposing edit: ${location.text} -> $editText '
                '(${location.sourceUrl})',
              );
              overlay.add(
                // @Env.<name> -> @env.<name>
                SourceEdit(
                  location.start.offset,
                  location.length,
                  editText,
                ),
              );
          }
        }
        if (!validEnvTypes.isExactlyType(parameter.type)) {
          reportError(
            'The type of an environment variable parameter must be one of: '
            '`String`, `Uint8List`, `Uri`, `int`, `double`, `num`, or `bool`',
            location: parameter.sourceLocation,
          );
          return null;
        }
        final name = (value.getField('name') ??
                value.getField('(super)')?.getField('name'))
            ?.toStringValue();
        if (name == null) {
          reportError(
            'The `name` field is required for environment variables',
            location: location,
          );
          return null;
        }
        final reservedCelestVariableOutsideCelest =
            name.toUpperCase().startsWith('CELEST_') &&
                !(annotation.element?.library?.isPackageCelest ?? false);
        if (reservedEnvVars.contains(name) ||
            reservedCelestVariableOutsideCelest) {
          reportError(
            'The environment variable name `$name` is reserved by Celest',
            location: parameter.sourceLocation,
          );
          return null;
        }
        if (environmentVariables.none((envVar) => envVar.name == name)) {
          reportError(
            'The environment variable `$name` does not exist',
            location: location,
          );
          return null;
        }
        return ast.NodeReference(
          type: ast.NodeType.environmentVariable,
          name: name,
        );
      case DartType(isSecret: true):
        if (!validEnvTypes.isExactlyType(parameter.type)) {
          reportError(
            'The type of an secret parameter must be one of: '
            '`String`, `Uint8List`, `Uri`, `int`, `double`, `num`, or `bool`',
            location: parameter.sourceLocation,
          );
          return null;
        }
        final name = (value.getField('name') ??
                value.getField('(super)')?.getField('name'))
            ?.toStringValue();
        if (name == null) {
          reportError(
            'The `name` field is required for secrets',
            location: location,
          );
          return null;
        }
        final reservedCelestVariableOutsideCelest =
            name.toUpperCase().startsWith('CELEST_') &&
                !(annotation.element?.library?.isPackageCelest ?? false);
        if (reservedEnvVars.contains(name) ||
            reservedCelestVariableOutsideCelest) {
          reportError(
            'The secret name `$name` is reserved by Celest',
            location: parameter.sourceLocation,
          );
          return null;
        }
        if (secrets.none((secret) => secret.name == name)) {
          reportError(
            'The secret `$name` does not exist',
            location: location,
          );
          return null;
        }
        return ast.NodeReference(
          type: ast.NodeType.secret,
          name: name,
        );
      case DartType(isUserContext: true):
        if (!TypeChecker.fromStatic(typeHelper.coreTypes.userType)
            .isExactlyType(parameter.type)) {
          reportError(
            'The type of a user context parameter must be `User`',
            location: parameter.sourceLocation,
          );
          return null;
        }
        // Check for migration
        if (migrateProject) {
          switch ((annotation.element, annotation.library)) {
            case (PropertyAccessorElement(name: 'user'), final library?):
              final overlay =
                  pendingEdits[p.fromUri(library.source.uri)] ??= {};
              const editText = '@principal';
              _logger.finest(
                'Proposing edit: ${location.text} -> $editText '
                '(${location.sourceUrl})',
              );
              overlay.add(
                SourceEdit(
                  location.start.offset,
                  location.length,
                  editText,
                ),
              );
          }
        }
        if (applicableAuth case null || ast.ApiPublic()) {
          if (typeHelper.typeSystem.isNonNullable(parameter.type)) {
            reportError(
              'A user context parameter may only be required in an '
              '`@authenticated` function',
              location: parameter.sourceLocation,
            );
          }
        }
        return ast.NodeReference(
          name: r'$user',
          type: ast.NodeType.userContext,
        );
      case DartType(isHttpHeader: true):
        if (streamType != null) {
          reportError(
            'HTTP headers may not be used in functions that return a stream',
            location: location,
          );
          return null;
        }

        var name = value.getField('name')?.toStringValue();
        name ??= parameter.name;

        final validHeaderType = switch (parameter.type) {
          final InterfaceType type =>
            _validHeaderQueryTypes.isExactlyType(type),
          _ => false,
        };
        if (!validHeaderType) {
          reportError(
            'Invalid HTTP header type. The type of an HTTP header parameter must be `String`, `bool`, '
            '`DateTime`, or a number type.',
            location: parameter.sourceLocation,
          );
          return null;
        }

        // https://smithy.io/2.0/spec/http-bindings.html#restricted-http-headers
        final disallowedHeaders = CaseInsensitiveMap.from({
          // TODO: This header should be populated by authentication traits.
          // 'Authorization': 'This is controlled by Celest authentication traits.',
          'Connection':
              'This is controlled at a lower level by the HTTP client or server.',
          'Content-Length':
              'HTTP clients and servers are responsible for providing a Content-Length header.',
          'Expect': 'This is controlled at a lower level by the HTTP client.',
          'Max-Forwards':
              'This is controlled at a lower level by the HTTP client.',
          // TODO: This header should be populated by authentication traits.
          // 'Proxy-Authenticate':  'This is controlled by Celest authentication traits.',
          'Server': 'The Server header is controlled by the HTTP server.',
          'TE':
              'This is controlled at a lower level by the HTTP client and server.',
          'Trailer':
              'This is controlled at a lower level by the HTTP client and server.',
          'Transfer-Encoding':
              'This is controlled at a lower level by the HTTP client and server.',
          'Upgrade': 'This is controlled at a lower level by the HTTP server.',
          'User-Agent':
              'Setting a User-Agent is the responsibility of an HTTP client.',
          // TODO: This header should be populated by authentication traits.
          // 'WWW-Authenticate':  'This is controlled by Celest authentication traits.',
          'Via': 'The Via header is controlled by the HTTP server.',
          'X-Forwarded-For':
              'X-Forwarded-For is an implementation detail of HTTP that does not need to be modeled.',
        });
        if (disallowedHeaders[name] case final reason?) {
          reportError(
            'The HTTP header `$name` is reserved. $reason',
            location: location,
          );
          return null;
        }

        return ast.NodeReference(
          type: ast.NodeType.httpHeader,
          name: name,
        );
      case DartType(isHttpQuery: true):
        var name = value.getField('name')?.toStringValue();
        name ??= parameter.name;

        final validQueryType = switch (parameter.type) {
          InterfaceType(isDartCoreList: true, typeArguments: [final type]) =>
            _validHeaderQueryTypes.isExactlyType(type),
          final InterfaceType type =>
            _validHeaderQueryTypes.isExactlyType(type),
          _ => false,
        };
        if (!validQueryType) {
          reportError(
            'Invalid HTTP query type. The type of an HTTP query parameter must be `String`, `bool`, '
            '`DateTime`, a number type, or a `List` of these.',
            location: parameter.sourceLocation,
          );
          return null;
        }

        return ast.NodeReference(
          type: ast.NodeType.httpQuery,
          name: name,
        );
      // TODO
      // case DartType(isHttpLabel: true):
    }
    return null;
  }

  var _warnedForNoCloud = false;
  void _warnForNoCloud() {
    if (_warnedForNoCloud) return;
    _warnedForNoCloud = true;
    _logger.warning(
      'Beginning in Celest 0.4.0, only functions marked with `@cloud` will be '
      'included in your backend. All other functions are allowed but will be '
      'ignored.',
    );
  }

  @override
  Future<ast.Api?> resolveApi({
    required String apiFilepath,
    required String apiName,
    required ResolvedLibraryResult apiLibrary,
    required Iterable<ast.EnvironmentVariable> environmentVariables,
    required Iterable<ast.Secret> secrets,
    required bool hasAuth,
  }) async {
    final library = apiLibrary.element;
    final (libraryMetdata, _) = _collectApiMetadata(library, hasAuth: hasAuth);
    final apiExceptionTypes = await collectExceptionTypes(library);
    final functions = Map.fromEntries(
      (await library.topLevelElements
              .whereType<FunctionElement>()
              .asyncMap((func) async {
        if (func.isPrivate) {
          return null;
        }

        final (functionMetadata, isCloud) =
            _collectApiMetadata(func, hasAuth: hasAuth);

        if (!isCloud) {
          if (!migrateProject) {
            return null;
          }
          _warnForNoCloud();
          final overlay = pendingEdits[p.fromUri(library.source.uri)] ??= {};

          final declaration = apiLibrary.getElementDeclaration(func)!.node
              as FunctionDeclaration;
          // Put the `@cloud` before the first annotation, or directly
          // before the return type if there is no metadata.
          final offset = declaration.metadata.firstOrNull?.offset ??
              declaration.returnType!.offset;
          const editText = '@cloud\n';
          _logger.finest(
            'Proposing edit: $editText for ${func.name} '
            '($apiFilepath)',
          );
          overlay.add(
            SourceEdit(
              offset,
              0,
              editText,
            ),
          );
        }

        final returnType = func.returnType;
        final (flattenedReturnType, streaming) = switch (returnType) {
          final InterfaceType type when type.isDartAsyncStream => (
              type.typeArguments.first.flattened,
              true
            ),
          _ => (returnType.flattened, false),
        };
        final streamType =
            streaming ? ast.StreamType.unidirectionalServer : null;

        if (streaming) {
          if (!featureFlags.streaming.enabled) {
            reportError(
              'Streaming functions are not supported for this project. '
              'Upgrade to "celest: ^${featureFlags.streaming.enabledVersion}" '
              'in your pubspec.yaml and try again.',
            );
            return null;
          }

          final httpConfig = functionMetadata.whereType<ast.ApiHttpMetadata>();
          for (final httpConfig in httpConfig) {
            reportError(
              'Functions that return a stream may not customize their HTTP '
              'configuration',
              location: httpConfig.location,
            );
          }
        }

        final applicableAuth = _applicableAuth(
          apiMetadata: libraryMetdata,
          functionMetadata: functionMetadata,
        );
        final applicableHttpMethod = _applicableHttpMethod(
          apiMetadata: streaming ? const [] : libraryMetdata,
          functionMetadata: functionMetadata,
        );
        final hasBody = switch (applicableHttpMethod) {
          'GET' || 'HEAD' => false,
          _ => true,
        };

        final function = ast.CloudFunction(
          name: func.name,
          apiName: apiName,
          typeParameters: await func.typeParameters.asyncMap((type) async {
            final typeRef = typeHelper.toReference(
              type.instantiate(nullabilitySuffix: NullabilitySuffix.none),
            );
            final bound = type.bound;
            if (bound == null) {
              // Will be caught in serializer.
              // TODO(dnys1): Verify that generics are used in parameters/returns
              return typeRef;
            }
            final hasAllowedSubtypes = await bound.hasAllowedSubtypes();
            if (!hasAllowedSubtypes.allowed) {
              final disallowedTypes = hasAllowedSubtypes.disallowedTypes
                  .map((type) => type.element.name)
                  .join(', ');
              reportError(
                'Classes with subtypes (which are not sealed classes) are not '
                'currently supported as bounds. Disallowed subtypes: '
                '$disallowedTypes',
                location: type.sourceLocation,
              );
            }
            return typeRef;
          }),
          parameters: await func.parameters.asyncMap((param) async {
            final paramType = param.type;
            final paramTypeRef = typeHelper.toReference(paramType);
            final paramLoc = param.sourceLocation!;
            if (paramType.element case final InterfaceElement interface) {
              ensureClientReferenceable(
                interface,
                paramLoc,
                type: CustomType.model,
              );
            }
            final parameter = ast.CloudFunctionParameter(
              name: param.name,
              type: paramTypeRef,
              required: param.isRequired,
              named: param.isNamed,
              location: paramLoc,
              references: _parameterReference(
                param,
                applicableAuth: applicableAuth,
                environmentVariables: environmentVariables,
                secrets: secrets,
                streamType: streamType,
              ),
              annotations: param.metadata
                  .map((annotation) => annotation.toDartValue)
                  .nonNulls
                  .toList(),
              annotationExpressions: param.metadata
                  .map((annotation) => annotation.toCodeBuilder)
                  .nonNulls
                  .toList(),
              defaultTo: param.defaultToValue,
              defaultToExpression: param.defaultToExpression,
            );
            if (parameter.name.startsWith(r'$')) {
              // Ensures that we can have all local variables in the generated
              // client start with `$` without conflicting with parameter names
              // and no one should absolutely need to do this anyway.
              reportError(
                r'Parameter names may not start with a dollar sign (`$`)',
                location: parameter.location,
              );
            }
            if (!hasBody && parameter.references == null) {
              reportError(
                'Parameters must be mapped with an annotation such as `@httpQuery` '
                'or `@httpHeader` when the function is a GET or HEAD request.',
                location: parameter.location,
              );
            }

            // Check must happen before `isSerializable`
            final hasAllowedSubtypes = await param.type.hasAllowedSubtypes();
            if (!hasAllowedSubtypes.allowed) {
              final disallowedTypes = hasAllowedSubtypes.disallowedTypes
                  .map((type) => type.element.name)
                  .join(', ');
              reportError(
                'Classes with subtypes (which are not sealed classes) are not '
                'currently supported as parameters. Disallowed subtypes: '
                '$disallowedTypes',
                location: parameter.location,
              );
            }
            final parameterTypeVerdict = typeHelper.isSerializable(paramType);
            if (!parameterTypeVerdict.isSerializable) {
              for (final reason in parameterTypeVerdict.reasons) {
                reportError(
                  'The type of a parameter must be serializable as JSON. $reason',
                  location: switch (reason.location) {
                    final reasonLoc? =>
                      parameter.location.safeExpand(reasonLoc),
                    _ => parameter.location,
                  },
                );
              }
            }
            return parameter;
          }),
          returnType: typeHelper.toReference(returnType),
          flattenedReturnType: typeHelper.toReference(flattenedReturnType),
          streamType: streamType,
          location: func.sourceLocation!,
          metadata: functionMetadata,
          annotations: func.metadata
              .map((annotation) => annotation.toDartValue)
              .nonNulls
              .toList(),
          annotationExpressions: func.metadata
              .map((annotation) => annotation.toCodeBuilder)
              .nonNulls
              .toList(),
          docs: func.docLines,
        );

        if (flattenedReturnType.element case final InterfaceElement interface) {
          ensureClientReferenceable(
            interface,
            func.sourceLocation!,
            type: CustomType.model,
          );
        }

        // Check must happen before `isSerializable`
        final hasAllowedSubtypes =
            await flattenedReturnType.hasAllowedSubtypes();
        if (!hasAllowedSubtypes.allowed) {
          final disallowedTypes = hasAllowedSubtypes.disallowedTypes
              .map((type) => type.element.name)
              .join(', ');
          reportError(
            'Classes with subtypes (which are not sealed classes) are not '
            'currently supported as return types. Disallowed subtypes: '
            '$disallowedTypes',
            location: function.location,
          );
        }
        final returnTypeVerdict = switch (flattenedReturnType) {
          VoidType() => const Verdict.yes(),
          final flattened => typeHelper.isSerializable(flattened),
        };
        if (!returnTypeVerdict.isSerializable) {
          for (final reason in returnTypeVerdict.reasons) {
            reportError(
              'The return type of a function must be serializable as JSON. $reason',
              location: switch (reason.location) {
                final reasonLoc? => function.location.safeExpand(reasonLoc),
                _ => function.location,
              },
            );
          }
        }
        return MapEntry(function.name, function);
      }))
          .nonNulls,
    );
    return ast.Api(
      name: apiName,
      location: SourceFile.fromString(
        library.source.contents.data,
        url: library.source.uri,
      ).span(0, 0),
      metadata: libraryMetdata,
      functions: functions,
      docs: library.docLines,
      exceptionTypes: apiExceptionTypes.map(typeHelper.toReference),
    );
  }

  @override
  Future<ast.Auth?> resolveAuth({
    required String authFilepath,
    required ResolvedLibraryResult authLibrary,
  }) async {
    final (topLevelConstants, hasErrors) =
        authLibrary.element.topLevelConstants(errorReporter: _errorReporter);
    if (hasErrors) {
      return null;
    }
    final authDefinition =
        topLevelConstants.firstWhereOrNull((el) => el.element.type.isAuth);
    if (authDefinition == null) {
      _logger.finest('No `Auth` definition found in $authFilepath');
      return null;
    }

    final (
      element: authDefinitionElement,
      value: authDefinitionValue,
    ) = authDefinition;

    // Validate `auth` variable.
    final authDefinitionLocation = authDefinitionElement.sourceLocation;
    final authProviders =
        authDefinitionValue.getField('providers')?.toListValue();
    if (authProviders == null) {
      reportError(
        'The `providers` field is required on `Auth` definitions',
        location: authDefinitionLocation,
      );
      return null;
    }
    if (authProviders.isEmpty) {
      reportError(
        'At least one Auth provider must be specified in `providers`',
        location: authDefinitionLocation,
      );
      return null;
    }

    final uniqueAuthProviders = LinkedHashSet<ast.AuthProvider>(
      equals: (a, b) => a.type == b.type,
      hashCode: (a) => a.type.hashCode,
    );
    final uniqueExternalAuthProviders = LinkedHashSet<ast.ExternalAuthProvider>(
      equals: (a, b) => a.type == b.type,
      hashCode: (a) => a.type.hashCode,
    );
    for (final authProvider in authProviders) {
      ast.AuthProviderBuilder? provider;
      ast.ExternalAuthProviderBuilder? externalProvider;
      switch (authProvider.type) {
        case InterfaceType(isAuthProviderEmail: true):
          provider = ast.EmailAuthProviderBuilder();
        case InterfaceType(isAuthProviderSms: true):
          provider = ast.SmsAuthProviderBuilder();
        case InterfaceType(isAuthProviderApple: true):
          provider = ast.AppleAuthProviderBuilder();
        case InterfaceType(isAuthProviderGitHub: true):
          provider = ast.GitHubAuthProviderBuilder();
        case InterfaceType(isAuthProviderGoogle: true):
          provider = ast.GoogleAuthProviderBuilder();
        case InterfaceType(isExternalAuthProviderFirebase: true):
          final projectIdValue = authProvider.getField('projectId');
          if (projectIdValue == null) {
            // This should be impossible since it's non-nullable.
            unreachable(
              'The `projectId` field is required for Firebase auth providers',
            );
          }
          final projectIdEnvName = projectIdValue.configValueName;
          externalProvider = ast.FirebaseExternalAuthProviderBuilder()
            ..projectId.name = projectIdEnvName
            ..projectId.location = authDefinitionLocation;

        case InterfaceType(isExternalAuthProviderSupabase: true):
          final urlValue = authProvider.getField('url');
          if (urlValue == null) {
            // This should be impossible since it's non-nullable.
            unreachable(
              'The `url` field is required for Supabase auth providers',
            );
          }
          final urlVarName = urlValue.configValueName;
          final jwtSecretVariable = authProvider.getField('jwtSecret');
          externalProvider = ast.SupabaseExternalAuthProviderBuilder().let((b) {
            b
              ..projectUrl.name = urlVarName
              ..projectUrl.location = authDefinitionLocation;
            if (jwtSecretVariable != null && !jwtSecretVariable.isNull) {
              final jwtSecretVarName = jwtSecretVariable.configValueName;
              b
                ..jwtSecret.name = jwtSecretVarName
                ..jwtSecret.location = authDefinitionLocation;
            }
            return b;
          });

        default:
          reportError(
            'Unknown auth provider type: ${authProvider.type}',
            location: authDefinitionLocation,
          );
          continue;
      }
      if (provider != null) {
        provider
          ..name = authProvider.variable?.name
          ..location = authDefinitionLocation;
        final astAuthProvider = provider.build();
        if (!uniqueAuthProviders.add(astAuthProvider)) {
          reportError(
            'Duplicate ${astAuthProvider.type.name} auth provider',
            location: authDefinitionLocation,
          );
        }
      } else {
        externalProvider!
          ..name = authProvider.variable?.name
          ..location = authDefinitionLocation;
        final astExternalAuthProvider = externalProvider.build();
        if (!uniqueExternalAuthProviders.add(astExternalAuthProvider)) {
          reportError(
            'Duplicate ${astExternalAuthProvider.type.name} auth provider',
            location: authDefinitionLocation,
          );
        }
      }
    }
    return ast.Auth(
      location: authDefinitionLocation!,
      providers: uniqueAuthProviders.toList(),
      externalProviders: uniqueExternalAuthProviders.toList(),
    );
  }
}
