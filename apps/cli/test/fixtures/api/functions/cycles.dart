/// Tests that some cycles are allowed, e.g. when there is at least one level
/// of indirection.
library;

import 'package:celest_backend/models/cycles.dart';

Node createTree() {
  return const Parent(
    'root',
    [
      Parent(
        'parentA',
        [
          Child('childA'),
          Child('childB'),
        ],
      ),
      Parent(
        'parentB',
        [
          Child('childC'),
          Child('childD'),
        ],
      ),
    ],
  );
}

void printTree(Node node) {
  _printTree(node);
}

void _printTree(Node node, {int indent = 0}) {
  print('${'  ' * indent}${node.name}');
  for (final child in node.children) {
    _printTree(child, indent: indent + 1);
  }
}

// Test different combinations of nullability and cycles.
Node combineTrees(
  Node tree1, [
  Parent? tree2,
  Node? tree3,
  List<Node?> additionalChildren = const [],
]) {
  return Parent(
    'root',
    [
      tree1,
      if (tree2 != null) tree2,
      if (tree3 != null) tree3,
      ...additionalChildren.nonNulls,
    ],
  );
}

/// Tests that self-referencing is allowed when there is a level
/// of indirection, e.g. nullability, generics, or a wrapper.
SelfReferencing selfReferencing(SelfReferencing selfReferencing) {
  return selfReferencing;
}
