import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String imagePath;
  final String teamName;
  final String date;
  final String readTime;
  final String title;
  final String description;

  const ArticleCard({
    Key? key,
    required this.imagePath,
    required this.teamName,
    required this.date,
    required this.readTime,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0, // Fixed height for the card
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5), // Border color
          width: 1.5, // Border width
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Ensures full height for children
        children: [
          Image.asset(
            imagePath, // Dynamic image path
            width: 450, // Set width for the image
            height: 350, // Match height of the card
            fit: BoxFit.cover, // Cover the entire area
          ),

          // Text section with horizontal padding
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical:
                      25), // Horizontal and vertical padding for text section

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon and metadata row
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/logos/logo-icon.png', // Path to your logo image
                          width: 25, // Set width of the icon
                          height: 25, // Set height of the icon
                          fit: BoxFit.cover, // Fit the image within the circle
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            teamName, // Dynamic team name
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '$date • $readTime',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.more_vert, size: 16),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Title
                  Text(
                    title, // Dynamic title
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Description
                  Text(
                    description, // Dynamic description
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
