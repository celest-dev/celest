import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart';

@JsonLiteral('petstore_v2.json')
Map<String, Object> get petstoreV2Json => _$petstoreV2JsonJsonLiteral;

@JsonLiteral('petstore_v3.json')
Map<String, Object> get petstoreV3Json => _$petstoreV3JsonJsonLiteral;
