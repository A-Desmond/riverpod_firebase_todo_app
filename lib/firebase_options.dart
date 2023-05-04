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
    apiKey: 'AIzaSyDzJge6Z8hFLOqxNmvryMCFzkiR4ElCx0k',
    appId: '1:322286968557:web:4aac65b78b843e3a5776e4',
    messagingSenderId: '322286968557',
    projectId: 'it-will-come',
    authDomain: 'it-will-come.firebaseapp.com',
    databaseURL: 'https://it-will-come-default-rtdb.firebaseio.com',
    storageBucket: 'it-will-come.appspot.com',
    measurementId: 'G-CB2MHJSL62',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQddGzDfJwKsC6deAi_RwGswzBSdY8M3o',
    appId: '1:322286968557:android:bfddd65a1e5a79a75776e4',
    messagingSenderId: '322286968557',
    projectId: 'it-will-come',
    databaseURL: 'https://it-will-come-default-rtdb.firebaseio.com',
    storageBucket: 'it-will-come.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsAYCDV9iJQys2avXGxiG1t4KRFA4BNnQ',
    appId: '1:322286968557:ios:bd1cd2a6d26da58e5776e4',
    messagingSenderId: '322286968557',
    projectId: 'it-will-come',
    databaseURL: 'https://it-will-come-default-rtdb.firebaseio.com',
    storageBucket: 'it-will-come.appspot.com',
    androidClientId: '322286968557-96qes8kc6h1n2mhnem4n8abcn8mg80s8.apps.googleusercontent.com',
    iosClientId: '322286968557-lf6ii6a1t799g8mbid1ui6nct42n1q67.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}