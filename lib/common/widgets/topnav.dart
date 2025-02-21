import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investsyncwebsite/pages/home_page.dart';
import 'package:investsyncwebsite/pages/newsletter_page.dart';
import 'package:investsyncwebsite/pages/team_page.dart';
import 'package:investsyncwebsite/pages/portfolio_page.dart';
import 'package:url_launcher/url_launcher.dart';

final Size defaultDeviceSize = Size(1536.0, 729.6);
Size deviceSize = Size(0, 0); // Default size

class NavBar extends StatelessWidget {
  final String activePage; // Track the active page
  final VoidCallback onSideNavPressed;
  
  const NavBar({super.key, required this.activePage, required this.onSideNavPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1150) {
          return DesktopNavigationBar(activePage: activePage);
        }
        else if (constraints.maxWidth > 650) {
          return MobileNavigationBar1(activePage: activePage, onSideNavPressed: onSideNavPressed);
        }
        else {
          return MobileNavigationBar2(activePage: activePage, onSideNavPressed: onSideNavPressed);
        }
      },
    );
  }
}

class DesktopNavigationBar extends StatelessWidget {
  final String activePage; // Track the active page
  
  const DesktopNavigationBar({super.key, required this.activePage});

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
          Image.asset(
            'assets/logos/investsync-logo.jpg',
            height: 65,
          ),
          Row(
            children: [
              NavBarItem(
                title: 'Home',
                isActive:
                    activePage == 'Home', // Check if this is the active page
                onTap: () {
                  // Using GetX to navigate with a fade transition
                  Get.toNamed("/");
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Team',
                isActive:
                    activePage == 'Team', // Check if this is the active page
                onTap: () {
                  Get.toNamed("/team");
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Newsletter',
                isActive: activePage ==
                    'Newsletter', // Check if this is the active page
                onTap: () {
                  Get.toNamed("/newsletter");
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Portfolio',
                isActive: activePage ==
                    'Portfolio', // Check if this is the active page
                onTap: () {
                  Get.toNamed("/portfolio");
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

class MobileNavigationBar1 extends StatelessWidget {
  final String activePage; // Track the active page
  final VoidCallback onSideNavPressed;
  
  const MobileNavigationBar1({super.key, required this.activePage, required this.onSideNavPressed});

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
          Image.asset(
            'assets/logos/investsync-logo.jpg',
            height: 65,
          ),
          Row(
            children: [
              JoinButton(),
              SizedBox(width: 20),
              IconButton(
                onPressed: onSideNavPressed,
                icon: Icon(Icons.menu)
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MobileNavigationBar2 extends StatelessWidget {
  final String activePage; // Track the active page
  final VoidCallback onSideNavPressed;
  
  const MobileNavigationBar2({super.key, required this.activePage, required this.onSideNavPressed});

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
          Image.asset(
            'assets/logos/logo-icon.png',
            height: 75,
          ),
          Row(
            children: [
              JoinButton(),
              SizedBox(width: 20),
              IconButton(
                onPressed: onSideNavPressed,
                icon: Icon(Icons.menu)
              )
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
        padding: EdgeInsets.all(16.0),
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
              fontFamily: 'Cormorant',
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
              fontFamily: 'Cormorant',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    );
  }
}