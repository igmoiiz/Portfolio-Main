// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/View/Layout/layout_builder.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutController(
      mobile: _buildMobileExperience(context),
      tablet: _buildTabletExperience(context),
      desktop: _buildDesktopExperience(context),
    );
  }

  Widget _buildDesktopExperience(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      color: colorScheme.background,
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: _buildSectionHeader(colorScheme),
          ),
          const SizedBox(height: 60),
          _buildDesktopExperienceCards(context),
        ],
      ),
    );
  }

  Widget _buildTabletExperience(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      color: colorScheme.background,
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: _buildSectionHeader(colorScheme),
          ),
          const SizedBox(height: 40),
          _buildExperienceTimeline(context, isTablet: true),
        ],
      ),
    );
  }

  Widget _buildMobileExperience(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: colorScheme.background,
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: _buildSectionHeader(colorScheme),
          ),
          const SizedBox(height: 30),
          _buildExperienceTimeline(context, isMobile: true),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          "Experience",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "My Work Journey",
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopExperienceCards(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final experiences = _getExperiences();

    return SizedBox(
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First card (large)
          Expanded(
            flex: 4,
            child: FadeInLeft(
              duration: const Duration(milliseconds: 800),
              child: _buildExperienceCard(
                experiences[0],
                colorScheme,
                height: 230,
                maxDescriptionLines: 5,
              ),
            ),
          ),
          const SizedBox(width: 25),
          // Second card (medium)
          Expanded(
            flex: 3,
            child: FadeInUp(
              duration: const Duration(milliseconds: 800),
              delay: const Duration(milliseconds: 300),
              child: _buildExperienceCard(
                experiences[1],
                colorScheme,
                height: 210,
                maxDescriptionLines: 4,
              ),
            ),
          ),
          const SizedBox(width: 25),
          // Third card (small)
          Expanded(
            flex: 3,
            child: FadeInRight(
              duration: const Duration(milliseconds: 800),
              delay: const Duration(milliseconds: 600),
              child: _buildExperienceCard(
                experiences[2],
                colorScheme,
                height: 190,
                maxDescriptionLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceTimeline(
    BuildContext context, {
    bool isTablet = false,
    bool isMobile = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final experiences = _getExperiences();
    final screenWidth = MediaQuery.of(context).size.width;

    if (isMobile) {
      // Simplified descriptions for very small screens
      final shortDescriptions = screenWidth < 350;

      return Column(
        children:
            experiences.asMap().entries.map((entry) {
              final index = entry.key;
              final exp = entry.value;

              // Adjust description for small screens
              Map<String, dynamic> adjustedExp = Map.from(exp);
              if (shortDescriptions) {
                adjustedExp['description'] = _getShortenedDescription(
                  exp['description'] as String,
                );
              }

              return FadeInLeft(
                duration: const Duration(milliseconds: 800),
                delay: Duration(milliseconds: index * 300),
                child: _buildExperienceCard(
                  adjustedExp,
                  colorScheme,
                  isMobile: true,
                  maxDescriptionLines: shortDescriptions ? 2 : 3,
                ),
              );
            }).toList(),
      );
    } else if (isTablet) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FadeInLeft(
                  duration: const Duration(milliseconds: 800),
                  child: _buildExperienceCard(
                    experiences[0],
                    colorScheme,
                    height: 230,
                    maxDescriptionLines: 4,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 300),
                  child: _buildExperienceCard(
                    experiences[1],
                    colorScheme,
                    height: 210,
                    maxDescriptionLines: 3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: FadeInUp(
              duration: const Duration(milliseconds: 800),
              delay: const Duration(milliseconds: 600),
              child: _buildExperienceCard(
                experiences[2],
                colorScheme,
                height: 190,
                maxDescriptionLines: 3,
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(); // Not used
    }
  }

  List<Map<String, dynamic>> _getExperiences() {
    return [
      {
        'title': 'Flutter Developer',
        'company': 'Freelance',
        'period': '2022 - Present',
        'description':
            'Developing custom Flutter applications for clients including e-commerce solutions, social apps, and business management systems. Working with Firebase, Supabase, and RESTful APIs for seamless integration.',
        'icon': FontAwesomeIcons.mobileScreen,
      },
      {
        'title': 'Flutter UI/UX Specialist',
        'company': 'Tech Innovations',
        'period': '2021 - 2022',
        'description':
            'Created responsive UI designs and implemented complex animations for Flutter applications. Focused on performance optimization and user experience improvements.',
        'icon': FontAwesomeIcons.palette,
      },
      {
        'title': 'Junior Flutter Developer',
        'company': 'Mobile Apps Inc.',
        'period': '2020 - 2021',
        'description':
            'Started my Flutter journey developing apps and learning state management, UI development, and Firebase integration.',
        'icon': FontAwesomeIcons.codeBranch,
      },
    ];
  }

  Widget _buildExperienceCard(
    Map<String, dynamic> experience,
    ColorScheme colorScheme, {
    bool isMobile = false,
    double? height,
    int maxDescriptionLines = 3,
  }) {
    return Container(
      height: height,
      margin: isMobile ? const EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FaIcon(
                  experience['icon'] as IconData,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience['title'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 15 : 16,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      experience['company'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 13 : 14,
                        color: colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              experience['period'] as String,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: Text(
              experience['description'] as String,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 13 : 14,
                height: 1.4,
                color: colorScheme.primary,
              ),
              maxLines: maxDescriptionLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to shorten descriptions for very small screens
  String _getShortenedDescription(String description) {
    if (description.length > 80) {
      return '${description.substring(0, 80)}...';
    }
    return description;
  }
}
