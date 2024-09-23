import 'package:celest_core/_internal.dart';
import 'package:test/test.dart';

void main() {
  group('Uuid', () {
    test('v7', () {
      final uuid = Uuid.v7();
      final rt = Uuid.parse(uuid.hexValue);
      expect(uuid.value, rt.value);
    });
  });
}
