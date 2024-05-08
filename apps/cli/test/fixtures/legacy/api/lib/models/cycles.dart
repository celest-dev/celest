sealed class Node {
  const Node(this.name);

  final String name;
  List<Node> get children;
}

class Parent extends Node {
  const Parent(super.name, this.children);

  final List<Node> children;
}

class Child extends Node {
  const Child(super.name);

  @override
  List<Node> get children => const [];
}

class SelfReferencing {
  const SelfReferencing({
    this.value,
    this.wrapper,
    required this.list,
  });

  final SelfReferencing? value;
  final SelfReferencingWrapper? wrapper;
  final List<SelfReferencing> list;
}

class SelfReferencingWrapper {
  const SelfReferencingWrapper({
    required this.value,
  });

  final SelfReferencing value;
}
