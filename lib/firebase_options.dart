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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyBYNmRj5GCm3WndJ8wbN6GtTOx60wF-T7M',
    appId: '1:627748918207:web:7fd21fcabc7c99b0b1c70a',
    messagingSenderId: '627748918207',
    projectId: 'easyshoppinig',
    authDomain: 'easyshoppinig.firebaseapp.com',
    storageBucket: 'easyshoppinig.appspot.com',
    measurementId: 'G-113F9C2F0Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzf7_sA8KHozjw2z-o7D9ODIuVvUXVv3Y',
    appId: '1:627748918207:android:0307bb37f4d67b23b1c70a',
    messagingSenderId: '627748918207',
    projectId: 'easyshoppinig',
    storageBucket: 'easyshoppinig.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEjFaLGW7MnuLmZnmgznpbMCSGhtf4c_w',
    appId: '1:627748918207:ios:4c305ba055d8c5a2b1c70a',
    messagingSenderId: '627748918207',
    projectId: 'easyshoppinig',
    storageBucket: 'easyshoppinig.appspot.com',
    iosBundleId: 'com.example.eCommApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEjFaLGW7MnuLmZnmgznpbMCSGhtf4c_w',
    appId: '1:627748918207:ios:4c305ba055d8c5a2b1c70a',
    messagingSenderId: '627748918207',
    projectId: 'easyshoppinig',
    storageBucket: 'easyshoppinig.appspot.com',
    iosBundleId: 'com.example.eCommApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBYNmRj5GCm3WndJ8wbN6GtTOx60wF-T7M',
    appId: '1:627748918207:web:083275b1804c1e64b1c70a',
    messagingSenderId: '627748918207',
    projectId: 'easyshoppinig',
    authDomain: 'easyshoppinig.firebaseapp.com',
    storageBucket: 'easyshoppinig.appspot.com',
    measurementId: 'G-RCM7YGR44R',
  );
}
