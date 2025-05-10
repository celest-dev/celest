import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/source/source_range.dart';

extension ElementHelper on Element2 {
  /// Whether the source of this element is a package from the Celest SDK.
  bool get isPackageCelest => switch (library2?.firstFragment.source.uri) {
        Uri(scheme: 'package', pathSegments: [final packageName, ...]) =>
          packageName.startsWith('celest') && packageName != 'celest_backend',
        _ => false,
      };
}

extension AnnotationHelper on ElementAnnotation {
  /// Whether the element targeted by this annotation is the `CloudFunction`
  /// class from `package:celest`.
  bool get isCloudFunction => switch (element2) {
        ConstructorElement2(enclosingElement2: final classElement) =>
          classElement.isPackageCelest && classElement.name3 == 'CloudFunction',
        _ => false,
      };
}

extension AstNodeSourceRange on AstNode {
  /// The source range of this node.
  SourceRange get sourceRange => SourceRange(offset, length);
}
