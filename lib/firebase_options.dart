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
    apiKey: 'AIzaSyAaCaELQtg7qtduEQAQPIrxqfPevq8miGs',
    appId: '1:639454828821:web:1fa3c011514462c333711c',
    messagingSenderId: '639454828821',
    projectId: 'my-new-rentify',
    authDomain: 'my-new-rentify.firebaseapp.com',
    databaseURL: 'https://my-new-rentify-default-rtdb.firebaseio.com',
    storageBucket: 'my-new-rentify.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDX0ty34mMGopWcbvyUZkihQ5cdoMNLFCk',
    appId: '1:639454828821:android:7255ed9627f9282533711c',
    messagingSenderId: '639454828821',
    projectId: 'my-new-rentify',
    databaseURL: 'https://my-new-rentify-default-rtdb.firebaseio.com',
    storageBucket: 'my-new-rentify.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjc7bF2SFK2_fI8k1curTdGJ4zRfeQnxo',
    appId: '1:639454828821:ios:1b0ae4142afafd3933711c',
    messagingSenderId: '639454828821',
    projectId: 'my-new-rentify',
    databaseURL: 'https://my-new-rentify-default-rtdb.firebaseio.com',
    storageBucket: 'my-new-rentify.firebasestorage.app',
    iosBundleId: 'com.example.rentify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjc7bF2SFK2_fI8k1curTdGJ4zRfeQnxo',
    appId: '1:639454828821:ios:1b0ae4142afafd3933711c',
    messagingSenderId: '639454828821',
    projectId: 'my-new-rentify',
    databaseURL: 'https://my-new-rentify-default-rtdb.firebaseio.com',
    storageBucket: 'my-new-rentify.firebasestorage.app',
    iosBundleId: 'com.example.rentify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAaCaELQtg7qtduEQAQPIrxqfPevq8miGs',
    appId: '1:639454828821:web:01a98b23dc48ef4f33711c',
    messagingSenderId: '639454828821',
    projectId: 'my-new-rentify',
    authDomain: 'my-new-rentify.firebaseapp.com',
    databaseURL: 'https://my-new-rentify-default-rtdb.firebaseio.com',
    storageBucket: 'my-new-rentify.firebasestorage.app',
  );
}
