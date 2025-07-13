import 'package:flutter/material.dart';
import 'ScreenD1.dart';
import "SceenSetting.dart";
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/forest.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('assets/images/profile2.png'),
                ),
                SizedBox(height: 8),
                Text(
                  'เมนูหลัก',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScreenD1()),
              );
            },
          ),
          // เพิ่มปุ่มเมนูใหม่
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
             Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScreenSetting()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: 'Demo Flutter',
                applicationVersion: '1.0.0',
                children: [
                  const Text('แอปตัวอย่าง Flutter Drawer Menu'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}