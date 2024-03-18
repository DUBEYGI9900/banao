
import 'package:flutter/material.dart';

class TopCategory extends StatelessWidget {
  final IconData icon; // Icon data
  final String text; // Text to display

  const TopCategory({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 48,
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(89, 139, 237, 1),
          width: 1, // Border color #598BED
        ),
        borderRadius: BorderRadius.circular(10), // Border radius of 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon, // Use the provided icon
            color: const Color.fromRGBO(89, 139, 237, 1), // Example color, you can change it
          ),
          const SizedBox(width: 20), // Add some spacing between icon and text
          Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(89, 139, 237, 1),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
