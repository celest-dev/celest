import 'dart:io';

import 'package:logging/logging.dart';
import 'package:test/test.dart';
import 'package:vm_service/vm_service.dart';
import 'package:vm_service/vm_service_io.dart';

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

    var uri = Uri.parse(wsUri);
    if (uri.host case '127.0.0.1' || 'localhost' when Platform.isAndroid) {
      uri = uri.replace(host: '10.0.2.2');
    }

    final vmService = await vmServiceConnectUri(uri.toString());
    await vmService.streamListen(EventStreams.kExtension);

    final tester = CelestTester._(vmService);
    addTearDown(tester.close);
    return tester;
  }

  static final Logger _logger = Logger('CelestTester');

  final VmService _vmService;

  /// Closes the connection to the VM service.
  Future<void> close() async {
    await _vmService.dispose();
  }
}
