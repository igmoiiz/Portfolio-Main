import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/Controllers/input_controllers.dart';
import 'package:portfolio_main/View/Widgets/animated_progress_bar.dart';

class SkillsSection extends StatelessWidget {
  final InputControllers _inputControllers = InputControllers();

  SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isVerySmall = screenWidth < 350;

    return Container(
      color: Colors.grey[50],
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 100.0,
        vertical: isMobile ? 50.0 : 80.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'MY SKILLS',
              style: GoogleFonts.poppins(
                fontSize: isVerySmall ? 14 : 16,
                fontWeight: FontWeight.w500,
                color: colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 8 : 15),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'My Expertise',
              style: GoogleFonts.poppins(
                fontSize:
                    isVerySmall
                        ? 24
                        : isMobile
                        ? 28
                        : 38,
                fontWeight: FontWeight.bold,
                color: colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 30 : 50),
          isMobile
              ? _buildMobileSkills(context, colorScheme, isVerySmall)
              : _buildDesktopSkills(context, colorScheme),
        ],
      ),
    );
  }

  Widget _buildDesktopSkills(BuildContext context, ColorScheme colorScheme) {
    final skills = _inputControllers.mySkills;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Column(
              children: [
                for (var i = 0; i < skills.length / 2; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: AnimatedProgressBar(
                      label: skills.keys.elementAt(i),
                      percentage: int.parse(skills.values.elementAt(i)),
                      color: colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: Column(
              children: [
                for (var i = skills.length ~/ 2; i < skills.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: AnimatedProgressBar(
                      label: skills.keys.elementAt(i),
                      percentage: int.parse(skills.values.elementAt(i)),
                      color: colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileSkills(
    BuildContext context,
    ColorScheme colorScheme,
    bool isVerySmall,
  ) {
    final skills = _inputControllers.mySkills;

    return FadeInUp(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        children: [
          for (var i = 0; i < skills.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AnimatedProgressBar(
                label: skills.keys.elementAt(i),
                percentage: int.parse(skills.values.elementAt(i)),
                color: colorScheme.primary,
                isSmallScreen: isVerySmall,
              ),
            ),
        ],
      ),
    );
  }
}
