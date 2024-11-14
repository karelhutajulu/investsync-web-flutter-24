import 'package:flutter/material.dart';

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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .center, // Align title and paragraphs to the center
        children: [
          SizedBox(height: 36),
          // Title section
          Text(
            title,
            style: TextStyle(
              fontSize: 69,
              fontFamily: 'Cormorant', // Set font family to Cormorant
              fontWeight: FontWeight.w800, // Medium weight for Cormorant
            ),
          ),
          SizedBox(height: 36), // Space between title and paragraphs

          // Paragraphs section: dynamically display each paragraph
          ...description.map((paragraph) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 36.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 875,
                ),
                child: Text(
                  paragraph,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Kepler', // Set font family to Cormorant
                    fontWeight: FontWeight.w600, // Medium weight for Cormorant
                    height: 1.5, // Line height for better readability
                  ),
                ),
              ),
            );
          }).toList(),

          SizedBox(height: 36),
        ],
      ),
    );
  }
}
