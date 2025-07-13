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

  Widget buildEmpListTileExtend(String firstName, String lastName) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: $firstName $lastName",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        onTap: () {},
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
                // <- index of listview
                var emp = employees[index];
                var firstName = emp['first_name'] ?? '-';
                var lastName = emp['last_name'] ?? '-';

                return buildDismissibleTile(index, firstName, lastName);
              },
            ),
    );
  }

  Widget buildDismissibleTile(int index, String firstName, String lastName) {
    return Dismissible(
      key: Key('$firstName-$lastName-$index'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),

      //#############################
      // confirmDismiss: (direction) async {
      //   return await showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: Text('Confirm Box'),
      //         content: Text('Do you wan to delete  ?'),
      //         actions: [
      //           TextButton(
      //             // onPressed: () => Navigator.of(context).pop(false),
      //             onPressed: () {
      //               Navigator.of(context).pop(false);
      //             },
      //             child: Text('Cancel'),
      //           ),
      //           TextButton(
      //             onPressed: () => Navigator.of(context).pop(true),
      //             child: Text('Delete'),
      //           ),
      //         ],
      //       );
      //     },
      //   );
      // }, //confirmDismiss
      onDismissed: (direction) {
        setState(() {
          employees.removeAt(index); //delete
        });
      },
      child: ListTile(title: Text('$firstName ')),
    );
  }
}
