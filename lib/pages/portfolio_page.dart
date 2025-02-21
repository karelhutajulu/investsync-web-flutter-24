import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the CustomNavigationBar
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav widget

final Size defaultDeviceSize = Size(1536.0, 729.6);
Size deviceSize = Size(0, 0); // Default size

class PortfolioPage extends StatefulWidget {
  @override
  createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            110.0/defaultDeviceSize.height * deviceSize.height), // Set the height of your custom navigation bar
        child: DesktopNavigationBar(activePage: 'Portfolio'),
      ),
      body: Center(
        // Placeholder for now
        child: Image.network(
          'assets/images/whatthehell.png', 
          width: 300 * (16/25 * (deviceSize.width / defaultDeviceSize.width) + 9/25 * (deviceSize.height / defaultDeviceSize.height)),
          height: 300 * (16/25 * (deviceSize.width / defaultDeviceSize.width) + 9/25 * (deviceSize.height / defaultDeviceSize.height)),
        ),
      ),
      bottomNavigationBar: BotNav(), // Add BotNav here
    );
  }
}