import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:api_celest/ast.dart' as ast;
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/analyzer/celest_analysis_helpers.dart';
import 'package:celest_cli/analyzer/resolver/project_resolver.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/serialization/is_serializable.dart';
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
import 'package:logging/logging.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:source_span/source_span.dart';

final class LegacyCelestProjectResolver
    with CelestAnalysisHelpers
    implements CelestProjectResolver {
  LegacyCelestProjectResolver({
    required CelestErrorReporter errorReporter,
    required this.customExceptionTypes,
    required this.customModelTypes,
    required this.context,
  }) : _errorReporter = errorReporter;

  static final _logger = Logger('LegacyCelestProjectResolver');

  final CelestErrorReporter _errorReporter;

  @override
  final AnalysisContext context;

  @override
  final Set<InterfaceElement> customModelTypes;

  @override
  final Set<InterfaceElement> customExceptionTypes;

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

  @override
  Future<ast.Project?> resolveProject({
    required ResolvedLibraryResult projectLibrary,
  }) async {
    final (topLevelConstants, hasErrors) =
        projectLibrary.element.topLevelConstants(
      errorReporter: _errorReporter,
    );
    if (hasErrors) {
      return null;
    }
    final projectFilePath = projectLibrary.element.source.uri.toFilePath();
    final projectDefinition =
        topLevelConstants.firstWhereOrNull((el) => el.element.type.isProject);
    if (projectDefinition == null) {
      reportError('$projectFilePath: No `Project` type found');
      return null;
    }
    final (
      element: projectDefinitionElement,
      value: projectDefinitionValue,
    ) = projectDefinition;

    // Validate `project` variable
    final projectDefineLocation = projectDefinitionElement.sourceLocation;
    _logger
        .finer('Resolved project definition location: $projectDefineLocation');
    final projectName =
        projectDefinitionValue.getField('name')?.toStringValue();
    assert(
      projectName != null,
      'This should be impossible given that `name` is a required field on `Project`',
    );
    if (projectName!.isEmpty) {
      reportError(
        'The project name cannot be empty.',
        location: projectDefineLocation,
      );
    }
    _logger.finer('Resolved project name: $projectName');

    return ast.Project(
      name: projectName,
      reference: refer(
        projectDefinitionElement.name,
        projectPaths.normalizeUri(p.toUri(projectFilePath)).toString(),
      ),
      sdkInfo: ast.SdkInfo(
        sdkVersion: Version.parse(Sdk.current.version),
        flutterSdkVersion: Sdk.current.flutterVersion?.let(Version.parse),
        enabledExperiments: celestProject.analysisOptions.enabledExperiments,
      ),
      location: projectDefineLocation,
    );
  }

  @override
  Future<Iterable<ast.EnvironmentVariable>>
      resolveEnvironmentVariables() async {
    return projectPaths.envManager.reload();
  }

  List<ast.ApiMetadata> _collectApiMetadata(
    Element element, {
    required bool hasAuth,
  }) {
    var hasAuthMetadata = false;
    return element.metadata
        .map((annotation) {
          final location = annotation.sourceLocation(element.source!);
          final type = annotation.computeConstantValue()?.type;
          if (type == null) {
            // TODO(dnys1): Add separate `hints` parameter to `reportError`
            /// for suggestions on how to resolve the error/links to docs.
            reportError(
              'Could not resolve annotation. Annotations must be '
              'authorization grants like `@authenticated` or `@public`.',
              location: location,
            );
            return null;
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
            case _ when type.isApiAuthenticated:
              if (!hasAuth) {
                reportError(
                  'The `@authenticated` annotation may only be used in '
                  'projects with authentication enabled.',
                  location: location,
                );
              }
              assertSingleAuth();
              return ast.ApiAuthenticated(location: location);
            case _ when type.isApiPublic:
              assertSingleAuth();
              return ast.ApiPublic(location: location);
            case _ when type.isMiddleware:
              // return ast.ApiMiddleware(
              //   type: typeHelper.toReference(type),
              //   location: location,
              // );
              unreachable();
            default:
              return null;
          }
        })
        .nonNulls
        .toList();
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

  ast.NodeReference? _parameterReference(
    ParameterElement parameter, {
    required Iterable<ast.EnvironmentVariable> environmentVariables,
    required ast.ApiAuth? applicableAuth,
  }) {
    final annotations = parameter.metadata;
    if (annotations.isEmpty) {
      return null;
    }
    if (annotations.length > 1) {
      reportError(
        'Only one annotation may be specified on a parameter',
        location: parameter.sourceLocation.safeExpand(
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
    final annotation = annotations.single;
    final location = annotation.sourceLocation(parameter.source!);
    final value = annotation.computeConstantValue();
    final annotationType = value?.type;
    if (value == null || annotationType == null) {
      reportError('Could not resolve annotation', location: location);
      return null;
    }
    switch (annotationType) {
      case DartType(isEnvironmentVariable: true):
        if (!validEnvTypes.isExactlyType(parameter.type)) {
          reportError(
            'The type of an environment variable parameter must be one of: '
            '`String`, `Uri`, `int`, `double`, `num`, or `bool`',
            location: parameter.sourceLocation,
          );
          return null;
        }
        final name = value.getField('name')?.toStringValue();
        if (name == null) {
          reportError(
            'The `name` field is required on `EnvironmentVariable` annotations',
            location: location,
          );
          return null;
        }
        const reservedEnvVars = ['PORT'];
        if (reservedEnvVars.contains(name)) {
          reportError(
            'The environment variable name `$name` is reserved by Celest',
            location: parameter.sourceLocation,
          );
          return null;
        }
        if (environmentVariables.none((envVar) => envVar.envName == name)) {
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
      case DartType(isUserContext: true):
        if (!TypeChecker.fromStatic(typeHelper.coreTypes.userType)
            .isExactlyType(parameter.type)) {
          reportError(
            'The type of a user context parameter must be `User`',
            location: parameter.sourceLocation,
          );
          return null;
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
    }
    return null;
  }

  @override
  Future<ast.Api?> resolveApi({
    required String apiFilepath,
    required String apiName,
    required ResolvedLibraryResult apiLibrary,
    required Iterable<ast.EnvironmentVariable> environmentVariables,
    required bool hasAuth,
  }) async {
    final library = apiLibrary.element;
    final libraryMetdata = _collectApiMetadata(library, hasAuth: hasAuth);
    final apiExceptionTypes = collectExceptionTypes(library);
    final functions = Map.fromEntries(
      (await library.topLevelElements
              .whereType<FunctionElement>()
              .asyncMap((func) async {
        if (func.isPrivate) {
          return null;
        }

        final functionMetadata = _collectApiMetadata(func, hasAuth: hasAuth);
        final applicableAuth = _applicableAuth(
          apiMetadata: libraryMetdata,
          functionMetadata: functionMetadata,
        );
        final returnType = func.returnType;
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
            final paramLoc = param.sourceLocation;
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
              ),
              annotations: param.metadata
                  .map((annotation) => annotation.toCodeBuilder)
                  .nonNulls
                  .toList(),
              defaultTo: param.defaultTo,
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
            if (parameter.type.isFunctionContext) {
              return parameter;
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
          flattenedReturnType: typeHelper.toReference(returnType.flattened),
          location: func.sourceLocation,
          metadata: functionMetadata,
          annotations: func.metadata
              .map((annotation) => annotation.toCodeBuilder)
              .nonNulls
              .toList(),
          docs: func.docLines,
        );

        if (func.returnType.element case final InterfaceElement interface) {
          ensureClientReferenceable(
            interface,
            func.sourceLocation,
            type: CustomType.model,
          );
        }

        var hasContext = false;
        for (final param in function.parameters) {
          if (param.type.isFunctionContext) {
            if (hasContext) {
              reportError(
                'A FunctionContext parameter may only be specified once',
                location: param.location,
              );
            }
            hasContext = true;
          }
        }
        // Check must happen before `isSerializable`
        final hasAllowedSubtypes =
            await returnType.flattened.hasAllowedSubtypes();
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
        final returnTypeVerdict = switch (returnType.flattened) {
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
      // TODO(dnys1): Report error?
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

    final uniqueAuthProviders = <ast.AuthProvider>{};
    for (final authProvider in authProviders) {
      final ast.AuthProviderType type;
      switch (authProvider.type) {
        case InterfaceType(isAuthProviderEmail: true):
          type = ast.AuthProviderType.email;
        default:
          reportError(
            'Unknown auth provider type: ${authProvider.type}',
            location: authDefinitionLocation,
          );
          continue;
      }
      final astAuthProvider = ast.AuthProvider(
        type: type,
        location: authDefinitionLocation,
      );
      if (!uniqueAuthProviders.add(astAuthProvider)) {
        reportError(
          'Duplicate auth provider: $type',
          location: authDefinitionLocation,
        );
      }
    }
    return ast.Auth(
      location: authDefinitionLocation,
      providers: uniqueAuthProviders.toList(),
    );
  }
}
