import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart';

class TopNav extends StatelessWidget {
  final String activePage;

  const TopNav({super.key, required this.activePage});

  @override
  Widget build(BuildContext context) {
    final SidebarController sidebarController = Get.find();

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1150) {
          return DesktopTopNav(activePage: activePage);
        } else if (constraints.maxWidth > 650) {
          return TabletTopNav(
            activePage: activePage,
            sidebarController: sidebarController,
          );
        } else {
          return MobileTopNav(
            activePage: activePage,
            sidebarController: sidebarController,
          );
        }
      },
    );
  }
}

// TopNav Item for Desktop
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
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w400,
          fontFamily: 'Minerva',
          color: Colors.black,
        ).copyWith(
          decoration: active ? TextDecoration.underline : TextDecoration.none,
          decorationThickness: 1,
        ),
      ),
    );
  }
}

// JOIN Button
class _JoinButton extends StatelessWidget {
  const _JoinButton({super.key});

  void _launchJoinForm() async {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLSc9DmuIFFhA7ArmEX9kQJ4FRBxgAa34KCiAir1LFEixHfirFw/viewform?pli=1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch the form';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchJoinForm,
      child: Container(
        margin: const EdgeInsets.only(left: 32),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Join',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            fontFamily: 'Minerva',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// Desktop Version
class DesktopTopNav extends StatelessWidget {
  final String activePage;

  const DesktopTopNav({super.key, required this.activePage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2.5,
            blurRadius: 2.5,
            offset: const Offset(0, 2.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logos/investsync-logo.jpg', height: 65),
          Row(
            children: [
              _TopNavItem(
                  title: 'About Us', route: '/', active: activePage == 'Home'),
              const SizedBox(width: 20),
              _TopNavItem(
                  title: 'Team', route: '/team', active: activePage == 'Team'),
              const SizedBox(width: 20),
              _TopNavItem(
                  title: 'Newsletter',
                  route: '/newsletter',
                  active: activePage == 'Newsletter'),
              const SizedBox(width: 20),
              _TopNavItem(
                  title: 'Portfolio',
                  route: '/portfolio',
                  active: activePage == 'Portfolio'),
              const _JoinButton(), // 👉 JOIN BUTTON added here
            ],
          ),
        ],
      ),
    );
  }
}

// Tablet and Mobile Versions (hamburger menu)
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
      activePage: activePage,
      sidebarController: sidebarController,
    );
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
      activePage: activePage,
      sidebarController: sidebarController,
    );
  }
}

// Mobile & Tablet Shared TopNav with Hamburger Icon
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
      padding: const EdgeInsets.symmetric(horizontal: 45),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2.5,
            blurRadius: 2.5,
            offset: const Offset(0, 2.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logos/logo-icon.png', height: 75),
          IconButton(
            onPressed: sidebarController.toggle,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: sidebarController.animationController,
              size: 32,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
