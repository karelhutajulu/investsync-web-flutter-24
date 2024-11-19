import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the CustomNavigationBar
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav widget

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            110.0), // Set the height of your custom navigation bar
        child: CustomNavigationBar(activePage: 'Portfolio'),
      ),
      body: Center(
        // Placeholder for now
        child: Image.network('assets/images/whatthehell.png'),
      ),
      bottomNavigationBar: BotNav(), // Add BotNav here
    );
  }
}