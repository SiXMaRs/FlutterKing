import 'package:flutter/material.dart';
import 'profile_stateless.dart';
import 'setting.dart';

class MyPopupMenuButtonEx extends StatelessWidget {
  const MyPopupMenuButtonEx({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'profile') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileLessPage()),
          );
        } else if (value == 'settings') {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const setting()),
          );
        } else if (value == 'logout') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('ออกจากระบบ')),
          );
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'profile',
          child: Row(
            children: [Icon(Icons.person), SizedBox(width: 8), Text('Profile')],
          ),
        ),
        const PopupMenuItem(
          value: 'settings',
          child: Row(
            children: [Icon(Icons.settings), SizedBox(width: 8), Text('Settings')],
          ),
        ),
        const PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [Icon(Icons.logout), SizedBox(width: 8), Text('Logout')],
          ),
        ),
      ],
    );
  }
}