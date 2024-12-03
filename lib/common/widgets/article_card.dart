import 'package:flutter/material.dart';
import 'package:investsyncwebsite/data/newsletter_data.dart';

class ArticleCard extends StatefulWidget {
  final Article article;
  final VoidCallback onTap;

  const ArticleCard({
    Key? key,
    required this.article,
    required this.onTap,
  }) : super(key: key);
  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap, // Trigger the onTap function when clicked
        child: Container(
          height: 340.0, // Fixed height for the card
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
                widget.article.imagePath, // Dynamic image path
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
                                widget.article.teamName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${widget.article.date} • ${widget.article.readTime}',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
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
                      SizedBox(height: 13),
                      AnimatedDefaultTextStyle(
                        duration: Duration(
                            milliseconds: 100), // Duration of the animation
                        curve: Curves.easeInOut, // Smooth animation curve
                        style: TextStyle(
                            color: isHovered
                                ? Color.fromARGB(255, 11, 53, 221)
                                : Colors.black,
                            fontSize: 22,
                            fontFamily: 'Cormorant',
                            fontWeight: FontWeight.w800,
                            height: 1.4),
                        child: Text(widget.article.title.toUpperCase()),
                      ),
                      SizedBox(height: 13),
                      AnimatedDefaultTextStyle(
                        duration: Duration(
                            milliseconds: 100), // Duration of the animation
                        curve: Curves.easeInOut, // Smooth animation curve
                        style: TextStyle(
                          color: isHovered
                              ? Color.fromARGB(255, 11, 53, 221)
                              : Colors.black,
                          fontFamily: 'Typold',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height:
                              1.5, // Increase the line spacing (1.5x the font size)
                        ),
                        child: Text(widget.article.description),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
