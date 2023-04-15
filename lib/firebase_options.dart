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
    apiKey: 'AIzaSyC878SF9qAcibDGDOlf4yrBG7i8HoGvxjM',
    appId: '1:1029144392867:web:2e2345a82a7a392b463b16',
    messagingSenderId: '1029144392867',
    projectId: 'sub-sc-app-230415',
    authDomain: 'sub-sc-app-230415.firebaseapp.com',
    storageBucket: 'sub-sc-app-230415.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNqPZCSCa4e2k_rOOFoXkqGUghzOmQ8xQ',
    appId: '1:1029144392867:android:5dbf4529cfb533f5463b16',
    messagingSenderId: '1029144392867',
    projectId: 'sub-sc-app-230415',
    storageBucket: 'sub-sc-app-230415.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl6zHyKmQZw2CdVmuq3Ra-nsoOJ1F7xKE',
    appId: '1:1029144392867:ios:ea791804f397227b463b16',
    messagingSenderId: '1029144392867',
    projectId: 'sub-sc-app-230415',
    storageBucket: 'sub-sc-app-230415.appspot.com',
    iosClientId: '1029144392867-n48qgg7oihn8ij46ai55sklg48itupei.apps.googleusercontent.com',
    iosBundleId: 'com.example.subScriptionApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCl6zHyKmQZw2CdVmuq3Ra-nsoOJ1F7xKE',
    appId: '1:1029144392867:ios:ea791804f397227b463b16',
    messagingSenderId: '1029144392867',
    projectId: 'sub-sc-app-230415',
    storageBucket: 'sub-sc-app-230415.appspot.com',
    iosClientId: '1029144392867-n48qgg7oihn8ij46ai55sklg48itupei.apps.googleusercontent.com',
    iosBundleId: 'com.example.subScriptionApp',
  );
}
