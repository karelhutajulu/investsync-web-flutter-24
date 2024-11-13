import 'package:flutter/material.dart';

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
            height: 50.0, // Adjusted height for the logo
          ),
          Spacer(), // Takes up remaining space to push navigation items to the center

          // Centered navigation items
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _IconTextButton(
                icon: Icons.business,
                label: 'Home',
                onTap: () {
                  // Home navigation action
                },
              ),
              SizedBox(width: 30),
              _IconTextButton(
                icon: Icons.email,
                label: 'Team',
                onTap: () {
                  // Team navigation action
                },
              ),
              SizedBox(width: 30),
              _IconTextButton(
                icon: Icons.camera_alt,
                label: 'Newsletter',
                onTap: () {
                  // Newsletter navigation action
                },
              ),
              SizedBox(width: 30),
              _IconTextButton(
                icon: Icons.portrait,
                label: 'Portfolio',
                onTap: () {
                  // Portfolio navigation action
                },
              ),
            ],
          ),
          Spacer(), // Adds space on the right to balance the layout
        ],
      ),
    );
  }
}

// Custom widget for an icon with centered text below
class _IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _IconTextButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment
            .center, // Center content vertically in each button
        children: [
          Icon(icon, color: Colors.white, size: 30), // Icon size
          SizedBox(height: 8), // Space between icon and text
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16, // Font size for label
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
