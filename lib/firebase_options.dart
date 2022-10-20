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
    apiKey: 'AIzaSyBtBbhsHBClavUOv5fL_WW-uh9UpjzhGfo',
    appId: '1:189262741583:web:d6b469ddecbad5a6d1aa3a',
    messagingSenderId: '189262741583',
    projectId: 'study-app-d6857',
    authDomain: 'study-app-d6857.firebaseapp.com',
    storageBucket: 'study-app-d6857.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtIfUDYvBpoOOT3oaU9k2uttmdwxRQN3k',
    appId: '1:189262741583:android:3afa763ee0848594d1aa3a',
    messagingSenderId: '189262741583',
    projectId: 'study-app-d6857',
    storageBucket: 'study-app-d6857.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAC4uBnfxHks_wzgJkseKYJMTWbLyGChqs',
    appId: '1:189262741583:ios:014ab217654673cdd1aa3a',
    messagingSenderId: '189262741583',
    projectId: 'study-app-d6857',
    storageBucket: 'study-app-d6857.appspot.com',
    iosClientId: '189262741583-kkdtursuhpgt9n3j71glhtrajm9s78ag.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyApp',
  );
}