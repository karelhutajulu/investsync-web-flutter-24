import 'package:flutter/material.dart';
import 'package:investsyncwebsite/animations/fade_in_animation.dart';

final Size defaultDeviceSize = Size(1536.0, 729.6);
Size deviceSize = Size(0, 0); // Default size

class DescriptionCard extends StatelessWidget {
  final String title;
  final List<String> description;

  const DescriptionCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    
    return FadeInAnimationWidget(
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // Align title and paragraphs to the center
          children: [
            SizedBox(height: 64/defaultDeviceSize.height * deviceSize.height),
            // Title section
            Text(
              title,
              style: TextStyle(
                fontSize: 69 * (16/25 * (deviceSize.width / defaultDeviceSize.width) + 9/25 * (deviceSize.height / defaultDeviceSize.height)),
                fontFamily: 'Cormorant', // Set font family to Cormorant
                fontWeight: FontWeight.w800, // Medium weight for Cormorant
              ),
            ),
            SizedBox(height: 36/defaultDeviceSize.height * deviceSize.height), // Space between title and paragraphs
      
            // Paragraphs section: dynamically display each paragraph
            ...description.map((paragraph) {
              return Padding(
                padding: EdgeInsets.only(bottom: 36.0/defaultDeviceSize.height * deviceSize.height),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 875/defaultDeviceSize.width * deviceSize.width,
                  ),
                  child: Text(
                    paragraph,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26 * (16/25 * (deviceSize.width / defaultDeviceSize.width) + 9/25 * (deviceSize.height / defaultDeviceSize.height)),
                      fontFamily: 'Kepler', // Set font family to Cormorant
                      fontWeight: FontWeight.w600, // Medium weight for Cormorant
                      height: 1.5/defaultDeviceSize.height * deviceSize.height, // Line height for better readability
                    ),
                  ),
                ),
              );
            }).toList(),
      
            SizedBox(height: 36/defaultDeviceSize.height * deviceSize.height),
          ],
        ),
      ),

      offset: Offset(0, 0.075/defaultDeviceSize.height * deviceSize.height), duration: Duration(milliseconds: 400), visibleFrac: 0.175,
    );
  }
}
