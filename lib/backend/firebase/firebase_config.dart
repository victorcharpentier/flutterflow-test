import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC7uM5vGjv_0BDvEuIXjVFtwiy7O1wmGuM",
            authDomain: "stayfluence-745c3.firebaseapp.com",
            projectId: "stayfluence-745c3",
            storageBucket: "stayfluence-745c3.appspot.com",
            messagingSenderId: "394288885349",
            appId: "1:394288885349:web:afa9746de81a74c792608c",
            measurementId: "G-B5QFX8XM6B"));
  } else {
    await Firebase.initializeApp();
  }
}
