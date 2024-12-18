import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/pages/home_page.dart';
import 'package:investsyncwebsite/pages/newsletter_page.dart';
import 'package:investsyncwebsite/pages/team_page.dart';
import 'package:investsyncwebsite/pages/portfolio_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomNavigationBar extends StatelessWidget {
  final String activePage; // Track the active page

  const CustomNavigationBar({Key? key, required this.activePage})
      : super(key: key);

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
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      padding: EdgeInsets.symmetric(horizontal: 100),
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
            height: 60.0,
          ),
          Row(
            children: [
              NavBarItem(
                title: 'Home',
                isActive:
                    activePage == 'Home', // Check if this is the active page
                onTap: () {
                  // Using GetX to navigate with a fade transition
                  Get.offAll(() => HomePage(),
                      transition: Transition.fade,
                      duration: Duration(milliseconds: 500));
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Team',
                isActive:
                    activePage == 'Team', // Check if this is the active page
                onTap: () {
                  Get.offAll(() => TeamPage(),
                      transition: Transition.fade,
                      duration: Duration(milliseconds: 500));
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Newsletter',
                isActive: activePage ==
                    'Newsletter', // Check if this is the active page
                onTap: () {
                  Get.offAll(() => NewsletterPage(),
                      transition: Transition.fade,
                      duration: Duration(milliseconds: 500));
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Portfolio',
                isActive: activePage ==
                    'Portfolio', // Check if this is the active page
                onTap: () {
                  Get.offAll(() => PortfolioPage(),
                      transition: Transition.fade,
                      duration: Duration(milliseconds: 500));
                },
              ),
              SizedBox(width: 20),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              fontSize: 30,
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
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 35),
        child: GestureDetector(
          onTap: () {
            final url = Uri.parse('https://forms.gle/kyek727fVJ38ABzt6');
            launchUrl(url);
          },
          child: Text(
            'Join',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
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
