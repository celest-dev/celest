import 'package:localhost/localhost.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

void main() {
  group('LocalClient', () {
    setUp(() {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((record) {
        print('[${record.level.name}] ${record.message}');
        if (record.error case final error?) {
          print(error);
          if (record.stackTrace case final stackTrace?) {
            print(stackTrace);
          }
        }
      });
    });

    test('Darwin', testOn: 'mac-os', () async {
      final client = LocalClient();
      await for (final service in client.discover(type: '_ssh._tcp')) {
        print(service);
      }
    });
  });
}
