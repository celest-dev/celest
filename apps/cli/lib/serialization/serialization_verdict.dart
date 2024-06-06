import 'package:celest_cli/serialization/serialization_spec.dart';
import 'package:source_span/source_span.dart';

sealed class Verdict {
  const Verdict();

  const factory Verdict.yes({
    SerializationSpec? primarySpec,
    Set<SerializationSpec> additionalSpecs,
  }) = VerdictYes;
  factory Verdict.no(
    String reason, {
    FileSpan? location,
  }) = VerdictNo.single;

  bool get isSerializable;
  List<VerdictReason> get reasons;

  Verdict operator &(Verdict other) => switch ((this, other)) {
        (
          VerdictYes(
            primarySpec: final primarySpecThis,
            additionalSpecs: final additionalSpecsThis
          ),
          VerdictYes(
            primarySpec: final primarySpecOther,
            additionalSpecs: final additionalSpecsOther
          )
        ) =>
          Verdict.yes(
            primarySpec: primarySpecThis,
            additionalSpecs: {
              if (primarySpecOther != null) primarySpecOther,
              ...additionalSpecsThis,
              ...additionalSpecsOther,
            },
          ),
        (VerdictYes(), final VerdictNo no) ||
        (final VerdictNo no, VerdictYes()) =>
          no,
        (
          VerdictNo(reasons: final reasonsThis),
          VerdictNo(reasons: final reasonsOther)
        ) =>
          VerdictNo([...reasonsThis, ...reasonsOther]),
      };

  Verdict withPrimarySpec(SerializationSpec spec);
  Verdict withAdditionalSpec(SerializationSpec spec);
}

final class VerdictYes extends Verdict {
  const VerdictYes({
    this.primarySpec,
    this.additionalSpecs = const {},
  });

  @override
  bool get isSerializable => true;

  final SerializationSpec? primarySpec;
  final Set<SerializationSpec> additionalSpecs;

  @override
  Verdict withPrimarySpec(SerializationSpec spec) => Verdict.yes(
        primarySpec: spec,
        additionalSpecs: additionalSpecs,
      );

  @override
  Verdict withAdditionalSpec(SerializationSpec spec) => Verdict.yes(
        primarySpec: primarySpec,
        additionalSpecs: {
          ...additionalSpecs,
          spec,
        },
      );

  @override
  List<VerdictReason> get reasons => const [];
}

final class VerdictNo extends Verdict {
  const VerdictNo(this.reasons);
  VerdictNo.single(
    String reason, {
    FileSpan? location,
  }) : reasons = [VerdictReason(reason, location: location)];

  @override
  bool get isSerializable => false;

  @override
  final List<VerdictReason> reasons;

  @override
  Verdict withPrimarySpec(SerializationSpec spec) => this;

  @override
  Verdict withAdditionalSpec(SerializationSpec spec) => this;

  @override
  String toString() => reasons.join('; ');
}

final class VerdictReason {
  const VerdictReason(this.reason, {this.location});

  final String reason;
  final FileSpan? location;

  @override
  String toString() => reason;
}
