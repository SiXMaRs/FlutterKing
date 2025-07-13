import 'package:flutter/material.dart';
import 'screenA.dart';
import 'screenB.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // num. of tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Example'),

          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          // *** Show bar on TOP
          bottom: const TabBar(
            tabs: [Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.person), text: 'profile'),
            Tab(icon: Icon(Icons.settings), text: 'tungka'),],
          ),
          
        ),
        // body: const TabBarView(
        //   children: [
        //     Center(child: Text('˹����ѡ')),
        //     Center(child: Text('�����')),
        //   ],
        // ),
        body: const TabBarView(children: [ScreenA(), ScreenB()]),

        // *** Show bar on TOP
        // bottomNavigationBar: Container(
        //   color: Colors.deepPurple,
        //   child: const TabBar(
        //     tabs: [Tab(icon: Icon(Icons.person), text: 'Profile')],
        //     labelColor: Colors.white,
        //     unselectedLabelColor: Colors.white70,
        //     indicatorColor: Colors.pinkAccent,
        //   ),
        // ),
      ),
    );
  }
}
