import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome icons
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher for link actions

class BotNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0, // Increased height for the bottom navigation bar
      color: Colors.black87, // Dark background color for the BotNav section
      padding: EdgeInsets.symmetric(
          horizontal: 100), // Horizontal padding for alignment
      child: Row(
        children: [
          // Logo on the left
          Image.asset(
            'assets/logos/investsync-logo-white.jpg', // Path to white logo image
            height: 80.0, // Adjusted height for the logo
          ),
          Spacer(), // Takes up remaining space to push navigation items to the right

          // Right-aligned navigation icons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: FontAwesomeIcons.linkedin,
                onTap: () async {
                  const url = 'https://www.linkedin.com/company/investsync/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              SizedBox(width: 30),
              IconButton(
                icon: FontAwesomeIcons.envelope,
                onTap: () async {
                  final emailUrl =
                      'mailto:investsyncofficial@gmail.com?subject=Hello%20InvestSync';
                  if (await canLaunch(emailUrl)) {
                    await launch(emailUrl);
                  } else {
                    throw 'Could not launch $emailUrl';
                  }
                },
              ),
              SizedBox(width: 30),
              IconButton(
                icon: FontAwesomeIcons.instagram,
                onTap: () {
                  // Add Instagram link or action here
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const IconButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  _IconButtonState createState() => _IconButtonState();
}

// Custom widget for an icon button
class _IconButtonState extends State<IconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Icon(
          widget.icon,
          color: isHovered ? Color.fromARGB(255, 11, 53, 221) : Colors.white,
          size: 30, // Icon size
        ),
      ),
    );
  }
}
