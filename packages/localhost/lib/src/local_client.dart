import 'package:localhost/localhost.dart';
import 'package:localhost/src/darwin/local_client.darwin.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract interface class LocalClient {
  factory LocalClient() {
    if (os.isMacOS || os.isIOS) {
      return LocalClientDarwin();
    }
    throw UnsupportedError('The current platform is not supported');
  }

  Stream<LocalService> discover({
    required String type,
    String? domain,
  });

  Future<LocalService?> find({
    required String type,
    required String name,
    String? domain,
  });
}
