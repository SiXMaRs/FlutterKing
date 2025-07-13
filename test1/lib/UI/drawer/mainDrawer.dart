import 'package:flutter/material.dart';
import 'UI/drawer/MyDrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Drawer Demo', home: const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Example')),
      drawer: const MyDrawer(), // ✅ เรียก Drawer ที่แยกไฟล์ไว้
      body: const Center(child: Text('หน้าหลักของแอป')),
    );
  }
}
