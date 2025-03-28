// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/Controllers/input_controllers.dart';

class AboutSection extends StatelessWidget {
  final InputControllers _inputControllers = InputControllers();

  AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isVerySmall = screenWidth < 350;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20.0 : 100.0,
          vertical: 50.0,
        ),
        child:
            isMobile
                ? _buildMobileLayout(context, colorScheme, isVerySmall)
                : _buildDesktopLayout(context, colorScheme),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ABOUT ME',
                  style: GoogleFonts.poppins(
                    color: colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'I\'m ${_inputControllers.fullName}',
                  style: GoogleFonts.poppins(
                    color: colorScheme.secondary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  _inputControllers.description,
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 30),
                _buildButton(context, colorScheme),
              ],
            ),
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoItem(
                    Icons.person,
                    'Name',
                    _inputControllers.fullName,
                    colorScheme,
                    isMobile: true,
                  ),
                  _buildInfoItem(
                    Icons.location_on,
                    'Location',
                    _inputControllers.location,
                    colorScheme,
                    isMobile: true,
                  ),
                  _buildInfoItem(
                    Icons.school,
                    'University',
                    _inputControllers.university,
                    colorScheme,
                    isMobile: true,
                  ),
                  _buildInfoItem(
                    Icons.interests,
                    'Intrests',
                    "Android, iOS Development",
                    colorScheme,
                    isMobile: true,
                  ),
                  _buildInfoItem(
                    Icons.flutter_dash,
                    'Technology',
                    "Flutter Development",
                    colorScheme,
                    isMobile: true,
                  ),
                  _buildInfoItem(
                    Icons.cloud_queue,
                    'Backend Technology',
                    "Firebase, Supabase, Node.js, MongoDB",
                    colorScheme,
                    isMobile: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    ColorScheme colorScheme,
    bool isVerySmall,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ABOUT ME',
                style: GoogleFonts.poppins(
                  color: colorScheme.primary,
                  fontSize: isVerySmall ? 14 : 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'I\'m ${_inputControllers.fullName}',
                style: GoogleFonts.poppins(
                  color: colorScheme.secondary,
                  fontSize: isVerySmall ? 24 : 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                _inputControllers.description,
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: isVerySmall ? 14 : 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 20),
              _buildButton(context, colorScheme),
            ],
          ),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 1000),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(isVerySmall ? 20 : 25),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                _buildInfoItem(
                  Icons.person,
                  'Name',
                  _inputControllers.fullName,
                  colorScheme,
                  isMobile: true,
                  isVerySmall: isVerySmall,
                ),
                _buildInfoItem(
                  Icons.location_on,
                  'Location',
                  _inputControllers.location,
                  colorScheme,
                  isMobile: true,
                  isVerySmall: isVerySmall,
                ),
                _buildInfoItem(
                  Icons.school,
                  'University',
                  _inputControllers.university,
                  colorScheme,
                  isMobile: true,
                  isVerySmall: isVerySmall,
                ),
                _buildInfoItem(
                  Icons.interests,
                  'Intrests',
                  "Android, iOS Development",
                  colorScheme,
                  isMobile: true,
                  isVerySmall: isVerySmall,
                ),
                _buildInfoItem(
                  Icons.flutter_dash,
                  'Technology',
                  "Flutter Development",
                  colorScheme,
                  isMobile: true,
                  isVerySmall: isVerySmall,
                ),
                _buildInfoItem(
                  Icons.cloud_queue,
                  'Backend Technology',
                  "Firebase, Supabase, Node.js, MongoDB",
                  colorScheme,
                  isMobile: true,
                  isVerySmall: isVerySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    IconData icon,
    String title,
    String value,
    ColorScheme colorScheme, {
    bool isMobile = false,
    bool isVerySmall = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: isVerySmall ? 18 : 20),
          SizedBox(width: isVerySmall ? 8 : 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: isVerySmall ? 12 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: isVerySmall ? 2 : 3),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: isVerySmall ? 13 : 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, ColorScheme colorScheme) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isVerySmall = screenWidth < 350;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.tertiary,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: isVerySmall ? 25 : 30,
          vertical: isVerySmall ? 12 : 15,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        'Hire Me',
        style: GoogleFonts.poppins(
          fontSize: isVerySmall ? 14 : 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
