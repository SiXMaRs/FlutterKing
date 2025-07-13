import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListCardPage(),
    );
  }
}

class ListCardPage extends StatefulWidget {
  @override
  _ListCardPageState createState() => _ListCardPageState();
}

class _ListCardPageState extends State<ListCardPage> {
  List<dynamic> employees = [];

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/employees.json',
    );
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    final List<dynamic> rawList = jsonData['content'];
    final List refinedList = rawList.map((e) => e['data']).toList();

    setState(() {
      employees = refinedList;
    });
  }

  Widget buildEmpListTile(String firstName, String lastname, email, phone) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        // title: Text('$firstName '),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              
              "Name: $firstName $lastname  $email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected: $firstName $lastname $email $phone'),
              duration: Duration(seconds: 3),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('รายชื่อพนักงาน')),
      body: employees.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          // <- index was sent here by Flutter,ex. 0 1 2...
          var emp = employees[index];
          var firstName = emp['first_name'] ?? '-';
          var lastName = emp['last_name'] ?? '-';
          var email = emp['email'] ?? '-';
          var phone = emp['phone'] ?? '-';  
          return buildEmpListTile(firstName, lastName, email, phone);
        },
      ),
    );
  }
}
