// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyDiN8Eb5ZvgCCKlIfD5_Hh_yT6YwPiB6O8',
    appId: '1:531053487904:web:00cb232d9d19f42c885945',
    messagingSenderId: '531053487904',
    projectId: 'ecommerce-7959a',
    authDomain: 'ecommerce-7959a.firebaseapp.com',
    storageBucket: 'ecommerce-7959a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAevk5DdFUS_yTzxgRusuvgWq7palEKXlI',
    appId: '1:531053487904:android:e5a19bd8efdd6236885945',
    messagingSenderId: '531053487904',
    projectId: 'ecommerce-7959a',
    storageBucket: 'ecommerce-7959a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTx3Bs8PRarYWEq-Zwv0QjofisxVyrPfA',
    appId: '1:531053487904:ios:19ed2fd8ab7e3f04885945',
    messagingSenderId: '531053487904',
    projectId: 'ecommerce-7959a',
    storageBucket: 'ecommerce-7959a.appspot.com',
    iosClientId: '531053487904-gdkv3pst78qq5eacthka9n14dml0fhhc.apps.googleusercontent.com',
    iosBundleId: 'com.example.digitalShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTx3Bs8PRarYWEq-Zwv0QjofisxVyrPfA',
    appId: '1:531053487904:ios:19ed2fd8ab7e3f04885945',
    messagingSenderId: '531053487904',
    projectId: 'ecommerce-7959a',
    storageBucket: 'ecommerce-7959a.appspot.com',
    iosClientId: '531053487904-gdkv3pst78qq5eacthka9n14dml0fhhc.apps.googleusercontent.com',
    iosBundleId: 'com.example.digitalShop',
  );
}
