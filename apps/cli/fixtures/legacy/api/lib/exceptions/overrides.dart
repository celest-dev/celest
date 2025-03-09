import 'package:celest/celest.dart';
import 'package:_common/_common.dart' as common;

@customOverride
extension type const OverriddenException(common.OverriddenException _)
    implements common.OverriddenException {}
