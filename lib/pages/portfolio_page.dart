import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/sidenav.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the CustomNavigationBar
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav widget

final Size defaultDeviceSize = Size(1536.0, 729.6);
Size deviceSize = Size(0, 0); // Default size

class PortfolioPage extends StatefulWidget {
  @override
  createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool _sideNavOpen = false;

  void _toggleSideNav() {
    setState(() {
      _sideNavOpen = (_sideNavOpen == false) ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            TopNav(activePage: 'Portfolio', onSideNavPressed: _toggleSideNav),
            Spacer(flex: 1),
            Center(
              // Placeholder for now
              child: Image.network(
                'assets/images/whatthehell.png',
                width: 300 *
                    (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
                        9 /
                            25 *
                            (deviceSize.height / defaultDeviceSize.height)),
                height: 300 *
                    (16 / 25 * (deviceSize.width / defaultDeviceSize.width) +
                        9 /
                            25 *
                            (deviceSize.height / defaultDeviceSize.height)),
              ),
            ),
            Spacer(flex: 1),
            BottomNav()
          ]),
          if (_sideNavOpen) SideNav(toggleSideNav: _toggleSideNav, activePage: 'Portfolio')
        ],
      ),
    );
  }
}
