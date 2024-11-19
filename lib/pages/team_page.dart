import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the CustomNavigationBar
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: CustomNavigationBar(activePage: 'Team'), // Use the custom navigation bar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section with Background Image
            Stack(
              children: [
                // Background Image
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/photos/golden_bull.png"), // Path to your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // "Meet the Team" Text Overlay
                Positioned.fill(
                  child: Center(
                    child: Text(
                      "MEET THE TEAM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cormorant',
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 5.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Board of Directors Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Column(
                children: [
                  Text(
                    "BOARD OF DIRECTORS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 49,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Cormorant', // Specify font
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 30,
                    color: Colors.black87,
                    margin: EdgeInsets.only(top: 6),
                  ),
                ],
              ),
            ),
            // Team Members Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  // First Row of team members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Hoyun Joseph Jung",
                        role: "President",
                        imagePath: "assets/images/photos/HJJ.png",
                      ),
                      TeamMemberCard(
                        name: "Caitlyn Kay",
                        role: "Co-President",
                        imagePath: "assets/images/photos/CK.png",
                      ),
                      TeamMemberCard(
                        name: "William A. Tanex",
                        role: "Vice President",
                        imagePath: "assets/images/photos/WAT.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Second Row of team members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Bhurida Chatlekhaivanich",
                        role: "Chief Finance Officer",
                        imagePath: "assets/images/photos/BC.png",
                      ),
                      TeamMemberCard(
                        name: "Nikita Tanaya",
                        role: "Chief Technology Officer",
                        imagePath: "assets/images/photos/NT.png",
                      ),
                      TeamMemberCard(
                        name: "TBA",
                        role: "CMO",
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Third Row of team members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Maire Baukop Hellem",
                        role: "Chief HR Officer",
                        imagePath: "assets/images/photos/MBH.png",
                      ),
                      TeamMemberCard(
                        name: "TBA",
                        role: "Chief Editor",
                      ),
                      TeamMemberCard(
                        name: "Junjira Adisakdechakul",
                        role: "External HR Manager",
                        imagePath: "assets/images/photos/JA.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Fourth Row of Team Members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Chrisantha Ongko",
                        role: "Internal HR Manager",
                        imagePath: "assets/images/photos/CO.png",
                      ),
                      TeamMemberCard(
                        name: "Vincent Ang",
                        role: "Secretary",
                        imagePath: "assets/images/photos/VA.png",
                      ),
                      TeamMemberCard(
                        name: "Olivia D. Christanto",
                        role: "Secretary",
                        imagePath: "assets/images/photos/ODC.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Fifth Row of Team Members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Cellinie",
                        role: "Market Analyst",
                      ),
                      TeamMemberCard(
                        name: "Annabel Leonardi",
                        role: "Market Analyst",
                        imagePath: "assets/images/photos/AL.png",
                      ),
                      TeamMemberCard(
                        name: "Angelina C. Handonjo",
                        role: "Market Analyst",
                        imagePath: "assets/images/photos/ACH.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Sixth Row of Team Members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Bryan Jonathan",
                        role: "Web Developer",
                        imagePath: "assets/images/photos/BJ.png",
                      ),
                      TeamMemberCard(
                        name: "Matthew Kwok",
                        role: "Web Developer",
                        imagePath: "assets/images/photos/MK.png",
                      ),
                      TeamMemberCard(
                        name: "Chananan Watsooksunti",
                        role: "Treasury",
                        imagePath: "assets/images/photos/CW.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  // Seventh Row of Team Members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Bryan Budiarto Sutanto",
                        role: "Treasury",
                        imagePath: "assets/images/photos/BBS.png",
                      ),
                      TeamMemberCard(
                        name: "Eugenia J. Budiono",
                        role: "Publicist",
                        imagePath: "assets/images/photos/EJB.png",
                      ),
                      TeamMemberCard(
                        name: "Angelica P. T. Tuerah",
                        role: "Publicist",
                        imagePath: "assets/images/photos/APTT.png",
                      ),
                    ],
                  ),

                ],
              ),
            ),
            // Investment Team Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Column(
                children: [
                  Text(
                    "INVESTMENT TEAM",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 49,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Cormorant', // Specify font
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 30,
                    color: Colors.black87,
                    margin: EdgeInsets.only(top: 6),
                  ),
                ],
              ),
            ),
            // Team Members Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  // First Row of team members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "William H. Loe",
                        role: "Senior Analyst",
                      ),
                      TeamMemberCard(
                        name: "Reinard T.J. Nathaniel",
                        role: "Senior Analyst",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom Navigation Bar - appears only at the end
            SizedBox(height: 60),
            BotNav(), // This will be at the end of the page
          ],
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatefulWidget {
  final String name;
  final String role;
  final String imagePath;
  const TeamMemberCard({
    required this.name,
    required this.role,
    this.imagePath = 'assets/images/photos/placeholder.png', // Default placeholder image if no imagePath is specified in the widget call
  });

  @override
  _TeamMemberCardState createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard> {
  bool isHovered1 = false;
  bool isHovered2 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375, // Set fixed width for consistent sizing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Left-align content
        children: [
          // Square Image Container
          Container(
            width: 375,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Slightly rounded corners
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
              color: Colors.grey[200],
            ),
          ),
          SizedBox(height: 12),
          // Name Text (left-aligned)
          Text(
            widget.name.toUpperCase(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
              fontFamily: 'Cormorant', // Set the desired font
            ),
          ),
          // Role Text (left-aligned)
          Text(
            widget.role,
            style: TextStyle(
              fontSize: 22,
              color: Color.fromRGBO(11, 71, 222, 1),
              fontWeight: FontWeight.w900,
              fontFamily: 'Cormorant', // Set the desired font
            ),
          ),
          SizedBox(height: 8),
          // Icons Row (Email, LinkedIn) left-aligned
          Row(
            children: [
              MouseRegion(
                onEnter: (_) => setState(() => isHovered1 = true),
                onExit: (_) => setState(() => isHovered1 = false),
                child: Icon(Icons.email, size: 30, color: isHovered1 ? Color.fromARGB(255, 11, 53, 221) : Colors.black87),
              ),
              SizedBox(width: 8),
              MouseRegion(
                onEnter: (_) => setState(() => isHovered2 = true),
                onExit: (_) => setState(() => isHovered2 = false),
                child: Icon(Icons.link, size: 30, color: isHovered2 ? Color.fromARGB(255, 11, 53, 221) :  Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
