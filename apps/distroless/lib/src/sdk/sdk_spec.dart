import 'dart:ffi';

import 'package:pub_semver/pub_semver.dart';

typedef SdkSpec = ({
  List<Abi> archs,
  VersionConstraint versionConstraint,
});
