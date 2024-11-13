import 'package:flutter/material.dart';
import 'package:investsyncwebsite/pages/homepage.dart'; // Import HomePage
import 'package:investsyncwebsite/pages/newsletterpage.dart';
import 'package:investsyncwebsite/pages/teampage.dart'; // Import TeamPage
import 'package:investsyncwebsite/pages/portfoliopage.dart'; // Import PortfolioPage
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0, // Set the height of the navbar
      padding: EdgeInsets.symmetric(horizontal: 100), // Horizontal padding
      decoration: BoxDecoration(
        color: Colors.white, // Set background color inside BoxDecoration
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color
            spreadRadius: 1, // How far the shadow spreads
            blurRadius: 2, // The softness of the shadow
            offset: Offset(0, 2), // The position of the shadow (x, y)
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logos/investsync-logo.jpg', // Your logo image
            height: 60.0, // Adjust logo height based on navbar height
          ),
          Row(
            children: [
              NavBarItem(
                title: 'Home',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Team',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeamPage()),
                  );
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Newsletter',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsletterPage()),
                  );
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: 'Portfolio',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PortfolioPage()),
                  );
                },
              ),
              SizedBox(width: 20),
              // Join button with pill shape
              JoinButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavBarItem({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black, // Changed to black for visibility
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}

class JoinButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final url = Uri.parse('https://forms.gle/kyek727fVJ38ABzt6');
        launchUrl(url);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color.fromARGB(255, 11, 53, 221), // Button background color
        padding: EdgeInsets.symmetric(
            vertical: 14, horizontal: 35), // Vertical and horizontal padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Pill shape
        ),
      ),
      child: Text(
        'Join', // Button text
        style: TextStyle(
          color: Colors.white, // Text color
          fontSize: 26, // Text size
        ),
      ),
    );
  }
}
