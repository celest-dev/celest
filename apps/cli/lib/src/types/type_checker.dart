// Helpers for comparing types.
//
// This is a copy of the code from package:source_gen/source_gen.dart which
// includes only code not dependent on `dart:mirrors`.
library;

import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:path/path.dart' as p;
import 'package:source_span/source_span.dart';
import 'package:yaml/yaml.dart';

/// An abstraction around doing static type checking at compile/build time.
abstract base class TypeChecker {
  const TypeChecker();

  /// Creates a new [TypeChecker] that delegates to other [checkers].
  ///
  /// This implementation will return `true` for type checks if _any_ of the
  /// provided type checkers return true, which is useful for deprecating an
  /// API:
  /// ```dart
  /// const $Foo = const TypeChecker.fromRuntime(Foo);
  /// const $Bar = const TypeChecker.fromRuntime(Bar);
  ///
  /// // Used until $Foo is deleted.
  /// const $FooOrBar = const TypeChecker.forAny(const [$Foo, $Bar]);
  /// ```
  const factory TypeChecker.any(Iterable<TypeChecker> checkers) = _AnyChecker;

  /// Create a new [TypeChecker] backed by a static [type].
  const factory TypeChecker.fromStatic(DartType type) = _LibraryTypeChecker;

  /// Create a new [TypeChecker] backed by a library [url].
  ///
  /// Example of referring to a `LinkedHashMap` from `dart:collection`:
  /// ```dart
  /// const linkedHashMap = const TypeChecker.fromUrl(
  ///   'dart:collection#LinkedHashMap',
  /// );
  /// ```
  ///
  /// **NOTE**: This is considered a more _brittle_ way of determining the type
  /// because it relies on knowing the _absolute_ path (i.e. after resolved
  /// `export` directives). You should ideally only use `fromUrl` when you know
  /// the full path (likely you own/control the package) or it is in a stable
  /// package like in the `dart:` SDK.
  const factory TypeChecker.fromUrl(dynamic url) = _UriTypeChecker;

  /// Returns the first constant annotating [element] assignable to this type.
  ///
  /// Otherwise returns `null`.
  ///
  /// Throws on unresolved annotations unless [throwOnUnresolved] is `false`.
  DartObject? firstAnnotationOf(
    Element2 element, {
    bool throwOnUnresolved = true,
  }) {
    if (element is! Annotatable) {
      return null;
    }
    if ((element as Annotatable).metadata2.annotations.isEmpty) {
      return null;
    }
    final results = annotationsOf(
      element,
      throwOnUnresolved: throwOnUnresolved,
    );
    return results.isEmpty ? null : results.first;
  }

  /// Returns if a constant annotating [element] is assignable to this type.
  ///
  /// Throws on unresolved annotations unless [throwOnUnresolved] is `false`.
  bool hasAnnotationOf(Element2 element, {bool throwOnUnresolved = true}) =>
      firstAnnotationOf(element, throwOnUnresolved: throwOnUnresolved) != null;

  /// Returns the first constant annotating [element] that is exactly this type.
  ///
  /// Throws [UnresolvedAnnotationException] on unresolved annotations unless
  /// [throwOnUnresolved] is explicitly set to `false` (default is `true`).
  DartObject? firstAnnotationOfExact(
    Element2 element, {
    bool throwOnUnresolved = true,
  }) {
    if (element is! Annotatable) {
      return null;
    }
    if ((element as Annotatable).metadata2.annotations.isEmpty) {
      return null;
    }
    final results = annotationsOfExact(
      element,
      throwOnUnresolved: throwOnUnresolved,
    );
    return results.isEmpty ? null : results.first;
  }

  /// Returns if a constant annotating [element] is exactly this type.
  ///
  /// Throws [UnresolvedAnnotationException] on unresolved annotations unless
  /// [throwOnUnresolved] is explicitly set to `false` (default is `true`).
  bool hasAnnotationOfExact(
    Element2 element, {
    bool throwOnUnresolved = true,
  }) =>
      firstAnnotationOfExact(element, throwOnUnresolved: throwOnUnresolved) !=
      null;

  DartObject? _computeConstantValue(
    Element2 element,
    int annotationIndex, {
    bool throwOnUnresolved = true,
  }) {
    final annotation =
        (element as Annotatable).metadata2.annotations[annotationIndex];
    final result = annotation.computeConstantValue();
    if (result == null && throwOnUnresolved) {
      throw UnresolvedAnnotationException._from(element, annotationIndex);
    }
    return result;
  }

  /// Returns annotating constants on [element] assignable to this type.
  ///
  /// Throws [UnresolvedAnnotationException] on unresolved annotations unless
  /// [throwOnUnresolved] is explicitly set to `false` (default is `true`).
  Iterable<DartObject> annotationsOf(
    Element2 element, {
    bool throwOnUnresolved = true,
  }) => _annotationsWhere(
    element,
    isAssignableFromType,
    throwOnUnresolved: throwOnUnresolved,
  );

  Iterable<DartObject> _annotationsWhere(
    Element2 element,
    bool Function(DartType) predicate, {
    bool throwOnUnresolved = true,
  }) sync* {
    for (
      var i = 0;
      i < (element as Annotatable).metadata2.annotations.length;
      i++
    ) {
      final value = _computeConstantValue(
        element,
        i,
        throwOnUnresolved: throwOnUnresolved,
      );
      if (value?.type != null && predicate(value!.type!)) {
        yield value;
      }
    }
  }

  /// Returns annotating constants on [element] of exactly this type.
  ///
  /// Throws [UnresolvedAnnotationException] on unresolved annotations unless
  /// [throwOnUnresolved] is explicitly set to `false` (default is `true`).
  Iterable<DartObject> annotationsOfExact(
    Element2 element, {
    bool throwOnUnresolved = true,
  }) => _annotationsWhere(
    element,
    isExactlyType,
    throwOnUnresolved: throwOnUnresolved,
  );

  /// Returns `true` if the type of [element] can be assigned to this type.
  bool isAssignableFrom(Element2 element) =>
      isExactly(element) ||
      (element is InterfaceElement2 &&
          element.allSupertypes.any(isExactlyType));

  /// Returns `true` if [staticType] can be assigned to this type.
  bool isAssignableFromType(DartType staticType) =>
      isAssignableFrom(staticType.element3!);

  /// Returns `true` if representing the exact same class as [element].
  bool isExactly(Element2 element);

  /// Returns `true` if representing the exact same type as [staticType].
  bool isExactlyType(DartType staticType) => switch (staticType.element3) {
    final element? => isExactly(element),
    _ => false,
  };

  /// Returns `true` if representing a super class of [element].
  ///
  /// This check only takes into account the *extends* hierarchy. If you wish
  /// to check mixins and interfaces, use [isAssignableFrom].
  bool isSuperOf(Element2 element) {
    if (element is InterfaceElement2) {
      var theSuper = element.supertype;

      do {
        if (isExactlyType(theSuper!)) {
          return true;
        }

        theSuper = theSuper.superclass;
      } while (theSuper != null);
    }

    return false;
  }

  /// Returns `true` if representing a super type of [staticType].
  ///
  /// This only takes into account the *extends* hierarchy. If you wish
  /// to check mixins and interfaces, use [isAssignableFromType].
  bool isSuperTypeOf(DartType staticType) => isSuperOf(staticType.element3!);
}

