// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB0IJtPk1Agkm0QTINukmHhdi3b5rWPEc4',
    appId: '1:447767341722:web:2f018b95ea2ca005e20d23',
    messagingSenderId: '447767341722',
    projectId: 'prj-d-firebase-test',
    authDomain: 'prj-d-firebase-test.firebaseapp.com',
    storageBucket: 'prj-d-firebase-test.appspot.com',
    measurementId: 'G-2C8DVB2PDL',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB0IJtPk1Agkm0QTINukmHhdi3b5rWPEc4',
    appId: '1:447767341722:web:8cf866f5d8ce560be20d23',
    messagingSenderId: '447767341722',
    projectId: 'prj-d-firebase-test',
    authDomain: 'prj-d-firebase-test.firebaseapp.com',
    storageBucket: 'prj-d-firebase-test.appspot.com',
    measurementId: 'G-R77M376X79',
  );
}
