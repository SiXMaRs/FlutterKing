import 'package:flutter/material.dart';

class ScreenSetting extends StatelessWidget {
  const ScreenSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          ListTile(
            leading: Icon(Icons.person, color: Colors.deepPurple),
            title: Text('บัญชีผู้ใช้', style: TextStyle(fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.deepPurple),
            title: Text('ความเป็นส่วนตัว', style: TextStyle(fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.deepPurple),
            title: Text('การแจ้งเตือน', style: TextStyle(fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, color: Colors.deepPurple),
            title: Text('ภาษา', style: TextStyle(fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.deepPurple),
            title: Text('เกี่ยวกับแอป', style: TextStyle(fontSize: 18)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton.icon(
              icon: Icon(Icons.logout),
              label: Text('ออกจากระบบ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}