// Checks a static type against another static type;
final class _LibraryTypeChecker extends TypeChecker {
  const _LibraryTypeChecker(this._type);

  final DartType _type;

  @override
  bool isExactly(Element2 element) =>
      element is InterfaceElement2 && element == _type.element3;

  @override
  String toString() => urlOfElement2(_type.element3!);
}

// Checks a runtime type against an Uri and Symbol.
final class _UriTypeChecker extends TypeChecker {
  const _UriTypeChecker(dynamic url) : _url = '$url';

  final String _url;

  // Precomputed cache of String --> Uri.
  static final _cache = Expando<Uri>();

  @override
  bool operator ==(Object o) => o is _UriTypeChecker && o._url == _url;

  @override
  int get hashCode => _url.hashCode;

  /// Url as a [Uri] object, lazily constructed.
  Uri get uri => _cache[this] ??= normalizeUrl(Uri.parse(_url));

  /// Returns whether this type represents the same as [url].
  bool hasSameUrl(dynamic url) =>
      uri.toString() ==
      (url is String ? url : normalizeUrl(url as Uri).toString());

  @override
  bool isExactly(Element2 element) => hasSameUrl(urlOfElement2(element));

  @override
  String toString() => '$uri';
}

final class _AnyChecker extends TypeChecker {
  const _AnyChecker(this._checkers);

  final Iterable<TypeChecker> _checkers;

  @override
  bool isExactly(Element2 element) =>
      _checkers.any((c) => c.isExactly(element));
}

/// Returns a URL representing [element].
String urlOfElement2(Element2 element) => switch (element.kind) {
  ElementKind.DYNAMIC => 'dart:core#dynamic',
  ElementKind.NEVER => 'dart:core#Never',
  // using librarySource.uri – in case the element is in a part
  _ =>
    normalizeUrl(
      element.library2!.firstFragment.source.uri,
    ).replace(fragment: element.name3).toString(),
};

