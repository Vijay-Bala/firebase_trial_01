// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
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
        return android;
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCEogV9Tym-yXtS0Y1F4INol1bE0x9r_0E',
    appId: '1:426490569365:web:3a6898b6abcf8e32dab19c',
    messagingSenderId: '426490569365',
    projectId: 'trial-1-51c1b',
    authDomain: 'trial-1-51c1b.firebaseapp.com',
    storageBucket: 'trial-1-51c1b.firebasestorage.app',
    measurementId: 'G-76Z76E25FT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvKt0zrespt_LS6mHST0sSBfW7IEjxA5k',
    appId: '1:426490569365:android:6438f6234edffd8cdab19c',
    messagingSenderId: '426490569365',
    projectId: 'trial-1-51c1b',
    storageBucket: 'trial-1-51c1b.firebasestorage.app',
  );
}
