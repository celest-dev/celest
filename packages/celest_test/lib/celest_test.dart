import 'dart:io';

import 'package:celest_core/_internal.dart';
import 'package:celest_test/src/vm_service_factory.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';
import 'package:vm_service/vm_service.dart';

/// A helper class for running integration tests with Celest.
final class CelestTester {
  CelestTester._(this._vmService);

  /// Connects to the Celest service running at the given [wsUri].
  ///
  /// Typically, this value is populated automatically by running
  /// `celest start` followed by a command like `flutter test`.
  static Future<CelestTester> connect({
    String wsUri = const String.fromEnvironment('CELEST_SERVICE_WS_URI'),
  }) async {
    _logger.fine('Connecting to Celest service: $wsUri');

    Uri uri = Uri.parse(wsUri);
    if (uri.host case '127.0.0.1' || 'localhost'
        when !kIsWeb && Platform.isAndroid) {
      uri = uri.replace(host: '10.0.2.2');
    }

    final VmService vmService = await vmServiceConnect(uri);
    await vmService.streamListen(EventStreams.kExtension);

    final tester = CelestTester._(vmService);
    addTearDown(tester.close);
    return tester;
  }

  static final Logger _logger = Logger('CelestTester');

  final VmService _vmService;

  /// Auth-related test helpers.
  late final CelestAuthTester auth = CelestAuthTester._(_vmService);

  /// Closes the connection to the VM service.
  Future<void> close() async {
    await _vmService.dispose();
  }
}

/// An OTP code sent by the server.
typedef Otp = ({String to, String code});

/// A helper class for running integration tests with Celest Auth.
final class CelestAuthTester {
  CelestAuthTester._(this._vmService);

  final VmService _vmService;

  /// OTP codes sent to users during sign up/sign in.
  Stream<Otp> get onSentOtp async* {
    await for (final Event event in _vmService.onExtensionEvent) {
      if (event.extensionKind != 'celest.cloud_auth.emailOtpSent') {
        continue;
      }
      final Map<String, dynamic> data = event.extensionData!.data;
      yield (to: data['to'] as String, code: data['code'] as String);
    }
  }
}
