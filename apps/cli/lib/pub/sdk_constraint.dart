import 'package:celest_cli/pub/language_version.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:pub_semver/pub_semver.dart';

/// There are special rules or interpreting SDK constraints, we take care to
/// save the original constraint as found in pubspec.yaml.
class SdkConstraint {
  SdkConstraint(
    this.effectiveConstraint, {
    VersionConstraint? originalConstraint,
  }) : originalConstraint = originalConstraint ?? effectiveConstraint;

  /// Implement support for down to 2.12 in the dart 3 series. Note that this
  /// function has to be be idempotent, because we apply it both when we write
  /// and read lock-file constraints, so applying this function a second time
  /// should have no further effect.
  factory SdkConstraint.interpretDartSdkConstraint(
    VersionConstraint originalConstraint, {
    required VersionConstraint? defaultUpperBoundConstraint,
  }) {
    var constraint = originalConstraint;
    if (defaultUpperBoundConstraint != null &&
        constraint is VersionRange &&
        constraint.max == null &&
        defaultUpperBoundConstraint.allowsAny(constraint)) {
      constraint = VersionConstraint.intersection([
        constraint,
        defaultUpperBoundConstraint,
      ]);
    }
    // If a package is null safe it should also be compatible with dart 3.
    // Therefore we rewrite a null-safety enabled constraint with the upper
    // bound <3.0.0 to be have upper bound <4.0.0
    //
    // Only do this rewrite after dart 3.
    if (Sdk.current.version.major >= 3 &&
        constraint is VersionRange &&
        LanguageVersion.fromSdkConstraint(constraint) >=
            LanguageVersion.firstVersionWithNullSafety &&
        // <3.0.0 is parsed into a max of 3.0.0-0, so that is what we look for
        // here.
        constraint.max == Version(3, 0, 0).firstPreRelease &&
        constraint.includeMax == false) {
      constraint = VersionRange(
        min: constraint.min,
        includeMin: constraint.includeMin,
        // We don't have to use .firstPreRelease as the constructor will do that
        // if needed.
        max: Version(4, 0, 0),
      );
    }
    return SdkConstraint(constraint, originalConstraint: originalConstraint);
  }

  // Flutter constraints get special treatment, as Flutter won't be using
  // semantic versioning to mark breaking releases. We simply ignore upper
  // bounds.
  factory SdkConstraint.interpretFlutterSdkConstraint(
    VersionConstraint constraint,
  ) {
    if (constraint is VersionRange) {
      return SdkConstraint(
        VersionRange(min: constraint.min, includeMin: constraint.includeMin),
        originalConstraint: constraint,
      );
    }
    return SdkConstraint(constraint);
  }

  /// The constraint as written in the pubspec.yaml.
  final VersionConstraint originalConstraint;

  /// The constraint as interpreted by pub.
  final VersionConstraint effectiveConstraint;

  /// The language version of a constraint is determined from how it is written.
  LanguageVersion get languageVersion =>
      LanguageVersion.fromSdkConstraint(originalConstraint);

  // We currently don't call this anywhere - so this is only for debugging
  // purposes.
  @override
  String toString() {
    if (effectiveConstraint != originalConstraint) {
      return '$originalConstraint (interpreted as $effectiveConstraint)';
    }
    return effectiveConstraint.toString();
  }

  @override
  bool operator ==(Object other) =>
      other is SdkConstraint &&
      other.effectiveConstraint == effectiveConstraint &&
      other.originalConstraint == originalConstraint;

  @override
  int get hashCode => Object.hash(effectiveConstraint, originalConstraint);
}
