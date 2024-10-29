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
    apiKey: 'AIzaSyAnIW6bdpsNclqRrAdaiTUVsW3kSFyAAQU',
    appId: '1:1001618673211:web:5dd3cfcfdd3da4f881561e',
    messagingSenderId: '1001618673211',
    projectId: 'uwielbiajmy-go-82c73',
    authDomain: 'uwielbiajmy-go-82c73.firebaseapp.com',
    storageBucket: 'uwielbiajmy-go-82c73.appspot.com',
    measurementId: 'G-BYK8NGFWGD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAULIn6X-rnKylAgzk4cYo2zTPUV1aQtrc',
    appId: '1:1001618673211:android:f38a0feccdd6d68681561e',
    messagingSenderId: '1001618673211',
    projectId: 'uwielbiajmy-go-82c73',
    storageBucket: 'uwielbiajmy-go-82c73.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChnJxjD5-X_4gJpi7ANsycdJI_NhytyVM',
    appId: '1:1001618673211:ios:349d508a884e9f5081561e',
    messagingSenderId: '1001618673211',
    projectId: 'uwielbiajmy-go-82c73',
    storageBucket: 'uwielbiajmy-go-82c73.appspot.com',
    iosBundleId: 'com.example.uwielbiajmyGo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChnJxjD5-X_4gJpi7ANsycdJI_NhytyVM',
    appId: '1:1001618673211:ios:349d508a884e9f5081561e',
    messagingSenderId: '1001618673211',
    projectId: 'uwielbiajmy-go-82c73',
    storageBucket: 'uwielbiajmy-go-82c73.appspot.com',
    iosBundleId: 'com.example.uwielbiajmyGo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAnIW6bdpsNclqRrAdaiTUVsW3kSFyAAQU',
    appId: '1:1001618673211:web:a799724f0e7a6e2581561e',
    messagingSenderId: '1001618673211',
    projectId: 'uwielbiajmy-go-82c73',
    authDomain: 'uwielbiajmy-go-82c73.firebaseapp.com',
    storageBucket: 'uwielbiajmy-go-82c73.appspot.com',
    measurementId: 'G-1M6K3M6QTD',
  );
}
