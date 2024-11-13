import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/navigation_bar.dart'; // Import the navigation bar
import 'package:investsyncwebsite/common/widgets/article_card.dart'; // Import the ArticleCard widget
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav widget

class NewsletterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set background color of the page to white
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            110.0), // Set the height of your custom navigation bar
        child: CustomNavigationBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 270.0,
                  vertical: 40), // Left and right margin for articles only
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align to the left
                children: [
                  ArticleCard(
                    imagePath:
                        'assets/images/photos/south_korea_flag.jpg', // Path to the image
                    teamName: 'Market Research Team', // Custom team name
                    date: 'May 16', // Custom date
                    readTime: '3 min read', // Custom read time
                    title:
                        'Inflation and Interest Rate Challenges in South Korea', // Custom title
                    description:
                        'Key Takeaways: Interest Rate Increases: South Korea\'s interest rate is at 3.5% in response to U.S. Federal Reserve hikes. Adjustments aim...', // Custom description
                  ),
                  SizedBox(height: 30), // Space between the cards
                  ArticleCard(
                    imagePath:
                        'assets/images/photos/tech_innovation.jpg', // Path to the image
                    teamName: 'Market Research Team', // Custom team name
                    date: 'June 5', // Custom date
                    readTime: '5 min read', // Custom read time
                    title:
                        'The Future of AI and Automation in Tech', // Custom title
                    description:
                        'Key Takeaways: The rapid development of AI is reshaping industries across the globe, from healthcare to finance...', // Custom description
                  ),
                  SizedBox(height: 30), // Space between the cards
                  ArticleCard(
                    imagePath:
                        'assets/images/photos/tech_innovation.jpg', // Path to the image
                    teamName: 'Sustainability Team', // Custom team name
                    date: 'July 10', // Custom date
                    readTime: '4 min read', // Custom read time
                    title:
                        'Energy Solutions for a Sustainable Future', // Custom title
                    description:
                        'Key Takeaways: The transition to renewable energy sources is becoming more critical in reducing carbon emissions and ensuring energy security...', // Custom description
                  ),
                  SizedBox(height: 30), // Space between the cards
                  ArticleCard(
                    imagePath:
                        'assets/images/photos/tech_innovation.jpg', // Path to the image
                    teamName: 'Global Trade Team', // Custom team name
                    date: 'August 20', // Custom date
                    readTime: '6 min read', // Custom read time
                    title:
                        'The Impact of Global Trade Tensions on Emerging Markets', // Custom title
                    description:
                        'Key Takeaways: Trade conflicts between major economies are influencing the stability of emerging markets, with potential long-term consequences...', // Custom description
                  ),
                ],
              ),
            ),
            // Add BotNav at the bottom without padding
            BotNav(),
          ],
        ),
      ),
    );
  }
}
