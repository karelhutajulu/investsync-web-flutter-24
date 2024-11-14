import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the custom top navigation bar
import 'package:investsyncwebsite/data/article_data.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the Scaffold background color to white
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            110.0), // Set the height of your custom navigation bar
        child: CustomNavigationBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 270.0,
              vertical: 40.0), // Increased horizontal and vertical margins
          child: Container(
            padding: const EdgeInsets.all(
                80.0), // Further increased inner padding for the card content
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey, // Grey border color
                width: 1.5, // Border width
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row with Logo, Team Name, Date, and Read Time above the title
                Row(
                  children: [
                    Image.asset(
                      'assets/logos/logo-icon.png', // Path to your logo image
                      width: 32, // Adjust width of the logo
                      height: 32, // Adjust height of the logo
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 8),
                    Text(
                      article.teamName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '• ${article.date} • ${article.readTime}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 24), // Vertical space between metadata and title

                // Title below the metadata
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 34),

                // Main Image
                Image.asset(
                  article.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),

                // Article Content
                Text(
                  article.content,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
