import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconBackgroundColor;
  final bool isBlack;
  final Color? cardColor;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconBackgroundColor = Colors.black,
    this.isBlack = false,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveCardColor =
        cardColor ?? (isBlack ? Colors.black : Colors.white);

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: effectiveCardColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isBlack ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 15,
              height: 1.6,
              color: isBlack ? Colors.white70 : Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: isBlack ? Colors.white : iconBackgroundColor,
              foregroundColor: isBlack ? Colors.black : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'EXPLORE MORE',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
