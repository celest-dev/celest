import 'package:json_annotation/json_annotation.dart';

part 'fixtures.g.dart';

@JsonLiteral('fixtures/petstore_v2.json', asConst: true)
Map<String, Object> get petstoreV2Json => _$petstoreV2JsonJsonLiteral;

@JsonLiteral('fixtures/petstore_v3.json', asConst: true)
Map<String, Object> get petstoreV3Json => _$petstoreV3JsonJsonLiteral;

@JsonLiteral('fixtures/pet_discriminator_v3.json', asConst: true)
Map<String, Object> get petDiscriminatorV3Json =>
    _$petDiscriminatorV3JsonJsonLiteral;

@JsonLiteral('fixtures/bookstore_v3.json', asConst: true)
Map<String, Object> get bookstoreV3Json => _$bookstoreV3JsonJsonLiteral;

@JsonLiteral('fixtures/stripe/spec3.json', asConst: true)
Map<String, Object> get stripeSpecV3Json => _$stripeSpecV3JsonJsonLiteral;

@JsonLiteral('fixtures/stripe/spec3.sdk.json', asConst: true)
Map<String, Object> get stripeSpecV3SdkJson => _$stripeSpecV3SdkJsonJsonLiteral;
