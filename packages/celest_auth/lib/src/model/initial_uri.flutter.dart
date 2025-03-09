// ignore: uri_does_not_exist
import 'dart:ui' as ui;

final Uri? initialUri =
    switch (ui.PlatformDispatcher.instance.defaultRouteName) {
  '/' => null,
  final route => Uri.tryParse(route),
};
