import 'package:_common/_common.dart' as common;

@override
extension type const NestedParent(common.NestedParent _)
    implements common.NestedParent {}

@override
extension type const NestedChild(common.NestedChild _child)
    implements common.NestedChild {
  NestedChild.fromJson(Map<String, Object?> json)
      : this(common.NestedChild(json['name'] as String));

  Map<String, Object?> toJson() => {'name': _child.value};
}

final class NestedGrandparent {
  const NestedGrandparent(this.parent);

  final common.NestedParent parent;
}
