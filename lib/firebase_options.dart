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
    apiKey: 'AIzaSyAkFSd5jr7hVo7teB8VdbZy9tolnGqN8Rs',
    appId: '1:228750390179:web:72862a8e458f6c66776016',
    messagingSenderId: '228750390179',
    projectId: 'iotproject-c77a9',
    authDomain: 'iotproject-c77a9.firebaseapp.com',
    storageBucket: 'iotproject-c77a9.appspot.com',
    measurementId: 'G-NRC81B0CSN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCs-Pp3ZWycL43kNn9tk0JTXb8XuahZF9Y',
    appId: '1:228750390179:android:ec4556e9db20ec82776016',
    messagingSenderId: '228750390179',
    projectId: 'iotproject-c77a9',
    storageBucket: 'iotproject-c77a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3gXwCqGrioKWxUktkxsLGXuZb8yGd9Tk',
    appId: '1:228750390179:ios:ff3ed7230ba9e54e776016',
    messagingSenderId: '228750390179',
    projectId: 'iotproject-c77a9',
    storageBucket: 'iotproject-c77a9.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3gXwCqGrioKWxUktkxsLGXuZb8yGd9Tk',
    appId: '1:228750390179:ios:ff3ed7230ba9e54e776016',
    messagingSenderId: '228750390179',
    projectId: 'iotproject-c77a9',
    storageBucket: 'iotproject-c77a9.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAkFSd5jr7hVo7teB8VdbZy9tolnGqN8Rs',
    appId: '1:228750390179:web:acf321ddb264bbe1776016',
    messagingSenderId: '228750390179',
    projectId: 'iotproject-c77a9',
    authDomain: 'iotproject-c77a9.firebaseapp.com',
    storageBucket: 'iotproject-c77a9.appspot.com',
    measurementId: 'G-4QFEC0GJ2X',
  );
}
