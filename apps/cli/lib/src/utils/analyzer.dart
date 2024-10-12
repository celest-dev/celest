import 'dart:convert';
import 'dart:math';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/dart/analysis/driver.dart';
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:analyzer/src/dart/analysis/search.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:analyzer/src/dart/element/type.dart';
import 'package:analyzer/src/generated/source.dart';
import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_cli/analyzer/const_to_code_builder.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:code_builder/code_builder.dart' as codegen;
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:source_span/source_span.dart';

extension LibraryElementHelper on LibraryElement {
  bool get isPackageCelest => switch (source.uri) {
        Uri(scheme: 'package', pathSegments: ['celest', ...]) => true,
        _ => false,
      };

  bool get isCelestSdk => switch (source.uri) {
        Uri(scheme: 'package', pathSegments: [final packageName, ...]) =>
          packageName.startsWith('celest') && packageName != 'celest_backend',
        _ => false,
      };

  bool get isDartSdk => source.uri.scheme == 'dart';
  bool get isFlutterSdk =>
      source.uri.scheme == 'package' &&
      source.uri.pathSegments.first == 'flutter';

  bool get isWithinProject =>
      p.isWithin(projectPaths.projectRoot, source.fullName);
  bool get isWithinProjectLib =>
      p.isWithin(projectPaths.projectLib, source.fullName);
}

extension ElementAnnotationHelper on ElementAnnotation {
  bool get isCustomOverride => switch (element) {
        final PropertyAccessorElement propertyAccessor =>
          propertyAccessor.name == 'customOverride' &&
              propertyAccessor.library.isCelestSdk,
        _ => false,
      };

  bool get isHttpError => switch (element) {
        ConstructorElement(
          enclosingElement: ClassElement(:final name, :final library)
        ) =>
          name == 'httpError' && library.isCelestSdk,
        _ => false,
      };
}

extension DartTypeHelper on DartType {
  DartType get flattened {
    switch (this) {
      case final InterfaceType interface:
        final typeSystem = interface.element.library.typeSystem;
        final flattened = typeSystem.flatten(this);
        return switch ((this, flattened)) {
          // TODO(dnys1): https://github.com/dart-lang/sdk/issues/54260
          (
            // e.g. Future<Record>/FutureOr<Record>
            InterfaceType(
              typeArguments: [
                final RecordTypeImpl originalRecordType,
              ]
            ),
            final RecordTypeImpl recordType,
          ) =>
            RecordTypeImpl(
              namedFields: recordType.namedFields,
              positionalFields: recordType.positionalFields,
              nullabilitySuffix: recordType.nullabilitySuffix,
              alias: originalRecordType.alias,
            ),
          _ => flattened,
        };
      default:
        return this;
    }
  }

  DartType get nonNullable => (this as TypeImpl).withNullability(
        NullabilitySuffix.none,
      );

  bool get isCelestSdk => element?.library?.isCelestSdk ?? false;

  bool get isDartSdk => element?.library?.source.uri.scheme == 'dart';

  bool get isJsonExtensionType => switch (element) {
        ExtensionTypeElement(:final name, :final library) =>
          name.startsWith('Json') && library.isCelestSdk,
        _ => false,
      };

  bool get isCelestVariable => element == typeHelper.coreTypes.celestEnvElement;

  bool get isCelestSecret =>
      element == typeHelper.coreTypes.celestSecretElement;

