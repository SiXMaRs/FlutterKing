import 'package:flutter/material.dart';
import 'ui/Forms/formregis.dart'; // เปลี่ยน path ให้ตรงกับโครงสร้างของคุณ

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: RegisterForm(), //
      debugShowCheckedModeBanner: false,
    );
  }
}
