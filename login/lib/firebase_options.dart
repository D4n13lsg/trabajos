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
    apiKey: 'AIzaSyBUk8WUl1zpE_mNf4yutbFgbNyt80sYqSY',
    appId: '1:217361690603:web:32045ab904806d7c8ab3ae',
    messagingSenderId: '217361690603',
    projectId: 'login-ui-3ff1f',
    authDomain: 'login-ui-3ff1f.firebaseapp.com',
    storageBucket: 'login-ui-3ff1f.appspot.com',
    measurementId: 'G-01JQ0WT0Z2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAI_xl-JigMSUmrQACde_ViRmu181LzcmI',
    appId: '1:217361690603:android:d7d34c97dcac6ba68ab3ae',
    messagingSenderId: '217361690603',
    projectId: 'login-ui-3ff1f',
    storageBucket: 'login-ui-3ff1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAICSZRvZet9_APCV58JGKR17P34HDAqWA',
    appId: '1:217361690603:ios:39bc4ef16c152eaf8ab3ae',
    messagingSenderId: '217361690603',
    projectId: 'login-ui-3ff1f',
    storageBucket: 'login-ui-3ff1f.appspot.com',
    iosClientId: '217361690603-gkf6o1n9mt2basl7st91o0vci15sm0ll.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );
}