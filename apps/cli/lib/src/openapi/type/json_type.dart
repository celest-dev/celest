import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'json_type.g.dart';

class JsonType extends EnumClass {
  const JsonType._(super.name);

  static const JsonType array = _$array;
  static const JsonType object = _$object;
  static const JsonType boolean = _$boolean;
  static const JsonType number = _$number;
  static const JsonType integer = _$integer;
  static const JsonType string = _$string;

  @BuiltValueEnumConst(wireName: 'null')
  static const JsonType null$ = _$null$;

  static BuiltSet<JsonType> get values => _$JsonTypeValues;
  static JsonType valueOf(String name) => _$JsonTypeValueOf(name);

  static JsonType fromYaml(String yaml) => switch (yaml) {
        'null' => null$,
        _ => valueOf(yaml),
      };

  String toYaml() => switch (this) {
        null$ => 'null',
        _ => name,
      };

  static Serializer<JsonType> get serializer => _$jsonTypeSerializer;
}
