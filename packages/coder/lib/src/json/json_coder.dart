import 'package:coder/coder.dart';

final class JsonCoder with Coder<Object?> {
  JsonCoder({
    required GlobalCoder coder,
  })  : encoder = JsonEncoder(coder: coder),
        decoder = JsonDecoder(coder: coder);

  @override
  final JsonEncoder encoder;

  @override
  final JsonDecoder decoder;
}
