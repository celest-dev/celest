// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_configuration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SdkType _$dart = const SdkType._('dart');
const SdkType _$flutter = const SdkType._('flutter');

SdkType _$SdkTypeValueOf(String name) {
  switch (name) {
    case 'dart':
      return _$dart;
    case 'flutter':
      return _$flutter;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SdkType> _$SdkTypeValues = BuiltSet<SdkType>(const <SdkType>[
  _$dart,
  _$flutter,
]);

const FeatureFlag _$streaming = const FeatureFlag._('streaming');

FeatureFlag _$FeatureFlagValueOf(String name) {
  switch (name) {
    case 'streaming':
      return _$streaming;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<FeatureFlag> _$FeatureFlagValues = BuiltSet<FeatureFlag>(
  const <FeatureFlag>[_$streaming],
);

Serializer<SdkType> _$sdkTypeSerializer = _$SdkTypeSerializer();
Serializer<SdkConfiguration> _$sdkConfigurationSerializer =
    _$SdkConfigurationSerializer();
Serializer<Sdk> _$sdkSerializer = _$SdkSerializer();
Serializer<FeatureFlag> _$featureFlagSerializer = _$FeatureFlagSerializer();

class _$SdkTypeSerializer implements PrimitiveSerializer<SdkType> {
  @override
  final Iterable<Type> types = const <Type>[SdkType];
  @override
  final String wireName = 'SdkType';

  @override
  Object serialize(
    Serializers serializers,
    SdkType object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  SdkType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => SdkType.valueOf(serialized as String);
}

class _$SdkConfigurationSerializer
    implements StructuredSerializer<SdkConfiguration> {
  @override
  final Iterable<Type> types = const [SdkConfiguration, _$SdkConfiguration];
  @override
  final String wireName = 'SdkConfiguration';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SdkConfiguration object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'celest',
      serializers.serialize(
        object.celest,
        specifiedType: const FullType(Version),
      ),
      'dart',
      serializers.serialize(object.dart, specifiedType: const FullType(Sdk)),
      'targetSdk',
      serializers.serialize(
        object.targetSdk,
        specifiedType: const FullType(SdkType),
      ),
      'featureFlags',
      serializers.serialize(
        object.featureFlags,
        specifiedType: const FullType(BuiltSet, const [
          const FullType(FeatureFlag),
        ]),
      ),
    ];
    Object? value;
    value = object.flutter;
    if (value != null) {
      result
        ..add('flutter')
        ..add(serializers.serialize(value, specifiedType: const FullType(Sdk)));
    }
    return result;
  }

  @override
  SdkConfiguration deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SdkConfigurationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'celest':
          result.celest =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Version),
                  )!
                  as Version;
          break;
        case 'dart':
          result.dart.replace(
            serializers.deserialize(value, specifiedType: const FullType(Sdk))!
                as Sdk,
          );
          break;
        case 'flutter':
          result.flutter.replace(
            serializers.deserialize(value, specifiedType: const FullType(Sdk))!
                as Sdk,
          );
          break;
        case 'targetSdk':
          result.targetSdk =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(SdkType),
                  )!
                  as SdkType;
          break;
        case 'featureFlags':
          result.featureFlags.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltSet, const [
                    const FullType(FeatureFlag),
                  ]),
                )!
                as BuiltSet<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$SdkSerializer implements StructuredSerializer<Sdk> {
  @override
  final Iterable<Type> types = const [Sdk, _$Sdk];
  @override
  final String wireName = 'Sdk';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Sdk object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'type',
      serializers.serialize(
        object.type,
        specifiedType: const FullType(SdkType),
      ),
      'version',
      serializers.serialize(
        object.version,
        specifiedType: const FullType(Version),
      ),
      'enabledExperiments',
      serializers.serialize(
        object.enabledExperiments,
        specifiedType: const FullType(BuiltSet, const [const FullType(String)]),
      ),
    ];

    return result;
  }

  @override
  Sdk deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SdkBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(SdkType),
                  )!
                  as SdkType;
          break;
        case 'version':
          result.version =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Version),
                  )!
                  as Version;
          break;
        case 'enabledExperiments':
          result.enabledExperiments.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltSet, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltSet<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$FeatureFlagSerializer implements PrimitiveSerializer<FeatureFlag> {
  @override
  final Iterable<Type> types = const <Type>[FeatureFlag];
  @override
  final String wireName = 'FeatureFlag';

  @override
  Object serialize(
    Serializers serializers,
    FeatureFlag object, {
    FullType specifiedType = FullType.unspecified,
  }) => object.name;

  @override
  FeatureFlag deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => FeatureFlag.valueOf(serialized as String);
}

class _$SdkConfiguration extends SdkConfiguration {
  @override
  final Version celest;
  @override
  final Sdk dart;
  @override
  final Sdk? flutter;
  @override
  final SdkType targetSdk;
  @override
  final BuiltSet<FeatureFlag> featureFlags;

  factory _$SdkConfiguration([
    void Function(SdkConfigurationBuilder)? updates,
  ]) => (SdkConfigurationBuilder()..update(updates))._build();

