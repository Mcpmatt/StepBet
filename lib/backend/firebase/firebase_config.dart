import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDZnegkRc7GOs8lUmmtI14Zmyp7WlIxn4o",
            authDomain: "fitness305-casino-dkmau0.firebaseapp.com",
            projectId: "fitness305-casino-dkmau0",
            storageBucket: "fitness305-casino-dkmau0.appspot.com",
            messagingSenderId: "235925475737",
            appId: "1:235925475737:web:185150c021af91caf70308",
            measurementId: "G-Y54VSTYCVS"));
  } else {
    await Firebase.initializeApp();
  }
}
