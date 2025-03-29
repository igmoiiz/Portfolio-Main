// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color? cardColor;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isVerySmall = screenWidth < 350;

    final effectiveCardColor = cardColor ?? colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isVerySmall ? 15 : 25),
      decoration: BoxDecoration(
        color: effectiveCardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: effectiveCardColor.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: isVerySmall ? 24 : 30),
          ),
          SizedBox(height: isVerySmall ? 12 : 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isVerySmall ? 16 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isVerySmall ? 8 : 15),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: isVerySmall ? 13 : 15,
              height: 1.5,
              color: Colors.white.withOpacity(0.85),
            ),
            maxLines: isVerySmall ? 4 : 6,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
