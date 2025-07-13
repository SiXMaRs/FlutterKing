import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListCardEditDelPage(),
    );
  }
}

class ListCardEditDelPage extends StatefulWidget {
  @override
  _ListCardEditDelPageState createState() => _ListCardEditDelPageState();
}

class _ListCardEditDelPageState extends State<ListCardEditDelPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('รายชื่อพนักงาน')),
      body: employees.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                var emp = employees[index];
                var firstName = emp['first_name'] ?? '-';
                var lastName = emp['last_name'] ?? '-';
                var email = emp['email'] ?? '-';

                return buildSlidableTile(
                  index: index,
                  firstName: firstName,
                  lastName: lastName,
                  email: email,
                );
              },
            ),
    );
  }

  Future<void> confirmDelete(BuildContext context, int index) async {
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text(
            'Do you want to delete ${employees[index]['first_name']} ?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      setState(() {
        employees.removeAt(index);
      });
    }
  }

  void showEditDialog(BuildContext context, int index) {
    final emp = employees[index];
    final fnameController = TextEditingController(text: emp['first_name']);
    final lnameController = TextEditingController(text: emp['last_name']);
    final emailController = TextEditingController(text: emp['email']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Employee'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: fnameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                TextField(
                  controller: lnameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // cancel
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  employees[index]['first_name'] = fnameController.text;
                  employees[index]['last_name'] = lnameController.text;
                  employees[index]['email'] = emailController.text;
                });
                Navigator.pop(context); // close dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget buildSlidableTile({
    required int index,
    required String firstName,
    required String lastName,
    required String email,
  }) {
    return Slidable(
      key: ValueKey('$firstName-$lastName-$index'),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showEditDialog(context, index);
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) {
              confirmDelete(context, index);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: Text('$firstName $lastName'),
        subtitle: Text(email),
      ),
    );
  }
}