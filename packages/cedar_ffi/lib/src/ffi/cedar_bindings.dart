// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:cedar_ffi/src/ffi/cedar_bindings.bundled.ffi.dart' as bundled;
import 'package:cedar_ffi/src/ffi/cedar_bindings.loaded.ffi.dart' as loaded;

export 'package:cedar_ffi/src/ffi/cedar_bindings.symbols.ffi.dart';

final bindings = CedarBindings._();

enum _LinkMode { bundled, loaded }

final class CedarBindings {
  CedarBindings._() {
    try {
      Native.addressOf<NativeFunction<loaded.NativeCedar_init>>(
          loaded.cedar_init);
      _linkMode = _LinkMode.loaded;
    } on Object {
      Native.addressOf<NativeFunction<loaded.NativeCedar_init>>(
          bundled.cedar_init);
      _linkMode = _LinkMode.bundled;
    }
  }

  late final _LinkMode _linkMode;

  late final cedar_init =
      _linkMode == _LinkMode.loaded ? loaded.cedar_init : bundled.cedar_init;

  late final cedar_deinit = _linkMode == _LinkMode.loaded
      ? loaded.cedar_deinit
      : bundled.cedar_deinit;

  late final cedar_is_authorized = _linkMode == _LinkMode.loaded
      ? loaded.cedar_is_authorized
      : bundled.cedar_is_authorized;

  late final cedar_link_policy_template = _linkMode == _LinkMode.loaded
      ? loaded.cedar_link_policy_template
      : bundled.cedar_link_policy_template;

  late final cedar_parse_policy_set = _linkMode == _LinkMode.loaded
      ? loaded.cedar_parse_policy_set
      : bundled.cedar_parse_policy_set;
}
