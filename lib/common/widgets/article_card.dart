import 'package:flutter/material.dart';
import 'package:investsyncwebsite/data/newsletter_data.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  const ArticleCard({
    Key? key,
    required this.article,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the onTap function when clicked
      child: Container(
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
              article.imagePath, // Dynamic image path
              width: 450, // Set width for the image
              height: 350, // Match height of the card
              fit: BoxFit.cover, // Cover the entire area
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/logos/logo-icon.png', // Path to your logo image
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.teamName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${article.date} • ${article.readTime}',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
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
                    Text(
                      article.title.toUpperCase(),
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Cormorant',
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      article.description,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
