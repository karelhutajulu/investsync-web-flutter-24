import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      if (!sidebarController.isOpen.value) return SizedBox.shrink();

      return Positioned(
        top: 110,
        left: 0,
        right: 0,
        bottom: 0,
        child: AnimatedOpacity(
          opacity: sidebarController.isOpen.value ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // ✅ Text stays left
              children: [
                Spacer(flex: 2),
                _AnimatedSideNavItem(
                    title: 'About Us',
                    route: '/',
                    active: activePage == 'Home'),
                SizedBox(height: 6), // ✅ Small vertical spacing
                _AnimatedSideNavItem(
                    title: 'Team',
                    route: '/team',
                    active: activePage == 'Team'),
                SizedBox(height: 6),
                _AnimatedSideNavItem(
                    title: 'Newsletter',
                    route: '/newsletter',
                    active: activePage == 'Newsletter'),
                SizedBox(height: 6),
                _AnimatedSideNavItem(
                    title: 'Portfolio',
                    route: '/portfolio',
                    active: activePage == 'Portfolio'),
                Spacer(flex: 3),
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
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset(0, 0),
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
                  height: 1.0, // ✅ No extra space inside Text
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Minerva',
                  color: Colors.black,
                  decoration: widget.active
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationThickness: 1,
                ),
              ),
              SizedBox(width: 8),
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
