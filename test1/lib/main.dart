import 'package:flutter/foundation.dart'; // สำหรับ kIsWeb
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/condb/CRUDAPI.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA_xwOoE_Y70EG6p9O1BY44CJWgTjF2rDw",
        authDomain: "testdbflutter-fcced.firebaseapp.com",
        projectId: "testdbflutter-fcced",
        storageBucket: "testdbflutter-fcced.firebasestorage.app",
        messagingSenderId: "1063488740534",
        appId: "1:1063488740534:web:925b9e17e9e4a4e079da17",
        measurementId: "G-SLE0T17K0M"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase CRUD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CRUDAPIPage(), // call here
    );
  }
}
