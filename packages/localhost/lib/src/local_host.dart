import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:localhost/src/darwin/local_host.darwin.dart';
import 'package:localhost/src/dns.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

abstract base class LocalHost {
  @protected
  LocalHost.base({
    required this.projectName,
    required this.localPort,
  });

  static LocalHost? create({
    required String projectName,
    required int localPort,
  }) {
    if (Platform.isMacOS) {
      return LocalHostDarwin(
        projectName: projectName,
        localPort: localPort,
      );
    }
    return null;
  }

  final String projectName;
  final int localPort;

  Future<void> start();
  Future<void> stop();
}

final class _LocalHost extends LocalHost {
  _LocalHost({
    required super.projectName,
    required super.localPort,
  }) : super.base();

  static final Logger _logger = Logger('MdnsService');
  static final InternetAddress _mdnsAddr = InternetAddress('224.0.0.251');

  var _started = false;

  final List<_MdnsSocket> _sockets = [];
  late final List<NetworkInterface> _interfaces;

  @override
  Future<void> start() async {
    _logger.fine('Starting mDNS service');

    final incoming = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      5353,
      reuseAddress: true,
      reusePort: true,
      ttl: 255,
    );
    _sockets.add(
      _MdnsSocket(
        service: this,
        socket: incoming,
        interface: _NetworkInterface(),
      ),
    );

    _interfaces = await NetworkInterface.list(
      includeLinkLocal: true,
      includeLoopback: true,
      type: InternetAddressType.any,
    );
    for (final interface in _interfaces) {
      if (interface.addresses
          .any((addr) => addr.type == InternetAddressType.IPv4)) {
        incoming.joinMulticast(_mdnsAddr, interface);
      }
    }

    _started = true;
    _logger.fine('Started mDNS service');
  }

  @override
  Future<void> stop() async {
    if (!_started) {
      return;
    }
    _logger.fine('Stopping mDNS service');
    _started = false;
    for (final socket in _sockets) {
      socket.close();
    }
    _sockets.clear();
  }
}

final class _MdnsSocket {
  _MdnsSocket({
    required this.service,
    required this.socket,
    required this.interface,
  }) {
    _subscription = socket.listen(_handleSocketEvent);
  }

  final _LocalHost service;
  final RawDatagramSocket socket;
  final NetworkInterface interface;
  late final StreamSubscription<RawSocketEvent> _subscription;

  late final Logger _logger = Logger('MdnsService.${interface.name}');

  void _handleSocketEvent(RawSocketEvent event) {
    switch (event) {
      case RawSocketEvent.read:
        _logger.finest('Socket read on ${interface.name}');
        final datagram = socket.receive();
        if (datagram == null) {
          return;
        }
        _logger.finest(
          'Received datagram from ${datagram.address}:${datagram.port}: '
          '${datagram.data}',
        );
        final response = _handleDatagram(datagram);
        if (response != null) {
          _logger.fine('Replying to query: $response');
          for (final socket in service._sockets) {
            Timer.run(() {
              socket.socket.send(
                response.encode(),
                _LocalHost._mdnsAddr,
                5353,
              );
            });
          }
        }
      case RawSocketEvent.write:
        _logger.finest('Socket write on ${interface.name}');
      case RawSocketEvent.readClosed:
      case RawSocketEvent.closed:
        _logger.fine('Socket closed on ${interface.name}');
    }
  }

  DnsResponse? _handleDatagram(Datagram datagram) {
    final header = DnsHeader.decode(datagram.data);
    if (header.questions != 1) {
      _logger.fine(
        'Skipping query with length=${datagram.data.length}, header: $header',
      );
      return null;
    }
    _logger.fine('Received query on ${interface.name}: $header');
    final response = DnsResponseBuilder(
      header: DnsHeader(
        id: header.id,
        flags: 0x8400,
        questions: 0,
        answers: 1,
        authorityRecords: 0,
        additionalRecords: 0,
      ),
    );
    final question = DnsQuestion.decode(datagram.data, DnsHeader.length);
    _logger.fine('Question: $question');
    final type = question.type;
    if (type == null) {
      _logger.fine('Skipping question');
      return null;
    }
    if (question.cls != ResourceRecordClass.IN) {
      _logger.fine('Skipping question');
      return null;
    }
    if (!question.fqdn.contains('${service.projectName}.celest')) {
      _logger.fine('Skipping question');
      return null;
    }
    _logger.fine('Responding to question');
    final allAddrs =
        service._interfaces.expand((interface) => interface.addresses);
    final addrs = switch (type) {
      ResourceRecordType.A =>
        allAddrs.where((element) => element.type == InternetAddressType.IPv4),
      ResourceRecordType.AAAA =>
        allAddrs.where((element) => element.type == InternetAddressType.IPv6),
    };
    for (final addr in addrs) {
      response.answers.add(
        ResourceRecord(
          name: question.fqdn,
          type: type,
          cls: ResourceRecordClass.IN,
          ttl: 120,
          data: addr.rawAddress,
        ),
      );
    }
    if (response.answers.isEmpty) {
      return null;
    }
    return response.build();
  }

  void close() {
    _subscription.cancel();
    socket.close();
  }
}

extension on InternetAddress {
  InternetAddress toIpV6() {
    if (type == InternetAddressType.IPv6) {
      return this;
    }
    final bytes = rawAddress;
    final buffer = Uint8List(16);
    buffer.setRange(0, 10, bytes);
    buffer[10] = 0xff;
    buffer[11] = 0xff;
    buffer.setRange(12, 16, bytes, 10);
    return InternetAddress.fromRawAddress(
      buffer,
      type: InternetAddressType.IPv6,
    );
  }
}

final class _NetworkInterface implements NetworkInterface {
  @override
  List<InternetAddress> get addresses => [
        InternetAddress.anyIPv4,
      ];

  @override
  int get index => -1;

  @override
  String get name => 'any';
}
