import 'package:cedar/cedar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'corpus.g.dart';

@JsonLiteral('corpus.json', asConst: true)
Map<String, Map<String, Object?>> get _corpusTestData =>
    _$_corpusTestDataJsonLiteral;

final Map<String, CedarTest> cedarCorpusTests = _corpusTestData.map(
  (key, value) => MapEntry(key, CedarTest.fromJson(value)),
);

const _serializable = JsonSerializable(
  anyMap: true,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
);

@_serializable
final class CedarTest {
  const CedarTest({
    required this.name,
    required this.schemaJson,
    required this.policiesCedar,
    required this.shouldValidate,
    required this.entitiesJson,
    required this.queries,
  });

  factory CedarTest.fromJson(Map json) => _$CedarTestFromJson(json);

  final String name;
  final Map<String, Object?> schemaJson;
  final String policiesCedar;
  final bool shouldValidate;
  final List<Object?> entitiesJson;
  final List<CedarQuery> queries;

  Map<String, Object?> toJson() => _$CedarTestToJson(this);
}

@_serializable
final class CedarQuery {
  const CedarQuery({
    required this.description,
    required this.principal,
    required this.resource,
    required this.action,
    required this.context,
    required this.decision,
    required this.reasons,
    required this.errors,
  });

  factory CedarQuery.fromJson(Map json) => _$CedarQueryFromJson(json);

  @JsonKey(name: 'desc')
  final String description;
  final CedarEntityId? principal;
  final CedarEntityId? resource;
  final CedarEntityId action;
  final Map<String, Object?> context;
  final CedarAuthorizationDecision decision;
  final List<String> reasons;
  final List<String> errors;

  Map<String, Object?> toJson() => _$CedarQueryToJson(this);
}
