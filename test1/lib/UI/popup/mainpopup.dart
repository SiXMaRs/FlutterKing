import 'package:flutter/material.dart';
import 'ui/popup/MyPopupMenuButtonEx.dart'; // import ไฟล์ภายนอก

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popup Menu Demo',
      theme: ThemeData(
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.blue[200], //bg
          textStyle: const TextStyle(color: Colors.deepPurple, fontSize: 16),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
          actions: const [
            MyPopupMenuButtonEx(),
            // call widget
          ],
        ),
        body: const Center(child: Text('Press : Menu [right top]')),

      ),
    );
  }
}
