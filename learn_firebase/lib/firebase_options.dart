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
    apiKey: 'AIzaSyCeuahl9YLBAWHoGaPPRd6NIJ9YRf8kQtU',
    appId: '1:638615218878:web:ea2c98e5117c2a94c00cef',
    messagingSenderId: '638615218878',
    projectId: 'learning-project-64df9',
    authDomain: 'learning-project-64df9.firebaseapp.com',
    storageBucket: 'learning-project-64df9.appspot.com',
    measurementId: 'G-Z47JG4WJHW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBk1tRaVewsw5NBLvRl-7KX6dHqgmfwsnw',
    appId: '1:638615218878:android:9a66764555ebe7cfc00cef',
    messagingSenderId: '638615218878',
    projectId: 'learning-project-64df9',
    storageBucket: 'learning-project-64df9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDo6YqJtDfAkJWFWBnGxGkS_ddS8ViZOdM',
    appId: '1:638615218878:ios:fd4ee906f5d5ed42c00cef',
    messagingSenderId: '638615218878',
    projectId: 'learning-project-64df9',
    storageBucket: 'learning-project-64df9.appspot.com',
    iosBundleId: 'com.example.learnFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDo6YqJtDfAkJWFWBnGxGkS_ddS8ViZOdM',
    appId: '1:638615218878:ios:782f322cb1125ac0c00cef',
    messagingSenderId: '638615218878',
    projectId: 'learning-project-64df9',
    storageBucket: 'learning-project-64df9.appspot.com',
    iosBundleId: 'com.example.learnFirebase.RunnerTests',
  );
}
