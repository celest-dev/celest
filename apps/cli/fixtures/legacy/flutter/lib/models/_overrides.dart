// import 'dart:ui' as ui;

// import 'package:celest/celest.dart';
// import 'package:flutter/material.dart' as flutter;

// @customOverride
// extension type const MyTextDecoration(ui.TextDecoration decoration)
//     implements ui.TextDecoration {
//   factory MyTextDecoration.fromJson(String value) {
//     return const TextDecorationSerializer().deserialize(value)
//         as MyTextDecoration;
//   }

//   String toJson() {
//     return const TextDecorationSerializer().serialize(this) as String;
//   }
// }

// final class TextDecorationSerializer extends Serializer<ui.TextDecoration> {
//   const TextDecorationSerializer();

//   static const Map<String, ui.TextDecoration> _values = {
//     'none': ui.TextDecoration.none,
//     'underline': ui.TextDecoration.underline,
//     'overline': ui.TextDecoration.overline,
//     'lineThrough': ui.TextDecoration.lineThrough,
//   };

//   @override
//   ui.TextDecoration deserialize(Object? value) {
//     final serialized = assertWireType<String>(value);
//     const prefix = 'TextDecoration.';
//     final decoration = serialized.substring(prefix.length);

//     // e.g. TextDecoration.none
//     if (_values[decoration] case final decoration?) {
//       return decoration;
//     }

//     // e.g. TextDecoration.combine([underline, overline])
//     final combination = decoration
//         .substring(
//           'combine(['.length,
//           decoration.length - '])'.length,
//         )
//         .split(', ');
//     if (combination.length < 2) {
//       throw SerializationException(
//         'Invalid TextDecoration: $value',
//       );
//     }
//     return ui.TextDecoration.combine(
//       combination.map((decoration) {
//         return _values[decoration] ??
//             (throw SerializationException(
//               'Invalid TextDecoration: $decoration',
//             ));
//       }).toList(),
//     );
//   }

//   @override
//   Object? serialize(ui.TextDecoration value) {
//     return value.toString();
//   }
// }

// @customOverride
// extension type const Text(flutter.Text _) implements flutter.Text {
//   Null get textSpan => null;
//   Null get style => null;
//   Null get strutStyle => null;
//   Null get textScaler => null;
// }
