import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the CustomNavigationBar
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            110.0), // Set the height of your custom navigation bar
        child: CustomNavigationBar(),
      ),
      body: Center(
        child: Text(
            'Welcome to the Home Page'), // Placeholder content for HomePage
      ),
      bottomNavigationBar: BotNav(), // Add BotNav here
    );
  }
}
