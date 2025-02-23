import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart';

class SideNav extends StatelessWidget {
  final VoidCallback toggleSideNav;
  final String activePage;

  const SideNav({super.key, required this.toggleSideNav, required this.activePage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: toggleSideNav, // Close the drawer if tapped outside
            child: Container(
              color: Colors.black.withOpacity(0.35), // Grey opacity box
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          width: 300, // Width of the drawer
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 2.5,
                  blurRadius: 2.5,
                  offset: Offset(2.5, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Image.asset('assets/logos/investsync-logo.jpg'),
                ),
                NavBarItem(
                  title: 'Home',
                  onTap: () {
                    toggleSideNav(); // Close drawer after selection
                    Get.toNamed('/');
                  },
                  isActive: activePage == 'Home',
                ),
                NavBarItem(
                  title: 'Team',
                  onTap: () {
                    toggleSideNav(); // Close drawer after selection
                    Get.toNamed('/team');
                  },
                  isActive: activePage == 'Team',
                ),
                NavBarItem(
                  title: 'Newsletter',
                  onTap: () {
                    toggleSideNav(); // Close drawer after selection
                    Get.toNamed('/newsletter');
                  },
                  isActive: activePage == 'Newsletter',
                ),
                NavBarItem(
                  title: 'Portfolio',
                  onTap: () {
                    toggleSideNav(); // Close drawer after selection
                    Get.toNamed('/portfolio');
                  },
                  isActive: activePage == 'Portfolio',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
