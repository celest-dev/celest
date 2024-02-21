extension type StringX(String s) {}
extension type StringXImpl(String s) implements String {}
extension type StringXToFromJson(String s) {
  StringXToFromJson.fromJson(this.s);

  String toJson() => String.fromCharCodes(s.codeUnits.reversed);
}
extension type StringXToJson(String s) {
  String toJson() => String.fromCharCodes(s.codeUnits.reversed);
}
extension type StringXToJsonImpl(String s) implements String {
  String toJson() => String.fromCharCodes(s.codeUnits.reversed);
}
extension type StringXFromJson(String s) {
  StringXFromJson.fromJson(String s)
      : s = String.fromCharCodes(s.codeUnits.reversed);
}
extension type StringXFromJsonImpl(String s) implements String {
  StringXFromJsonImpl.fromJson(String s)
      : s = String.fromCharCodes(s.codeUnits.reversed);
}
extension type StringXFromJsonStatic(String s) {
  static StringXFromJsonStatic fromJson(String s) =>
      StringXFromJsonStatic(String.fromCharCodes(s.codeUnits.reversed));
}
extension type StringXPrivateField(String _) {}
extension type StringXPrivateFieldImpl(String _) implements String {}
extension type StringXPrivateCtor._(String s) {}
extension type StringXPrivateCtorImpl._(String s) implements String {}

class Value {
  const Value(this.value);

  factory Value.fromJson(String value) => Value(value);

  final String value;

  String toJson() => value;
}

extension type const ValueX(Value v) {}
extension type const ValueXImpl(Value v) implements Value {}
extension type const ValueXToFromJson(Value v) {
  ValueXToFromJson.fromJson(String value) : v = Value('${value}FromJson');

  String toJson() => '${v.value}ToJson';
}
extension type const ValueXToJson(Value v) {
  Map<String, Object?> toJson() => {'value': '${v.value}ToJson'};
}
extension type const ValueXToJsonImpl(Value v) implements Value {
  String toJson() => '${v.value}ToJson';
}
extension type const ValueXFromJson(Value v) {
  ValueXFromJson.fromJson(Map<String, Object?> json)
      : v = Value('${json['value']}FromJson');
}
extension type const ValueXFromJsonImpl(Value v) implements Value {
  ValueXFromJsonImpl.fromJson(String value) : v = Value('${value}FromJson');
}
extension type const ValueXFromJsonStatic(Value v) {
  static ValueXFromJsonStatic fromJson(Map<String, Object?> json) =>
      ValueXFromJsonStatic(Value('${json['value']}FromJson'));
}
extension type const ValueXToFromJsonCombined(Value v)
    implements ValueXToJson, ValueXFromJson {}
extension type const ValueXImplIndirect(Value v) implements ValueXImpl {}

enum Color {
  red,
  green,
  blue;

  factory Color.fromJson(String value) => switch (value) {
        'r' => red,
        'g' => green,
        'b' => blue,
        _ => throw ArgumentError.value(value, 'value', 'Invalid color'),
      };

  String toJson() => switch (this) {
        red => 'r',
        green => 'g',
        blue => 'b',
      };
}

extension type const ColorX(Color c) {}
extension type const ColorXImpl(Color c) implements Color {}
extension type const ColorXToFromJson(Color c) {
  ColorXToFromJson.fromJson(String value)
      : c = switch (value) {
          'RED' => Color.red,
          'GREEN' => Color.green,
          'BLUE' => Color.blue,
          _ => throw ArgumentError.value(value, 'value', 'Invalid color'),
        };

  String toJson() => c.name.toUpperCase();
}
extension type const ColorXToJson(Color c) {
  String toJson() => c.name.toUpperCase();
}
extension type const ColorXToJsonImpl(Color c) implements Color {
  String toJson() => c.name.toUpperCase();
}
extension type const ColorXFromJson(Color c) {
  ColorXFromJson.fromJson(String value)
      : c = switch (value) {
          'RED' => Color.red,
          'GREEN' => Color.green,
          'BLUE' => Color.blue,
          _ => throw ArgumentError.value(value, 'value', 'Invalid color'),
        };
}
extension type const ColorXFromJsonImpl(Color c) implements Color {
  ColorXFromJsonImpl.fromJson(String value)
      : c = switch (value) {
          'RED' => Color.red,
          'GREEN' => Color.green,
          'BLUE' => Color.blue,
          _ => throw ArgumentError.value(value, 'value', 'Invalid color'),
        };
}
extension type const ColorXFromJsonStatic(Color c) {
  static ColorXFromJsonStatic fromJson(String value) => switch (value) {
        'RED' => Color.red,
        'GREEN' => Color.green,
        'BLUE' => Color.blue,
        _ => throw ArgumentError.value(value, 'value', 'Invalid color'),
      } as ColorXFromJsonStatic;
}
extension type const ColorXToFromJsonCombined(Color c)
    implements ColorXToJson, ColorXFromJson {}
extension type const ColorXImplIndirect(Color c) implements ColorXImpl {}
