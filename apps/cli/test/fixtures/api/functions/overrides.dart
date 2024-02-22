/// Tests that types can be recursively overriden in the serialization protocol
/// using extension types.
library;

import 'package:_common/_common.dart' as common;
import 'package:celest_backend/exceptions/overrides.dart';
import 'package:celest_backend/models/overrides.dart';

// These should all work the same way because the override is recursive and
// does not have to be used directly to apply.

common.NestedParent commonNestedParent(common.NestedParent parent) => parent;
common.NestedChild commonNestedChild(common.NestedChild child) => child;
NestedGrandparent nestedGrandparent(NestedGrandparent grandparent) =>
    grandparent;
NestedParent nestedParent(NestedParent parent) => parent;
NestedChild nestedChild(NestedChild child) => child;

void callsThrowsCommonOverriddenException() {
  common.throwsOverriddenException();
}

void throwsCommonOverriddenException() {
  throw common.OverriddenException('message');
}

void throwsOverriddenException() {
  throw OverriddenException(common.OverriddenException('message'));
}

void callsThrowsOverriddenException() {
  throwsOverriddenException();
}
