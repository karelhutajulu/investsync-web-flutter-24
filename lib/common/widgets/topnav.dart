import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// final Size defaultDeviceSize = Size(1536.0, 729.6);
// Size deviceSize = Size(0, 0); // Default size

class TopNav extends StatelessWidget {
  final String activePage; // Track the active page
  final VoidCallback onSideNavPressed;
  
  const TopNav({super.key, required this.activePage, required this.onSideNavPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1150) {
          return DesktopTopNav(activePage: activePage);
        }
        else if (constraints.maxWidth > 650) {
          return TabletTopNav(activePage: activePage, onSideNavPressed: onSideNavPressed);
        }
        else {
          return MobileTopNav(activePage: activePage, onSideNavPressed: onSideNavPressed);
        }
      },
    );
  }
}

class DesktopTopNav extends StatelessWidget {
  final String activePage; // Track the active page
  
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

class TabletTopNav extends StatelessWidget {
  final String activePage; // Track the active page
  final VoidCallback onSideNavPressed;
  
  const TabletTopNav({super.key, required this.activePage, required this.onSideNavPressed});

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

class MobileTopNav extends StatelessWidget {
  final String activePage; // Track the active page
  final VoidCallback onSideNavPressed;
  
  const MobileTopNav({super.key, required this.activePage, required this.onSideNavPressed});

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
  bool isHovered = false;  // Hover state for the original button
  bool isHoveredAdmin = false;  // Hover state for Admin login button
  bool isHoveredJoin = false;  // Hover state for Join button inside the dialog

  void _ShowJoinAdmin(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: 300,
            height: 200,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Admin Login Button
                MouseRegion(
                  onEnter: (_) => setState(() => isHoveredAdmin = true),
                  onExit: (_) => setState(() => isHoveredAdmin = false),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: isHoveredAdmin
                          ? Color.fromARGB(255, 11, 53, 110) // Hover color
                          : Color.fromARGB(255, 11, 53, 221), // Default blue color
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close Modal
                        _OpenAdminLogin(context); // Show Admin Login Page
                      },
                      child: Text(
                        'Admin Login',
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
                ),
                SizedBox(height: 10),

                // Join Button
                MouseRegion(
                  onEnter: (_) => setState(() => isHoveredJoin = true),
                  onExit: (_) => setState(() => isHoveredJoin = false),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: isHoveredJoin
                          ? Color.fromARGB(255, 11, 53, 110) // Hover color
                          : Color.fromARGB(255, 11, 53, 221), // Default blue color
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close Modal
                        final url = Uri.parse('https://forms.gle/kyek727fVJ38ABzt6');
                        launchUrl(url); // Open Google Form URL
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _OpenAdminLogin (BuildContext context) {
    print ("Admin Login Cliked");
  }

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
            _ShowJoinAdmin(context);
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