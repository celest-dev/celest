import 'package:celest_cloud_core/celest_cloud_core.dart';
import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {
  group('PageToken', () {
    test('parses page token', () {
      final pageToken = PageToken(
        offset: 10,
        startTime: DateTime(2023, 1, 1),
        showDeleted: true,
      );
      final encoded = pageToken.encode();
      check(() => PageToken.parse(encoded)).returnsNormally().equals(pageToken);
    });

    test('returns empty page token', () {
      check(() => PageToken.parse('')).returnsNormally().equals(PageToken());
    });

    test('throws on invalid token', () {
      check(() => PageToken.parse('invalid')).throws<FormatException>();
    });
  });
}