Uri normalizeUrl(Uri url) {
  switch (url.scheme) {
    case 'dart':
      return normalizeDartUrl(url);
    case 'package':
      return _packageToAssetUrl(url);
    case 'file':
      return _fileToAssetUrl(url);
    default:
      return url;
  }
}

/// Make `dart:`-type URLs look like a user-knowable path.
///
/// Some internal dart: URLs are something like `dart:core/map.dart`.
///
/// This isn't a user-knowable path, so we strip out extra path segments
/// and only expose `dart:core`.
Uri normalizeDartUrl(Uri url) =>
    url.pathSegments.isNotEmpty
        ? url.replace(pathSegments: url.pathSegments.take(1))
        : url;

Uri _fileToAssetUrl(Uri url) {
  if (!p.isWithin(p.url.current, url.path)) return url;
  return Uri(
    scheme: 'asset',
    path: p.join(_rootPackageName, p.relative(url.path)),
  );
}

/// Returns a `package:` URL converted to a `asset:` URL.
///
/// This makes internal comparison logic much easier, but still allows users
/// to define assets in terms of `package:`, which is something that makes more
/// sense to most.
///
/// For example, this transforms `package:source_gen/source_gen.dart` into:
/// `asset:source_gen/lib/source_gen.dart`.
Uri _packageToAssetUrl(Uri url) =>
    url.scheme == 'package'
        ? url.replace(
          scheme: 'asset',
          pathSegments: <String>[
            url.pathSegments.first,
            'lib',
            ...url.pathSegments.skip(1),
          ],
        )
        : url;

final String _rootPackageName = () {
  final name =
      (loadYaml(File('pubspec.yaml').readAsStringSync()) as Map)['name'];
  if (name is! String) {
    throw StateError(
      'Your pubspec.yaml file is missing a `name` field or it isn\'t '
      'a String.',
    );
  }
  return name;
}();

/// Exception thrown when [TypeChecker] fails to resolve a metadata annotation.
///
/// Methods such as [TypeChecker.firstAnnotationOf] may throw this exception
/// when one or more annotations are not resolvable. This is usually a sign that
/// something was misspelled, an import is missing, or a dependency was not
/// defined (for build systems such as Bazel).
class UnresolvedAnnotationException implements Exception {
  /// Creates an exception from an annotation ([annotationIndex]) that was not
  /// resolvable while traversing [Annotatable.metadata] on [annotatedElement2].
  factory UnresolvedAnnotationException._from(
    Element2 annotatedElement2,
    int annotationIndex,
  ) {
    final sourceSpan = _findSpan(annotatedElement2, annotationIndex);
    return UnresolvedAnnotationException._(annotatedElement2, sourceSpan);
  }

  const UnresolvedAnnotationException._(
    this.annotatedElement,
    this.annotationSource,
  );

  /// Element that was annotated with something we could not resolve.
  final Element2 annotatedElement;

  /// Source span of the annotation that was not resolved.
  ///
  /// May be `null` if the import library was not found.
  final SourceSpan? annotationSource;

  static SourceSpan? _findSpan(
    Element2 annotatedElement2,
    int annotationIndex,
  ) {
    final parsedLibrary =
        annotatedElement2.session!.getParsedLibraryByElement2(
              annotatedElement2.library2!,
            )
            as ParsedLibraryResult;
    final declaration = parsedLibrary.getFragmentDeclaration(
      annotatedElement2.firstFragment,
    );
    if (declaration == null) {
      return null;
    }
    final node = declaration.node;
    final List<Annotation> metadata;
    if (node is AnnotatedNode) {
      metadata = node.metadata;
    } else if (node is FormalParameter) {
      metadata = node.metadata;
    } else {
      throw StateError(
        'Unhandled Annotated AST node type: ${node.runtimeType}',
      );
    }
    final annotation = metadata[annotationIndex];
    final start = annotation.offset;
    final end = start + annotation.length;
    final parsedUnit = declaration.parsedUnit!;
    return SourceSpan(
      SourceLocation(start, sourceUrl: parsedUnit.uri),
      SourceLocation(end, sourceUrl: parsedUnit.uri),
      parsedUnit.content.substring(start, end),
    );
  }

  @override
  String toString() {
    final message = 'Could not resolve annotation for `$annotatedElement`.';
    if (annotationSource != null) {
      return annotationSource!.message(message);
    }
    return message;
  }
}
