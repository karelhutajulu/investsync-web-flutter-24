import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Import the homepage or initial screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investsync Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Set your homepage here
    );
  }
}
