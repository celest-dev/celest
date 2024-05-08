import 'package:libcoder/libcoder.dart';

final class FormFieldsCoder with Coder<Object> {
  FormFieldsCoder({
    required GlobalCoder coder,
  }) : encoder = FormFieldsEncoder(coder: coder);

  @override
  final FormFieldsEncoder encoder;

  @override
  Decoder<Object> get decoder => throw UnimplementedError();
}
