import 'dart:collection';

import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:graphs/graphs.dart';

/// Provides a stable, topological ordering of types relative to each other.
///
/// Returns a list of types where each type is guaranteed to appear before any
/// of its supertypes.
List<DartType> topologicallySortTypes(Iterable<DartType> types) {
  final graph = <DartType, Set<DartType>>{
    for (final type in types)
      type: HashSet<DartType>(
        equals: _equality.equals,
        hashCode: _equality.hash,
      ),
  };
  for (final type in types) {
    for (final other in types) {
      switch (type.relationTo(other)) {
        case _Relation.equal:
        case _Relation.unrelated:
          break;
        case _Relation.subtype:
          graph[type]!.add(other);
        case _Relation.supertype:
          graph[other]!.add(type);
      }
    }
  }
  return topologicalSort(
    types,
    (type) => graph[type]!,
    equals: _equality.equals,
    hashCode: _equality.hash,
    // Provide a stable iteration order to help with codegen consistency.
    secondarySort: (a, b) {
      final aName = a.getDisplayString();
      final bName = b.getDisplayString();
      return aName.compareTo(bName);
    },
  );
}

const _equality = DartTypeEquality(ignoreNullability: true);

enum _Relation { equal, subtype, supertype, unrelated }

extension on DartType {
  _Relation relationTo(DartType other) {
    if (_equality.equals(this, other)) {
      return _Relation.equal;
    }
    if (typeHelper.typeSystem.isSubtypeOf(this, other)) {
      return _Relation.subtype;
    }
    if (typeHelper.typeSystem.isSubtypeOf(other, this)) {
      return _Relation.supertype;
    }
    return _Relation.unrelated;
  }
}
