import 'package:flutter/material.dart';
import 'package:investsyncwebsite/common/widgets/topnav.dart'; // Import the navigation bar
import 'package:investsyncwebsite/common/widgets/article_card.dart'; // Import the ArticleCard widget
import 'package:investsyncwebsite/common/widgets/botnav.dart'; // Import the BotNav widget
import 'package:investsyncwebsite/data/newsletter_data.dart'; // Import the articles data
import 'package:investsyncwebsite/pages/newsletter_detail_page.dart'; // Import the ArticleDetailPage

class NewsletterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set background color of the page to white
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            110.0), // Set the height of your custom navigation bar
        child: CustomNavigationBar(activePage: 'Newsletter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 270.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: articles.map((article) {
                  return Column(
                    children: [
                      ArticleCard(
                        article: article,
                        onTap: () {
                          print('Article tapped: ${article.title}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticleDetailPage(article: article),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                }).toList(),
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