  bool get isAuth => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'Auth' && library.isPackageCelest,
        _ => false,
      };

  bool get isAuthProviderEmail => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_EmailAuthProvider' && library.isPackageCelest,
        _ => false,
      };

  bool get isAuthProviderSms => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_SmsAuthProvider' && library.isPackageCelest,
        _ => false,
      };

  bool get isAuthProviderGitHub => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_GitHubAuthProvider' && library.isPackageCelest,
        _ => false,
      };

  bool get isAuthProviderApple => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_AppleAuthProvider' && library.isPackageCelest,
        _ => false,
      };

  bool get isAuthProviderGoogle => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_GoogleAuthProvider' && library.isPackageCelest,
        _ => false,
      };

  bool get isDatabase => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'Database' && library.isPackageCelest,
        _ => false,
      };

  bool get isDriftSchema => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_DriftSchema' && library.isPackageCelest,
        _ => false,
      };

  bool get isDriftGeneratedDatabase => switch (element) {
        ClassElement(
          name: 'GeneratedDatabase',
          library: LibraryElement(
            source: Source(
              uri: Uri(scheme: 'package', pathSegments: ['drift', ...])
            )
          )
        ) =>
          true,
        _ => false,
      };

  bool get isDriftQueryExecutor => switch (element) {
        ClassElement(
          name: 'QueryExecutor',
          library: LibraryElement(
            source: Source(
              uri: Uri(scheme: 'package', pathSegments: ['drift', ...])
            )
          )
        ) =>
          true,
        _ => false,
      };

  bool get isExternalAuthProviderFirebase => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_FirebaseExternalAuthProvider' && library.isPackageCelest,
        _ => false,
      };

  bool get isExternalAuthProviderSupabase => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_SupabaseExternalAuthProvider' && library.isPackageCelest,
        _ => false,
      };

  bool get isProject => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'Project' && library.isPackageCelest,
        _ => false,
      };

  bool get isProjectContext => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'ProjectContext' && library.isPackageCelest,
        _ => false,
      };

  bool get isApiAuthenticated => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_Authenticated' && library.isPackageCelest,
        _ => false,
      };

  bool get isApiPublic => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_Public' && library.isPackageCelest,
        _ => false,
      };

  bool get isHttpConfig => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'http' && library.isCelestSdk,
        _ => false,
      };

  bool get isHttpError => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'httpError' && library.isCelestSdk,
        _ => false,
      };

  // bool get isHttpLabel => switch (element) {
  //       ClassElement(:final name, :final library) =>
  //         name == 'httpLabel' && library.isCelestSdk,
  //       _ => false,
  //     };

  bool get isHttpQuery => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'httpQuery' && library.isCelestSdk,
        _ => false,
      };

  bool get isHttpHeader => switch (element) {
        ClassElement(:final name, :final library) =>
          name == 'httpHeader' && library.isCelestSdk,
        _ => false,
      };

  bool get isVariable {
    return switch (this) {
      InterfaceType(:final allSupertypes) => [
          this,
          ...allSupertypes,
        ].any((type) => identical(type, typeHelper.coreTypes.celestEnvType)),
      _ => false,
    };
  }

  bool get isStaticVariable => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_staticEnv' && library.isPackageCelest,
        _ => false,
      };

  bool get isSecret => element == typeHelper.coreTypes.celestSecretElement;

  bool get isUserContext => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_PrincipalContextKey' && library.isPackageCelest,
        _ => false,
      };

  bool get isCloud => switch (element) {
        ClassElement(:final name, :final library) =>
          name == '_Cloud' && library.isPackageCelest,
        _ => false,
      };

  bool get isMiddleware {
    final el = element;
    if (el is! ClassElement) {
      return false;
    }
    final supertypes = el.allSupertypes;
    if (supertypes.isEmpty) {
      return false;
    }
    return supertypes.any((supertype) {
      final supertypeElement = supertype.element;
      if (supertypeElement is! ClassElement) {
        return false;
      }
      return supertypeElement.library.isPackageCelest &&
          supertypeElement.name == 'Middleware';
    });
  }

  bool get isEnum => element is EnumElement;
  bool get isEnumLike => switch (element) {
        EnumElement() => true,
        ClassElementImpl(isEnumLike: true) && final element => switch (
              element.getField('values')) {
            FieldElement(
              isStatic: true,
              isConst: true,
              type: InterfaceType(
                isDartCoreList: true,
                typeArguments: [final typeArg]
              )
            ) =>
              const DartTypeEquality(ignoreNullability: true)
                  .equals(typeArg, this),
            _ => false,
          },
        _ => false,
      };

  /// Used to patch over/ignore the limitations of serializing Flutter
  /// types for now.
  bool get isFlutterType => switch (element) {
        ClassElement(:final library) => switch (library.source.uri) {
            // dart:ui
            Uri(scheme: 'dart', pathSegments: ['ui', ...]) => true,
            // package:flutter
            Uri(scheme: 'package', pathSegments: ['flutter', ...]) => true,
            _ => false,
          },
        _ => false,
      };

  bool get isSimpleJson =>
      isDartCoreBool ||
      isDartCoreDouble ||
      isDartCoreInt ||
      isDartCoreNum ||
      isDartCoreString ||
      isDartCoreObject ||
      isDartCoreNull ||
      isEnumLike;

  bool get isThrowable {
    return isExceptionType || isErrorType;
  }

  bool get isExceptionType {
    return typeHelper.typeSystem
        .isSubtypeOf(this, typeHelper.coreTypes.coreExceptionType);
  }

  bool get isCloudExceptionType {
    return typeHelper.typeSystem
        .isSubtypeOf(this, typeHelper.coreTypes.cloudExceptionType);
  }

  bool get isErrorType {
    return typeHelper.typeSystem
        .isSubtypeOf(this, typeHelper.coreTypes.coreErrorType);
  }

  bool get isExtensionType => element is ExtensionTypeElement;
  bool get implementsRepresentationType {
    final element = this.element;
    if (element is ExtensionTypeElement) {
      return element.allSupertypes.contains(extensionTypeErasure);
    }
    return true;
  }

  /// Whether this type is overridden by a custom `@override` extension type.
  bool get isOverridden =>
      typeHelper.overrides.containsKey(extensionTypeErasure);

  DartType get asOverriden =>
      typeHelper.overrides[extensionTypeErasure] ?? this;

  codegen.Expression? get typeToken {
    if (isOverridden) {
      return null;
    }
    if (element case final ExtensionTypeElement extensionType) {
      return DartTypes.celest.typeToken.constInstance(
        [codegen.literalString(extensionType.name)],
        {},
        [typeHelper.toReference(this)],
      );
    }
    return null;
  }

  Uri? get sourceUri {
    final sourceUri = switch (this) {
      // Don't consider aliases for non-record types.
      RecordType(:final alias?) => alias.element.library.source.uri,
      _ => element?.library?.source.uri,
    };
    if (sourceUri == null) {
      return null;
    }
    return projectPaths.normalizeUri(sourceUri);
  }

  Uri get uri {
    if (this is DynamicType) {
      return Uri.parse('dart:core#dynamic');
    }
    return sourceUri!;
  }

  Uri get instantiatedUri {
    final type = this;
    final symbol = switch (type) {
      final RecordType type => type.symbol,
      _ => element?.name,
    };
    assert(symbol != null, 'Symbol is null for $type');
    final symbolizedUri = switch (sourceUri) {
      final sourceUri? => sourceUri.replace(fragment: symbol),
      _ => Uri(fragment: symbol),
    };
    switch (type) {
      case InterfaceType(
            :final typeArguments,
            element: InterfaceElement(:final typeParameters)
          )
          when typeParameters.isNotEmpty:
        return symbolizedUri.replace(
          queryParameters: {
            for (final (index, typeParameter) in typeParameters.indexed)
              typeParameter.name:
                  typeArguments[index].instantiatedUri.toString(),
          },
        );
      default:
        return symbolizedUri;
    }
  }

  /// Cache for [hasAllowedSubtypes].
  static final _hasAllowedSubtypesCache = <DartType, SubtypeResult>{};
  static final _logger = Logger('DartTypeHelper');

  /// Ensures custom types (e.g. those defined in the current project), have
  /// allowed subtypes.
  ///
  /// Currently, only `sealed` classes are allowed to have subtypes.
  Future<SubtypeResult> hasAllowedSubtypes() async {
    return _hasAllowedSubtypesCache[this] ??= await _hasAllowedSubtypes();
  }

  Future<SubtypeResult> _hasAllowedSubtypes() async {
    final type = this;
    if (type is! InterfaceType) {
      return _SubtypeResultX._allowed;
    }
    final element = type.element;
    var hasAllowedSubtypes = (
      allowed: true,
      disallowedTypes: <InterfaceType>{},
    );
    // Recurse into type arguments before processing this wrapper, e.g. [type]
    // could be List<T> where T is of interest.
    for (final typeArgument in type.typeArguments) {
      hasAllowedSubtypes &= await typeArgument.hasAllowedSubtypes();
    }
    final libraryUri = type.element.librarySource.uri;
    final libraryPath =
        element.library.session.uriConverter.uriToPath(libraryUri);
    if (libraryPath == null) {
      _logger.finest('Could not resolve path for URI: $libraryUri');
      return _SubtypeResultX._allowed;
    }
    if (!p.isWithin(projectPaths.projectRoot, libraryPath)) {
      return _SubtypeResultX._allowed;
    }
    final subtypes = typeHelper.subtypes[element] ??= switch (element) {
      // Don't collect subtypes for final classes.
      // TODO(dnys1): How best to handle this? Needed for `OkShapeResult` but
      // final classes can still reopen types and introduce new classes with
      // new identities.
      ClassElement(isFinal: true) => const [],
      // TODO(dnys1): This should work but reports errors for sealed types.
      // ClassElementImpl() => element.allSubtypes ?? const [],
      _ => await element.collectSubtypes(),
    };
    for (final subtype in subtypes) {
      hasAllowedSubtypes &= await subtype.hasAllowedSubtypes();
    }
    final allowed = switch (element) {
      ClassElement(isSealed: true) =>
        // We can't instantiate a sealed class, so we need subtypes
        hasAllowedSubtypes.allowed && subtypes.isNotEmpty,
      ClassElement(isFinal: true) => hasAllowedSubtypes.allowed,
      _ => hasAllowedSubtypes.allowed && subtypes.isEmpty,
    };
    return (
      allowed: allowed,
      disallowedTypes: {
        if (!allowed) type,
        ...hasAllowedSubtypes.disallowedTypes,
      },
    );
  }

  DartType? get defaultWireType => switch (extensionTypeErasure.element) {
        EnumElement() => typeHelper.typeProvider.stringType,
        InterfaceElement() => jsonMapType,
        _ => null,
      };

  /// A unique, readable name for this type which can be used in generated code
  /// and over the wire.
  ///
  /// We try to follow protobuf versioning guidelines and use the package name,
  /// organization name, and the version to give types unique names which are
  /// easy to interpret and do not expose implementation details.
  String? externalUri(String projectName) {
    final symbol = switch (this) {
      final RecordType type => type.symbol,
      _ => element?.name,
    };
    assert(symbol != null, 'Symbol is null for $this');
    final sourceUri = switch (this) {
      // Don't consider aliases for non-record types.
      RecordType(:final alias) => alias?.element.sourceLocation?.sourceUrl,
      _ => element?.sourceLocation?.sourceUrl,
    };
    if (sourceUri == null) {
      // Anonymous record type.
      return null;
    }
    final externalPackageId = switch (sourceUri) {
      Uri(scheme: 'dart', pathSegments: [final library, ...]) =>
        'dart.$library',
      // TODO(dnys1): Include organization name
      // TODO(dnys1): Include version tag
      Uri(scheme: 'package', pathSegments: ['celest_backend', ...]) ||
      Uri(pathSegments: []) =>
        '$projectName.v1',
      Uri(scheme: 'package', pathSegments: [final package, ...])
          when isCelestSdk =>
        '${package.split('_').join('.')}.v1',
      // TODO(dnys1): Should this include the package's major version?
      Uri(scheme: 'package', :final pathSegments) => pathSegments.first,
      _ => unreachable('Unexpected source URI: $sourceUri'),
    };
    return '$externalPackageId.$symbol';
  }
}

