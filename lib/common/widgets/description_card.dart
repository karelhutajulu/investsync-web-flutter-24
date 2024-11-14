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
        crossAxisAlignment: CrossAxisAlignment.center, // Align title and paragraphs to the center
        children: [
          SizedBox(height: 64),
          // Title section
          Text(
            title,
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 32), // Space between title and paragraphs
      
          // Paragraphs section: dynamically display each paragraph
          ...description.map((paragraph) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 925,
                ),
                child: Text(
                  paragraph,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    height: 2, // Line height for better readability
                    fontWeight: FontWeight.bold,
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
