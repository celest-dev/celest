import 'package:coder/coder.dart';
import 'package:coder/src/form_data/form_data_encoder.dart';

final class FormDataCoder with Coder<String> {
  FormDataCoder({
    required GlobalCoder coder,
  }) : encoder = FormDataEncoder(coder: coder);

  @override
  final FormDataEncoder encoder;

  @override
  Decoder<String> get decoder => throw UnimplementedError();
}
