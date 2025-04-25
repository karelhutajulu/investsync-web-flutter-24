import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart';

class SideNav extends StatelessWidget {
  final String activePage;

  const SideNav({
    super.key,
    required this.activePage,
  });

  @override
  Widget build(BuildContext context) {
    final SidebarController sidebarController = Get.find();

    return Obx(() {
      if (!sidebarController.isOpen.value)
        return SizedBox.shrink(); // If not open, return empty

      return Stack(
        children: [
          GestureDetector(
            onTap: sidebarController.close, // Tap outside to close
            child: Container(
              color: Colors.black.withOpacity(0.35),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            width: 300,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Image.asset('assets/logos/investsync-logo.jpg'),
                  ),
                  _SideNavItem(
                      title: 'Home', route: '/', active: activePage == 'Home'),
                  _SideNavItem(
                      title: 'Team',
                      route: '/team',
                      active: activePage == 'Team'),
                  _SideNavItem(
                      title: 'Newsletter',
                      route: '/newsletter',
                      active: activePage == 'Newsletter'),
                  _SideNavItem(
                      title: 'Portfolio',
                      route: '/portfolio',
                      active: activePage == 'Portfolio'),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _SideNavItem extends StatelessWidget {
  final String title;
  final String route;
  final bool active;

  const _SideNavItem({
    required this.title,
    required this.route,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    final SidebarController sidebarController = Get.find();

    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: active ? Colors.blue : Colors.black,
        ),
      ),
      onTap: () {
        sidebarController.close();
        Get.toNamed(route);
      },
    );
  }
}
