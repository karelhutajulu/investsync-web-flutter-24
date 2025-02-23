import 'package:flutter/material.dart';
import 'package:investsyncwebsite/animations/fade_in_animation.dart';

class ParallaxImage extends StatefulWidget {
  final String imageUrl;
  final ScrollController scrollController;
  final double parallaxFactor;
  final Map<String, Map<String, double>> title;
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
  _ParallaxImageState createState() => _ParallaxImageState();
}

class _ParallaxImageState extends State<ParallaxImage> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 800,
      pinned: false,
      floating: false,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Builder(
          builder: (context) {
            // Create a list of Positioned widgets for the titles
            List<Widget> titleWidgets = [];
            widget.title.forEach((text, properties) {
              double fontSize = ((properties['Size']?.toDouble() ?? 24.0) * 1.5);
              double firstLetterFontSize =
                  fontSize * 1.3; // Larger font for the first letter
              double horizontalPos = (properties['HorizontalPos']?.toDouble() ?? 0.0);
              double verticalPos = (properties['VerticalPos']?.toDouble() ?? 0.0);

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
                left: widget.anchor == 'left' ? horizontalPos : null,
                right: widget.anchor == 'right' ? horizontalPos : null,
                top: verticalPos,
                child: FadeInAnimationWidget(content: textWidget, offset: Offset(0, 2), duration: Duration(milliseconds: 750)),
              ));
            });

            return Stack(
              children: [
                // Apply the parallax translation to the image
                Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
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

// // NOT USED ANYMORE FOR THIS VERSION
// final Size defaultDeviceSize = Size(1536.0, 729.6);
// Size deviceSize = Size(0, 0); // Default size

// class ParallaxImage extends StatefulWidget {
//   final String imageUrl;
//   final ScrollController scrollController;
//   final double parallaxFactor;
//   final Map<String, Map<String, double>> title;
//   final String anchor;

//   const ParallaxImage({
//     Key? key,
//     required this.imageUrl,
//     required this.scrollController,
//     required this.parallaxFactor,
//     required this.title,
//     this.anchor = 'left',
//   }) : super(key: key);

//   @override
//   _ParallaxImageState createState() => _ParallaxImageState();
// }

// class _ParallaxImageState extends State<ParallaxImage> {
//   @override
//   Widget build(BuildContext context) {
//     deviceSize = MediaQuery.of(context).size;

//     return SliverAppBar(
//       expandedHeight: 900,
//       pinned: false,
//       floating: false,
//       flexibleSpace: FlexibleSpaceBar(
//         background: Builder(
//           builder: (context) {
//             // Create a list of Positioned widgets for the titles
//             List<Widget> titleWidgets = [];
//             widget.title.forEach((text, properties) {
//               double fontSize = ((properties['Size']?.toDouble() ?? 24.0) * 1.5) * (16/25 * (deviceSize.width / defaultDeviceSize.width) + 9/25 * (deviceSize.height / defaultDeviceSize.height));
//               double firstLetterFontSize =
//                   fontSize * 1.3; // Larger font for the first letter
//               double horizontalPos = (properties['HorizontalPos']?.toDouble() ?? 0.0)/defaultDeviceSize.width * deviceSize.width;
//               double verticalPos = (properties['VerticalPos']?.toDouble() ?? 0.0)/defaultDeviceSize.height * deviceSize.height;

//               // Check if text is 'Invest Sync' to apply custom styling for the first letter
//               Widget textWidget;
//               if (text == 'INVESTSYNC') {
//                 // Separate the first letter of each word and apply larger font size
//                 textWidget = RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'I',
//                         style: TextStyle(
//                           fontSize: firstLetterFontSize,
//                           fontFamily: 'Cormorant',
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'NVEST',
//                         style: TextStyle(
//                           fontSize: fontSize,
//                           fontFamily: 'Cormorant',
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'S',
//                         style: TextStyle(
//                           fontSize: firstLetterFontSize,
//                           fontFamily: 'Cormorant',
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'YNC',
//                         style: TextStyle(
//                           fontSize: fontSize,
//                           fontFamily: 'Cormorant',
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else {
//                 // Default styling for other text
//                 textWidget = Text(
//                   text,
//                   style: TextStyle(
//                     fontSize: fontSize,
//                     fontFamily: 'Cormorant',
//                     fontWeight: FontWeight.w800,
//                     color: Colors.white,
//                   ),
//                 );
//               }

//               titleWidgets.add(Positioned(
//                 left: widget.anchor == 'left' ? horizontalPos : null,
//                 right: widget.anchor == 'right' ? horizontalPos : null,
//                 top: verticalPos,
//                 child: FadeInAnimationWidget(content: textWidget, offset: Offset(0, 2/defaultDeviceSize.height * deviceSize.height), duration: Duration(milliseconds: 750)),
//               ));
//             });

//             return Stack(
//               children: [
//                 // Apply the parallax translation to the image
//                 Image.network(
//                   widget.imageUrl,
//                   fit: BoxFit.cover,
//                   width: deviceSize.width, // Ensure the image fills the screen
//                   height: deviceSize.height,
//                 ),
//                 // Overlay the dynamically positioned text on top of the image
//                 ...titleWidgets,
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }