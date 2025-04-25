import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart'; // Import your SidebarController

class TopNav extends StatelessWidget {
  final String activePage;

  const TopNav({
    super.key,
    required this.activePage,
  });

  @override
  Widget build(BuildContext context) {
    final SidebarController sidebarController =
        Get.find(); // Find the SidebarController

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1150) {
          return DesktopTopNav(activePage: activePage);
        } else if (constraints.maxWidth > 650) {
          return TabletTopNav(
              activePage: activePage, sidebarController: sidebarController);
        } else {
          return MobileTopNav(
              activePage: activePage, sidebarController: sidebarController);
        }
      },
    );
  }
}

class _TopNavItem extends StatelessWidget {
  final String title;
  final String route;
  final bool active;

  const _TopNavItem({
    required this.title,
    required this.route,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: active ? Colors.blue : Colors.black,
        ),
      ),
    );
  }
}

class DesktopTopNav extends StatelessWidget {
  final String activePage;

  const DesktopTopNav({super.key, required this.activePage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2.5,
            blurRadius: 2.5,
            offset: Offset(0, 2.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Logo
          Image.asset('assets/logos/investsync-logo.jpg', height: 65),

          // Right side: Navigation items
          Row(
            children: [
              _TopNavItem(
                  title: 'Home', route: '/', active: activePage == 'Home'),
              SizedBox(width: 20),
              _TopNavItem(
                  title: 'Team', route: '/team', active: activePage == 'Team'),
              SizedBox(width: 20),
              _TopNavItem(
                  title: 'Newsletter',
                  route: '/newsletter',
                  active: activePage == 'Newsletter'),
              SizedBox(width: 20),
              _TopNavItem(
                  title: 'Portfolio',
                  route: '/portfolio',
                  active: activePage == 'Portfolio'),
            ],
          ),
        ],
      ),
    );
  }
}

class TabletTopNav extends StatelessWidget {
  final String activePage;
  final SidebarController sidebarController;

  const TabletTopNav({
    super.key,
    required this.activePage,
    required this.sidebarController,
  });

  @override
  Widget build(BuildContext context) {
    return _TopNavWithMenu(
        activePage: activePage, sidebarController: sidebarController);
  }
}

class MobileTopNav extends StatelessWidget {
  final String activePage;
  final SidebarController sidebarController;

  const MobileTopNav({
    super.key,
    required this.activePage,
    required this.sidebarController,
  });

  @override
  Widget build(BuildContext context) {
    return _TopNavWithMenu(
        activePage: activePage, sidebarController: sidebarController);
  }
}

class _TopNavWithMenu extends StatelessWidget {
  final String activePage;
  final SidebarController sidebarController;

  const _TopNavWithMenu({
    required this.activePage,
    required this.sidebarController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(horizontal: 45),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2.5,
            blurRadius: 2.5,
            offset: Offset(0, 2.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logos/logo-icon.png', height: 75),
          Row(
            children: [
              IconButton(
                onPressed: sidebarController.toggle,
                icon: Obx(() => AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      child: sidebarController.isOpen.value
                          ? Icon(Icons.close, key: ValueKey('close'))
                          : Icon(Icons.menu, key: ValueKey('menu')),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
