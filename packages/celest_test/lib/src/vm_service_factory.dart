import 'dart:async';

import 'package:vm_service/vm_service.dart';
import 'package:web_socket/web_socket.dart';

/// An implementation of the `vmServiceConnectUri` method from
/// `package:vm_service/vm_service_io.dart` which works on Web as well as VM.
Future<VmService> vmServiceConnect(Uri wsUri, {Log? log}) async {
  final WebSocket socket = await WebSocket.connect(wsUri);

  final controller = StreamController<dynamic>();
  final streamClosedCompleter = Completer<void>();

  socket.events.listen((event) {
    switch (event) {
      case TextDataReceived():
        controller.add(event.text);
      case BinaryDataReceived():
        controller.add(event.data);
      case CloseReceived():
        controller.close();
    }
  }, onDone: streamClosedCompleter.complete);

  return VmService.defaultFactory(
    inStream: controller.stream,
    writeMessage: socket.sendText,
    log: log,
    disposeHandler: socket.close,
    streamClosed: streamClosedCompleter.future,
    wsUri: wsUri.toString(),
  );
}
