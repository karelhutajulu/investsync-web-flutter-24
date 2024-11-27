import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart'; // Import the homepage or initial screen
import 'pages/team_page.dart'; // Import the Teams page
import 'pages/newsletter_page.dart'; // Import the Newsletter page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'InvestSync Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner:
          false, // Set this to false to remove the debug banner
      home: HomePage(), // Set your homepage here
      getPages: [
        // Define routes here using GetPage with transition and duration
        GetPage(
          name: '/',
          page: () => HomePage(),
          transition: Transition.fade, // Set fade transition
          transitionDuration: Duration(milliseconds: 500), // Optional duration
        ),
        GetPage(
          name: '/team',
          page: () => TeamPage(),
          transition: Transition.fade, // Set fade transition
          transitionDuration: Duration(milliseconds: 500), // Optional duration
        ),
        GetPage(
          name: '/newsletter',
          page: () => NewsletterPage(),
          transition: Transition.fade, // Set fade transition
          transitionDuration: Duration(milliseconds: 500), // Optional duration
        ),
      ],
    );
  }
}