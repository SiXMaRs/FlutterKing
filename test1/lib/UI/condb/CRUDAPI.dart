import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'AddEmployee.dart';

class CRUDAPIPage extends StatelessWidget {
  final CollectionReference employees = FirebaseFirestore.instance.collection(
    'employees',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee List')),
      body: StreamBuilder<QuerySnapshot>(
        stream: employees.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final docId = docs[index].id;

              return ListTile(
                title: Text("${data['first_name']} ${data['last_name']}"),
                subtitle: Text(
                  "Email: ${data['email']} \nGender: ${data['gender']}",
                ),
                isThreeLine: true,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEmployeePage()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add Employee',
      ),
    );
  } //build
} //class
