class MyAnnotation {
  const MyAnnotation.create(this.positional, {required this.named});

  final String positional;
  final String named;
}

enum LiteralEnum { a, b, c }

class Literals {
  const Literals({
    required this.string,
    required this.intValue,
    required this.doubleValue,
    required this.boolValue,
    required this.list,
    required this.map,
    required this.enumValue,
    required this.recordValue,
  });

  final String string;
  final int intValue;
  final double doubleValue;
  final bool boolValue;
  final List<String> list;
  final Map<String, String> map;
  final LiteralEnum enumValue;
  final ({String a, String b, String c}) recordValue;
}

class _NotExportable {
  const _NotExportable();
}

class Exportable {
  const Exportable();

  static const instance = Exportable();
}

const exportable = Exportable();
const notExportable = _NotExportable();

class Serializable {
  const Serializable([this.type]);
  const Serializable.forType(String this.type);

  static const string = Serializable.forType('String');

  final String? type;
}
