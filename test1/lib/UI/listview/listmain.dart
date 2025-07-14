import 'package:flutter/material.dart';
import 'ui/listview/ListCard.dart';
// import 'ui/listview/ListCardHor.dart';
import 'ui/listview/ListCardEditDel.dart';
import 'ui/Forms/formregis.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee List',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: ListCardPage(),
      // home: ListCardHor(),
      // home: ListCardEditDelPage(),
      home: RegisterForm(), //
    );
  }
}