  _$SdkConfiguration._({
    required this.celest,
    required this.dart,
    this.flutter,
    required this.targetSdk,
    required this.featureFlags,
  }) : super._();
  @override
  SdkConfiguration rebuild(void Function(SdkConfigurationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SdkConfigurationBuilder toBuilder() =>
      SdkConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SdkConfiguration &&
        celest == other.celest &&
        dart == other.dart &&
        flutter == other.flutter &&
        targetSdk == other.targetSdk &&
        featureFlags == other.featureFlags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, celest.hashCode);
    _$hash = $jc(_$hash, dart.hashCode);
    _$hash = $jc(_$hash, flutter.hashCode);
    _$hash = $jc(_$hash, targetSdk.hashCode);
    _$hash = $jc(_$hash, featureFlags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SdkConfiguration')
          ..add('celest', celest)
          ..add('dart', dart)
          ..add('flutter', flutter)
          ..add('targetSdk', targetSdk)
          ..add('featureFlags', featureFlags))
        .toString();
  }
}

class SdkConfigurationBuilder
    implements Builder<SdkConfiguration, SdkConfigurationBuilder> {
  _$SdkConfiguration? _$v;

  Version? _celest;
  Version? get celest => _$this._celest;
  set celest(Version? celest) => _$this._celest = celest;

  SdkBuilder? _dart;
  SdkBuilder get dart => _$this._dart ??= SdkBuilder();
  set dart(SdkBuilder? dart) => _$this._dart = dart;

  SdkBuilder? _flutter;
  SdkBuilder get flutter => _$this._flutter ??= SdkBuilder();
  set flutter(SdkBuilder? flutter) => _$this._flutter = flutter;

  SdkType? _targetSdk;
  SdkType? get targetSdk => _$this._targetSdk;
  set targetSdk(SdkType? targetSdk) => _$this._targetSdk = targetSdk;

  SetBuilder<FeatureFlag>? _featureFlags;
  SetBuilder<FeatureFlag> get featureFlags =>
      _$this._featureFlags ??= SetBuilder<FeatureFlag>();
  set featureFlags(SetBuilder<FeatureFlag>? featureFlags) =>
      _$this._featureFlags = featureFlags;

  SdkConfigurationBuilder();

  SdkConfigurationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _celest = $v.celest;
      _dart = $v.dart.toBuilder();
      _flutter = $v.flutter?.toBuilder();
      _targetSdk = $v.targetSdk;
      _featureFlags = $v.featureFlags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SdkConfiguration other) {
    _$v = other as _$SdkConfiguration;
  }

  @override
  void update(void Function(SdkConfigurationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SdkConfiguration build() => _build();

  _$SdkConfiguration _build() {
    _$SdkConfiguration _$result;
    try {
      _$result =
          _$v ??
          _$SdkConfiguration._(
            celest: BuiltValueNullFieldError.checkNotNull(
              celest,
              r'SdkConfiguration',
              'celest',
            ),
            dart: dart.build(),
            flutter: _flutter?.build(),
            targetSdk: BuiltValueNullFieldError.checkNotNull(
              targetSdk,
              r'SdkConfiguration',
              'targetSdk',
            ),
            featureFlags: featureFlags.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dart';
        dart.build();
        _$failedField = 'flutter';
        _flutter?.build();

        _$failedField = 'featureFlags';
        featureFlags.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'SdkConfiguration',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Sdk extends Sdk {
  @override
  final SdkType type;
  @override
  final Version version;
  @override
  final BuiltSet<String> enabledExperiments;

  factory _$Sdk([void Function(SdkBuilder)? updates]) =>
      (SdkBuilder()..update(updates))._build();

  _$Sdk._({
    required this.type,
    required this.version,
    required this.enabledExperiments,
  }) : super._();
  @override
  Sdk rebuild(void Function(SdkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SdkBuilder toBuilder() => SdkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sdk &&
        type == other.type &&
        version == other.version &&
        enabledExperiments == other.enabledExperiments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, enabledExperiments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Sdk')
          ..add('type', type)
          ..add('version', version)
          ..add('enabledExperiments', enabledExperiments))
        .toString();
  }
}

class SdkBuilder implements Builder<Sdk, SdkBuilder> {
  _$Sdk? _$v;

  SdkType? _type;
  SdkType? get type => _$this._type;
  set type(SdkType? type) => _$this._type = type;

  Version? _version;
  Version? get version => _$this._version;
  set version(Version? version) => _$this._version = version;

  SetBuilder<String>? _enabledExperiments;
  SetBuilder<String> get enabledExperiments =>
      _$this._enabledExperiments ??= SetBuilder<String>();
  set enabledExperiments(SetBuilder<String>? enabledExperiments) =>
      _$this._enabledExperiments = enabledExperiments;

  SdkBuilder();

  SdkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _version = $v.version;
      _enabledExperiments = $v.enabledExperiments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sdk other) {
    _$v = other as _$Sdk;
  }

  @override
  void update(void Function(SdkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Sdk build() => _build();

  _$Sdk _build() {
    _$Sdk _$result;
    try {
      _$result =
          _$v ??
          _$Sdk._(
            type: BuiltValueNullFieldError.checkNotNull(type, r'Sdk', 'type'),
            version: BuiltValueNullFieldError.checkNotNull(
              version,
              r'Sdk',
              'version',
            ),
            enabledExperiments: enabledExperiments.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'enabledExperiments';
        enabledExperiments.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Sdk', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
