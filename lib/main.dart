import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Import the homepage or initial screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InvestSync Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner:
          false, // Set this to false to remove the debug banner
      home: HomePage(), // Set your homepage here
    );
  }
}