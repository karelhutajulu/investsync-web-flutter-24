import 'package:flutter/material.dart';

class ParallaxImage extends StatelessWidget {
  final String imageUrl;
  final ScrollController scrollController;
  final double parallaxFactor;
  final Map<String, Map<String, int>> title;
  final String anchor;

  const ParallaxImage({
    Key? key,
    required this.imageUrl,
    required this.scrollController,
    required this.parallaxFactor,
    required this.title,
    this.anchor = 'left',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 900,
      pinned: false,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Builder(
          builder: (context) {
            // Calculate parallax offset based on scroll position
            double scrollOffset =
                scrollController.hasClients ? scrollController.offset : 0;
            double parallaxOffset =
                scrollOffset * parallaxFactor; // Adjust parallax speed

            // Create a list of Positioned widgets for the titles
            List<Widget> titleWidgets = [];
            title.forEach((text, properties) {
              double fontSize = (properties['Size']?.toDouble() ?? 24.0) * 1.5;
              double firstLetterFontSize =
                  fontSize * 1.3; // Larger font for the first letter
              double horizontalPos =
                  properties['HorizontalPos']?.toDouble() ?? 0.0;
              double verticalPos = properties['VerticalPos']?.toDouble() ?? 0.0;

              // Check if text is 'Invest Sync' to apply custom styling for the first letter
              Widget textWidget;
              if (text == 'INVESTSYNC') {
                // Separate the first letter of each word and apply larger font size
                textWidget = RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'I',
                        style: TextStyle(
                          fontSize: firstLetterFontSize,
                          fontFamily: 'Cormorant',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'NVEST',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontFamily: 'Cormorant',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'S',
                        style: TextStyle(
                          fontSize: firstLetterFontSize,
                          fontFamily: 'Cormorant',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'YNC',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontFamily: 'Cormorant',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                // Default styling for other text
                textWidget = Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Cormorant',
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                );
              }

              titleWidgets.add(Positioned(
                left: anchor == 'left' ? horizontalPos : null,
                right: anchor == 'right' ? horizontalPos : null,
                top: verticalPos +
                    parallaxOffset, // Add parallax effect to text position
                child: textWidget,
              ));
            });

            return Stack(
              children: [
                // Apply the parallax translation to the image
                Transform.translate(
                  offset: Offset(
                      0, parallaxOffset), // Apply parallax translation to image
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity, // Ensure the image fills the screen
                  ),
                ),
                // Overlay the dynamically positioned text on top of the image
                ...titleWidgets,
              ],
            );
          },
        ),
      ),
    );
  }
}