typedef SubtypeResult = ({
  bool allowed,
  Set<InterfaceType> disallowedTypes,
});

extension _SubtypeResultX on SubtypeResult {
  static const SubtypeResult _allowed = (allowed: true, disallowedTypes: {});

  SubtypeResult operator &(SubtypeResult other) => (
        allowed: allowed && other.allowed,
        disallowedTypes: {
          ...disallowedTypes,
          ...other.disallowedTypes,
        },
      );
}

extension InterfaceElementHelpers on InterfaceElement {
  AnalysisDriver get _driver =>
      (library.session.analysisContext as DriverBasedAnalysisContext).driver;

  static final _searchedFiles = SearchedFiles();

  /// Collects all subtypes of the given [type].
  Future<List<InterfaceType>> collectSubtypes() async {
    final subtypes = await _driver.search.subTypes(this, _searchedFiles);
    return subtypes
        .where((res) {
          return switch (res.kind) {
            SearchResultKind.REFERENCE_IN_EXTENDS_CLAUSE ||
            SearchResultKind.REFERENCE_IN_IMPLEMENTS_CLAUSE ||
            SearchResultKind.REFERENCE_IN_ON_CLAUSE ||
            SearchResultKind.REFERENCE_IN_WITH_CLAUSE =>
              true,
            _ => false,
          };
        })
        .map((res) => res.enclosingElement)
        .whereType<ClassElement>()
        .map((res) => res.thisType)
        .toList();
  }

