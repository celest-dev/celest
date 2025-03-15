import 'package:celest_core/_internal.dart';
import 'package:test/test.dart';

void main() {
  test('globals', testOn: 'browser', () {
    expect(kDebugMode, true);
    expect(kIsWeb, true);
    expect(kIsDartNative, false);
    expect(kIsFlutter, false);
  });

  test('globals', testOn: 'vm', () {
    expect(kDebugMode, true);
    expect(kIsWeb, false);
    expect(kIsDartNative, true);
    expect(kIsFlutter, false);
  });
}
