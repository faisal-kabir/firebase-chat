import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:284697330247:ios:226743dddf5a85bfc96762',
        apiKey: 'AIzaSyBn8ZkfRK5yINBYjLaVb5eCT5otUFruIjI',
        projectId: 'fir-chat-62cc2',
        messagingSenderId: '284697330247',
        iosBundleId: 'com.faisal.firebaseChat',
        iosClientId: '284697330247-6rhca5pehg9pod408upsl30gn412mmje.apps.googleusercontent.com',
        androidClientId: '284697330247-rreomo1nu1sqga0gsv7mjn1nop22rgnk.apps.googleusercontent.com',
        storageBucket: 'fir-chat-62cc2.appspot.com',
        databaseURL: 'https://fir-chat-62cc2.firebaseio.com',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:284697330247:android:ba52b013d29219bac96762',
        apiKey: 'AIzaSyAS6XlyIUxNqv9TsBdq2tx6CtiJaNO1ZRA',
        projectId: 'fir-chat-62cc2',
        messagingSenderId: '284697330247',
      );
    }
  }
}