  Stream<SearchResult> references() async* {
    final elementReferences =
        await _driver.search.references(this, _searchedFiles);
    for (final reference in elementReferences) {
      yield reference;
    }
    if (unnamedConstructor case final constructor?) {
      final constructorReferences =
          await _driver.search.references(constructor, _searchedFiles);
      for (final reference in constructorReferences) {
        yield reference;
      }
    }
  }
}

extension RecordTypeHelper on RecordType {
  String get symbol {
    switch (alias) {
      case final alias?:
        return alias.element.displayName;
      default:
        final reference = typeHelper.toReference(this) as codegen.RecordType;
        final uniqueHash = const ListEquality<Object>().hash([
          ...reference.positionalFieldTypes,
          ...reference.namedFieldTypes.entries.expand(
            (entry) => [entry.key, entry.value],
          ),
        ]);
        return 'Record\$${uniqueHash.toRadixString(36)}';
    }
  }
}

extension NodeSourceLocation on AstNode {
  FileSpan sourceLocation(Source source) {
    return source.toSpan(offset, end);
  }
}

extension ElementSourceLocation on Element {
  FileSpan? get sourceLocation {
    final source = this.source;
    if (source == null) {
      return null;
    }
    if (nameOffset < 0) {
      return null;
    }
    return source.toSpan(nameOffset, nameOffset + nameLength);
  }

