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
