import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investsyncwebsite/controllers/sidebar_controller.dart';
import 'package:url_launcher/url_launcher.dart';

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
      if (!sidebarController.isOpen.value) return SizedBox.shrink();

      return Positioned(
        top: 110,
        left: 0,
        right: 0,
        bottom: 0,
        child: AnimatedOpacity(
          opacity: sidebarController.isOpen.value ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),

                _AnimatedSideNavItem(
                    title: 'About Us',
                    route: '/',
                    active: activePage == 'Home'),
                const SizedBox(height: 6),
                _AnimatedSideNavItem(
                    title: 'Team',
                    route: '/team',
                    active: activePage == 'Team'),
                const SizedBox(height: 6),
                _AnimatedSideNavItem(
                    title: 'Newsletter',
                    route: '/newsletter',
                    active: activePage == 'Newsletter'),
                const SizedBox(height: 6),
                _AnimatedSideNavItem(
                    title: 'Portfolio',
                    route: '/portfolio',
                    active: activePage == 'Portfolio'),

                const Spacer(flex: 3),

                // Join Button
                _JoinButton(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _AnimatedSideNavItem extends StatefulWidget {
  final String title;
  final String route;
  final bool active;

  const _AnimatedSideNavItem({
    required this.title,
    required this.route,
    required this.active,
  });

  @override
  State<_AnimatedSideNavItem> createState() => _AnimatedSideNavItemState();
}

class _AnimatedSideNavItemState extends State<_AnimatedSideNavItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SidebarController sidebarController = Get.find();

    return GestureDetector(
      onTap: () {
        sidebarController.close();
        Get.toNamed(widget.route);
      },
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 46,
                  height: 1.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Minerva',
                  color: Colors.black,
                  decoration: widget.active
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationThickness: 1,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/icons/finalgyat.svg',
                height: 38,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// JOIN Button Widget
class _JoinButton extends StatelessWidget {
  const _JoinButton({super.key});

  void _launchJoinForm() async {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLSc9DmuIFFhA7ArmEX9kQJ4FRBxgAa34KCiAir1LFEixHfirFw/viewform?pli=1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Join Form';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchJoinForm,
      child: Container(
        margin: const EdgeInsets.only(top: 24),
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