  List<String> get docLines => switch (documentationComment) {
        final documentationComment? =>
          LineSplitter.split(documentationComment).toList(),
        _ => const <String>[],
      };
}

extension ElementAnnotationSourceLocation on ElementAnnotation {
  FileSpan sourceLocation(Source source) {
    final impl = this as ElementAnnotationImpl;
    return source.toSpan(impl.annotationAst.offset, impl.annotationAst.end);
  }
}

extension SourceToSpan on Source {
  FileSpan toSpan(int start, [int? end]) {
    final sourceFile = SourceFile.fromString(
      contents.data,
      url: uri,
    );

    // TODO(dnys1): Something to do with caching, but when files are being
    // changed, sometimes the range is no longer valid by the time we call this
    // with outdated source.
    if (start >= sourceFile.length) {
      return sourceFile.span(0);
    }
    if (end != null && end >= sourceFile.length) {
      end = null;
    }

    return sourceFile.span(start, end);
  }
}

// TODO(dnys1): File ticket with Dart team around hashcode/equality of DartType
// == of RecordType does not take into account alias.
// hashCode only takes into account the length of positionalFields and namedFields.
final class DartTypeEquality implements Equality<DartType?> {
  const DartTypeEquality({this.ignoreNullability = false});

  final bool ignoreNullability;

  @override
  bool equals(DartType? e1, DartType? e2) {
    if (identical(e1, e2)) {
      return true;
    }
    if (e1 is RecordType && e2 is RecordType) {
      return RecordTypeEquality(ignoreNullability: ignoreNullability)
          .equals(e1, e2);
    }
    if (ignoreNullability) {
      e1 = (e1 as TypeImpl).withNullability(NullabilitySuffix.none);
      e2 = (e2 as TypeImpl).withNullability(NullabilitySuffix.none);
    }
    return e1 == e2;
  }

  @override
  int hash(DartType? e) {
    if (e is RecordType) {
      return RecordTypeEquality(ignoreNullability: ignoreNullability).hash(e);
    }
    if (ignoreNullability) {
      e = (e as TypeImpl).withNullability(NullabilitySuffix.none);
    }
    return e.hashCode;
  }

  @override
  bool isValidKey(Object? o) => o is DartType?;
}

// TODO(dnys1): File ticket with Dart team around hashcode/equality of DartType
final class RecordTypeEquality implements Equality<RecordType> {
  const RecordTypeEquality({this.ignoreNullability = false});

  final bool ignoreNullability;

  @override
  bool equals(RecordType e1, RecordType e2) {
    if (identical(e1, e2)) {
      return true;
    }
    if (!ignoreNullability) {
      if (e1.nullabilitySuffix != e2.nullabilitySuffix) {
        return false;
      }
    }
    if (e1.alias != e2.alias) {
      return false;
    }

    final thisPositional = e1.positionalFields;
    final otherPositional = e2.positionalFields;
    if (thisPositional.length != otherPositional.length) {
      return false;
    }
    for (var i = 0; i < thisPositional.length; i++) {
      final thisField = thisPositional[i];
      final otherField = otherPositional[i];
      if (!const DartTypeEquality().equals(thisField.type, otherField.type)) {
        return false;
      }
    }

    final thisNamed = e1.namedFields;
    final otherNamed = e2.namedFields;
    if (thisNamed.length != otherNamed.length) {
      return false;
    }
    for (var i = 0; i < thisNamed.length; i++) {
      final thisField = thisNamed[i];
      final otherField = otherNamed[i];
      if (thisField.name != otherField.name ||
          !const DartTypeEquality().equals(thisField.type, otherField.type)) {
        return false;
      }
    }

    return true;
  }

