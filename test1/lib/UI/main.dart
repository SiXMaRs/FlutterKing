import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int count = 0;
  final TextEditingController _tfcontroller = TextEditingController(); 

  void showSnackBar() {
    var input = _tfcontroller.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(input), duration: Duration(seconds: 10)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tap Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Welcome to Flutter!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

               Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.thumb_up),
                Text('Like'),
                ElevatedButton(onPressed: () {}, child: Text('OK')),
              ],
            ), //row

              TextField(
                controller: _tfcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  showSnackBar();
                },
                child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}