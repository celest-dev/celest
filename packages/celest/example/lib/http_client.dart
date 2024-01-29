import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nsd/nsd.dart';

final class CelestHttpClient extends http.BaseClient {
  CelestHttpClient({
    required this.projectName,
    http.Client? baseClient,
  }) : _baseClient = baseClient ?? http.Client();

  final String projectName;
  final http.Client _baseClient;
  final AsyncCache<(String host, int port)> _celestIp = AsyncCache.ephemeral();

  Future<void> _init() async {
    print('Starting discovery');
    final discovery = await startDiscovery('_celest._tcp');
    print('Started discovery');
    discovery.addServiceListener((service, status) {
      print('Found service: $service, status: $status');
      switch (service) {
        case Service(:var host?, :final port?, :final name?)
            when name.startsWith(projectName):
          if (host.endsWith('.')) {
            host = host.substring(0, host.length - 1);
          }
          if (!_celestHost.isCompleted) {
            _celestHost.complete((host, port));
          }
        default:
          print('Skipping');
      }
    });
  }

  final _celestHost = Completer<(String, int)>();
  late final Future<void> _initialized = _init();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    print('Sending request to ${request.url}');
    if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
      print('Sending request to localhost');
      return _baseClient.send(request);
    }
    print('Sending request to celest.local');
    assert(!request.finalized);
    final (host, port) = await _celestIp.fetch(() async {
      await _initialized;
      return _celestHost.future;
    });
    final url = Uri(
      scheme: 'http',
      host: host,
      port: port,
      path: request.url.path,
      query: request.url.query,
      fragment: request.url.fragment,
    );
    final newRequest = switch (request) {
      final http.Request request => http.Request(request.method, url)
        ..headers.addAll(request.headers)
        ..bodyBytes = request.bodyBytes,
      _ => http.StreamedRequest(request.method, url)
        ..headers.addAll(request.headers)
        ..sink.addStream(request.finalize()),
    };
    return _baseClient.send(newRequest);
  }
}
