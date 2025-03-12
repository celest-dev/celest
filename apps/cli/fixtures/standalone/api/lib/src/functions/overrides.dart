/// Tests that types can be recursively overriden in the serialization protocol
/// using extension types.
library;

import 'package:celest/celest.dart';
import 'package:_common/_common.dart' as common;
import 'package:celest_backend/exceptions/overrides.dart';
import 'package:celest_backend/models/overrides.dart';

// These should all work the same way because the override is recursive and
// does not have to be used directly to apply.

@cloud
common.NestedParent commonNestedParent(common.NestedParent parent) => parent;
@cloud
common.NestedChild commonNestedChild(common.NestedChild child) => child;
@cloud
NestedGrandparent nestedGrandparent(NestedGrandparent grandparent) =>
    grandparent;
@cloud
NestedParent nestedParent(NestedParent parent) => parent;
@cloud
NestedChild nestedChild(NestedChild child) => child;

@cloud
void callsThrowsCommonOverriddenException() {
  common.throwsOverriddenException();
}

@cloud
void throwsCommonOverriddenException() {
  throw common.OverriddenException('message');
}

@cloud
void throwsOverriddenException() {
  throw OverriddenException(common.OverriddenException('message'));
}

@cloud
void callsThrowsOverriddenException() {
  throwsOverriddenException();
}