  @override
  int hash(RecordType e) => const DeepCollectionEquality().hash([
        e.nullabilitySuffix,
        e.alias,
        e.positionalFields.map(
          (field) => const DartTypeEquality().hash(field.type),
        ),
        e.namedFields.map((field) => field.name),
        e.namedFields.map(
          (field) => const DartTypeEquality().hash(field.type),
        ),
      ]);

  @override
  bool isValidKey(Object? o) => o is RecordType;
}

extension SafeExpand on FileSpan {
  /// Allows expanding a span to include another span, but only if they are
  /// in the same file, since [ast.FileSpan.expand] will throw if they are not.
  // TODO(dnys1): Improve expand functionality to allow multi-file splits and better disjoint expands with (...) instead of showing every line.
  FileSpan safeExpand(FileSpan other) {
    if (sourceUrl != other.sourceUrl) {
      return this;
    }
    // Limits the maximum number of lines that can be expanded.
    // This prevents really long contexts.
    const maxLines = 12;
    final start = min(this.start.line, other.start.line);
    final end = max(this.end.line, other.end.line);
    if ((end - start) > maxLines) {
      return this;
    }
    return expand(other);
  }
}

extension AnnotationIsPrivate on ElementAnnotation {
  /// Whether the annotation references a private [element].
  bool get isPrivate => switch (element) {
        null => false,
        final PropertyAccessorElement propertyAccessor =>
          propertyAccessor.variable.isPrivate,
        final ConstructorElement constructor =>
          constructor.enclosingElement.isPrivate,
        _ => unreachable(
            'Unexpected annotation element: ${element.runtimeType}',
          ),
      };

  codegen.Expression? get toCodeBuilder {
    if (isPrivate) {
      return null;
    }
    if (element
        case VariableElement(:final type) ||
            PropertyAccessorElement(returnType: final type) ||
            ConstructorElement(returnType: final DartType type)
        when type == typeHelper.coreTypes.celestEnvType ||
            type == typeHelper.coreTypes.celestSecretType) {
      return null;
    }
    final constant = computeConstantValue();
    if (constant == null) {
      return null;
    }
    final type = constant.type;
    if (type == null || type.isCelestSdk || type.isMiddleware) {
      return null;
    }
    if (element case PropertyAccessorElement(:final name, :final library)
        when library.isWithinProjectLib) {
      return codegen.refer(name, library.source.uri.toString());
    }
    return constant.toCodeBuilder;
  }

  ast.DartValue? get toDartValue {
    if (isPrivate) {
      return null;
    }
    if (element
        case VariableElement(:final type) ||
            PropertyAccessorElement(returnType: final type) ||
            ConstructorElement(returnType: final DartType type)
        when type == typeHelper.coreTypes.celestEnvType ||
            type == typeHelper.coreTypes.celestSecretType) {
      return null;
    }
    final constant = computeConstantValue();
    if (constant == null) {
      return null;
    }
    return constant.toDartValue;
  }
}

extension ParameterDefaultTo on ParameterElement {
  /// The parameter's default value as a [codegen.Expression].
  codegen.Expression? get defaultToExpression => switch (this) {
        // TODO(dnys1): File ticket with Dart team
        // Required, named, non-nullable parameters have a default value
        // of `null` for some reason.
        _ when isRequired && isNamed => null,
        final ConstVariableElement constVar =>
          constVar.computeConstantValue()?.toCodeBuilder,
        _ => null,
      };

  /// The parameter's default value as a [ast.DartValue].
  ast.DartValue? get defaultToValue => switch (this) {
        // TODO(dnys1): File ticket with Dart team
        // Required, named, non-nullable parameters have a default value
        // of `null` for some reason.
        _ when isRequired && isNamed => null,
        final ConstVariableElement constVar =>
          constVar.computeConstantValue()?.toDartValue,
        _ => null,
      };
}

extension NonPrivate on String {
  String get nonPrivate {
    if (startsWith('_')) {
      return substring(1);
    }
    return this;
  }
}

extension DartObjectHelpers on DartObject {
  String get configValueName {
    if (getField('name')?.toStringValue() case final name?) {
      return name;
    }
    final name = getField('(super)')?.getField('name')?.toStringValue();
    if (name != null) {
      return name;
    }
    // Should never happen since `name` is non-nullable.
    unreachable('Missing name for config value: $this');
  }
}
