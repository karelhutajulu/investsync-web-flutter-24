import 'package:flutter/material.dart';
import 'pages/homepage.dart'; // Import the homepage or initial screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Set your homepage here
    );
  }
}
