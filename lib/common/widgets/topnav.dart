import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/pages/home_page.dart';
import 'package:investsyncwebsite/pages/newsletter_page.dart';
import 'package:investsyncwebsite/pages/team_page.dart';
import 'package:investsyncwebsite/pages/portfolio_page.dart';
import 'package:url_launcher/url_launcher.dart';

final Size defaultDeviceSize = Size(1536.0, 729.6);
Size deviceSize = Size(0, 0); // Default size

class CustomNavigationBar extends StatefulWidget {
  final String activePage; // Track the active page

  const CustomNavigationBar({Key? key, required this.activePage})
      : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
    // Define the Fade Transition using GetX
  PageRouteBuilder _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
        return FadeTransition(opacity: fadeAnimation, child: child);
      },
      transitionDuration:
          Duration(milliseconds: 500), // Fade transition duration
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    return Container(
      height: 110/defaultDeviceSize.height * deviceSize.height,
      padding: EdgeInsets.symmetric(horizontal: 100/defaultDeviceSize.width * deviceSize.width),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logos/investsync-logo.jpg',
            height: 60/defaultDeviceSize.height * deviceSize.height,
          ),
          Row(
            children: [
              NavBarItem(
                title: 'Home',
                isActive:
                    widget.activePage == 'Home', // Check if this is the active page
                onTap: () {
                  // Using GetX to navigate with a fade transition
                  Get.toNamed("/");
                },
              ),
              SizedBox(width: 20/defaultDeviceSize.width * deviceSize.width),
              NavBarItem(
                title: 'Team',
                isActive:
                    widget.activePage == 'Team', // Check if this is the active page
                onTap: () {
                  Get.toNamed("/team");
                },
              ),
              SizedBox(width: 20/defaultDeviceSize.width * deviceSize.width),
              NavBarItem(
                title: 'Newsletter',
                isActive: widget.activePage ==
                    'Newsletter', // Check if this is the active page
                onTap: () {
                  Get.toNamed("/newsletter");
                },
              ),
              SizedBox(width: 20/defaultDeviceSize.width * deviceSize.width),
              NavBarItem(
                title: 'Portfolio',
                isActive: widget.activePage ==
                    'Portfolio', // Check if this is the active page
                onTap: () {
                  Get.toNamed("/portfolio");
                },
              ),
              SizedBox(width: 20/defaultDeviceSize.width * deviceSize.width),
              JoinButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const NavBarItem({
    Key? key,
    required this.title,
    required this.onTap,
    this.isActive = false, // Default to inactive
  }) : super(key: key);

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0 * (16/25 * (deviceSize.width / defaultDeviceSize.width) + 9/25 * (deviceSize.height / defaultDeviceSize.height))),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 150), // Duration of the animation
            curve: Curves.easeInOut, // Smooth animation curve
            style: TextStyle(
              color: widget.isActive
                  ? Color.fromARGB(255, 11, 53, 221) // Active color
                  : isHovered
                      ? Color.fromARGB(255, 11, 53, 221) // Hover color
                      : Colors.black, // Default color
              fontSize: 30 * (16/25 * (deviceSize.width / defaultDeviceSize.width) + 9/25 * (deviceSize.height / defaultDeviceSize.height)),
              fontFamily: 'Typold',
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}

class JoinButton extends StatefulWidget {
  @override
  _JoinButtonState createState() => _JoinButtonState();
}

class _JoinButtonState extends State<JoinButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(
            milliseconds: 150), // Duration of the color change animation
        curve: Curves.easeInOut, // Smooth curve for the animation
        decoration: BoxDecoration(
          color: isHovered
              ? Color.fromARGB(255, 11, 53, 110) // Hover color
              : Color.fromARGB(255, 11, 53, 221), // Default color
          borderRadius: BorderRadius.circular(30), // Maintain the pill shape
        ),
        padding: EdgeInsets.symmetric(vertical: 7/defaultDeviceSize.height * deviceSize.height, horizontal: 35/defaultDeviceSize.width * deviceSize.width),
        child: GestureDetector(
          onTap: () {
            final url = Uri.parse('https://forms.gle/kyek727fVJ38ABzt6');
            launchUrl(url);
          },
          child: Text(
            'Join',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26 * (16/25 * (deviceSize.width / defaultDeviceSize.width) + 9/25 * (deviceSize.height / defaultDeviceSize.height)),
              fontFamily: 'Typold',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    );
  }
}