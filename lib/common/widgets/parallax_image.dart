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
      expandedHeight: 680.0,
      pinned: false,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Builder(
          builder: (context) {
            // Calculate parallax offset based on scroll position
            double scrollOffset = scrollController.hasClients ? scrollController.offset : 0;
            double parallaxOffset = scrollOffset * parallaxFactor; // Adjust parallax speed

            // Create a list of Positioned widgets for the titles
            List<Widget> titleWidgets = [];
            title.forEach((text, properties) {
              double fontSize = properties['Size']?.toDouble() ?? 24.0;
              double horizontalPos = properties['HorizontalPos']?.toDouble() ?? 0.0;
              double verticalPos = properties['VerticalPos']?.toDouble() ?? 0.0;

              // Add the text widget to the titleWidgets list
              titleWidgets.add(Positioned(
                left: anchor == 'left' ? horizontalPos : null,
                right: anchor == 'right' ? horizontalPos : null,
                top: verticalPos + parallaxOffset, // Add parallax effect to text position
                child: Text(
                  text,
                  style: TextStyle(fontSize: fontSize, color: Colors.white),
                ),
              ));
            });

            return Stack(
              children: [
                // Apply the parallax translation to the image
                Transform.translate(
                  offset: Offset(0, parallaxOffset), // Apply parallax translation to image
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