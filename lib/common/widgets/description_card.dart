import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  final String descriptionTitle;
  final String description;

  const DescriptionCard({
    Key? key,

    required this.descriptionTitle,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680, // Fixed height for the card
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5), // Border color
          width: 1.5, // Border width
        ),
      ),
      child: Row(

      )
    );
  }
}
