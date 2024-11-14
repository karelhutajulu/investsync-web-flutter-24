import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/navigation_bar.dart'; // Import the CustomNavigationBar
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: CustomNavigationBar(), // Use the custom navigation bar
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
                  height: 200,
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
                      "Meet the Team",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
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
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  Text(
                    "Board of Directors",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Serif', // Specify font
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 100,
                    color: Colors.black87,
                    margin: EdgeInsets.only(top: 4),
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
                        imagePath: "assets/images/photos/Artboard 1.png",
                      ),
                      TeamMemberCard(
                        name: "Caitlyn Kay",
                        role: "Co-President",
                        imagePath: "assets/images/photos/Artboard 2.png",
                      ),
                      TeamMemberCard(
                        name: "William A. Tanex",
                        role: "Vice President",
                        imagePath: "assets/images/photos/Artboard 3.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Second Row of team members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Bhurida Chatlekhaivanich",
                        role: "Chief Finance Officer",
                        imagePath: "assets/images/photos/Artboard 7.png",
                      ),
                      TeamMemberCard(
                        name: "Nikita Tanaya",
                        role: "Chief Technology Officer",
                        imagePath: "assets/images/photos/Artboard 4.png",
                      ),
                      TeamMemberCard(
                        name: "TBA",
                        role: "CMO",
                        imagePath: "assets/images/photos/63699.png",
                        isPlaceholder: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Third Row of team members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Maire Baukop Hellem",
                        role: "Chief HR Officer",
                        imagePath: "assets/images/photos/Artboard 10.png",
                      ),
                      TeamMemberCard(
                        name: "TBA",
                        role: "Chief Editor",
                        imagePath: "assets/images/photos/63699.png",
                      ),
                      TeamMemberCard(
                        name: "Junjira Adisakdechakul",
                        role: "External HR Manager",
                        imagePath: "assets/images/photos/Artboard 11.png",
                        isPlaceholder: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Fourth Row of Team Members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Chrisantha Ongko",
                        role: "Internal HR Manager",
                        imagePath: "assets/images/photos/Artboard 12.png",
                      ),
                      TeamMemberCard(
                        name: "Vincent Ang",
                        role: "Secretary",
                        imagePath: "assets/images/photos/Artboard 17.png",
                      ),
                      TeamMemberCard(
                        name: "Olivia D. Christanto",
                        role: "Secretary",
                        imagePath: "assets/images/photos/Artboard 18.png",
                        isPlaceholder: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Fifth Row of Team Members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Cellinie",
                        role: "Market Analyst",
                        imagePath: "assets/images/photos/63699.png",
                      ),
                      TeamMemberCard(
                        name: "Annabel Leonardi",
                        role: "Market Analyst",
                        imagePath: "assets/images/photos/Artboard 15.png",
                      ),
                      TeamMemberCard(
                        name: "Angelina C. Handonjo",
                        role: "Market Analyst",
                        imagePath: "assets/images/photos/Artboard 16.png",
                        isPlaceholder: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Sixth Row of Team Members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Bryan Jonathan",
                        role: "Web Developer",
                        imagePath: "assets/images/photos/Artboard 5.png",
                      ),
                      TeamMemberCard(
                        name: "Matthew Kwok",
                        role: "Web Developer",
                        imagePath: "assets/images/photos/Artboard 6.png",
                      ),
                      TeamMemberCard(
                        name: "Chananan Watsooksunti",
                        role: "Treasury",
                        imagePath: "assets/images/photos/Artboard 8.png",
                        isPlaceholder: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Seventh Row of Team Members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamMemberCard(
                        name: "Bryan Budiarto Sutanto",
                        role: "Treasury",
                        imagePath: "assets/images/photos/Artboard 9.png",
                      ),
                      TeamMemberCard(
                        name: "Eugenia J. Budiono",
                        role: "Publicist",
                        imagePath: "assets/images/photos/Artboard 20.png",
                        isPlaceholder: true,
                      ),
                      TeamMemberCard(
                        name: "Angelica P. T. Tuerah",
                        role: "Publicist",
                        imagePath: "assets/images/photos/Artboard 19.png",
                      ),
                    ],
                  ),

                ],
              ),
            ),
            // Investment Team Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  Text(
                    "Investment Team",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Serif', // Specify font
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 100,
                    color: Colors.black87,
                    margin: EdgeInsets.only(top: 4),
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
                        imagePath: "assets/images/photos/63699.png",
                      ),
                      TeamMemberCard(
                        name: "Reinard T.J. Nathaniel",
                        role: "Senior Analyst",
                        imagePath: "assets/images/photos/63699.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom Navigation Bar - appears only at the end
            SizedBox(height: 30),
            BotNav(), // This will be at the end of the page
          ],
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;
  final bool isPlaceholder;

  const TeamMemberCard({
    required this.name,
    required this.role,
    required this.imagePath,
    this.isPlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Set fixed width for consistent sizing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Left-align content
        children: [
          // Square Image Container
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Slightly rounded corners
              image: DecorationImage(
                image: isPlaceholder
                    ? AssetImage("assets/placeholder.png") // Placeholder image path
                    : AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              color: Colors.grey[200],
            ),
          ),
          SizedBox(height: 12),
          // Name Text (left-aligned)
          Text(
            name.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Serif', // Set the desired font
            ),
          ),
          // Role Text (left-aligned)
          Text(
            role,
            style: TextStyle(
              fontSize: 13,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontFamily: 'Serif', // Set the desired font
            ),
          ),
          SizedBox(height: 8),
          // Icons Row (Email, LinkedIn) left-aligned
          Row(
            children: [
              Icon(Icons.email, size: 20, color: Colors.black87),
              SizedBox(width: 8),
              Icon(Icons.link, size: 20, color: Colors.black87),
            ],
          ),
        ],
      ),
    );
  }
}
