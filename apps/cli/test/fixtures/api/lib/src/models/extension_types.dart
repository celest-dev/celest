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
