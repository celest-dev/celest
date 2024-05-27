import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:celest/celest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

@cloud
Future<Uint8List> paintWidget() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firstFrame = Completer<void>();
  SchedulerBinding.instance.addPostFrameCallback(firstFrame.complete);

  runApp(const HelloWorld());
  await firstFrame.future;

  final element = WidgetsBinding.instance.rootElement!;
  final renderObject = element.renderObject!;
  // ignore: invalid_use_of_protected_member
  final layer = renderObject.layer! as OffsetLayer;
  final image = await layer.toImage(renderObject.paintBounds);
  final imageBytes = await image.toByteData(format: ImageByteFormat.png);
  if (imageBytes == null) {
    throw InternalServerError('Failed to encode image');
  }

  return imageBytes.buffer.asUint8List();
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
