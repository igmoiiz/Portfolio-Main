import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/View/Layout/layout_builder.dart';
import 'package:portfolio_main/View/Widgets/service_card.dart';
import 'package:animate_do/animate_do.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1200;
    final isVerySmall = screenWidth < 350;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal:
            isMobile
                ? 20.0
                : isTablet
                ? 40.0
                : 100.0,
        vertical: isMobile ? 50.0 : 80.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'SERVICES',
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
              'What I Do',
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
              ? _buildMobileServices(context, colorScheme, isVerySmall)
              : isTablet
              ? _buildTabletServices(context, colorScheme)
              : _buildDesktopServices(context, colorScheme),
        ],
      ),
    );
  }

  Widget _buildDesktopServices(BuildContext context, ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                child: ServiceCard(
                  title: 'UI/UX Design',
                  description:
                      'Creating beautiful and functional interfaces that provide an excellent user experience across all devices.',
                  icon: Icons.design_services,
                  cardColor: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 30),
              FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 200),
                child: ServiceCard(
                  title: 'Backend Integration',
                  description:
                      'Connecting your app to powerful backend services like Firebase or custom APIs to handle data and authentication.',
                  icon: Icons.storage,
                  cardColor: colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            children: [
              FadeInRight(
                duration: const Duration(milliseconds: 1000),
                child: ServiceCard(
                  title: 'Flutter Development',
                  description:
                      'Building cross-platform mobile applications with beautiful UI and smooth performance using Flutter and Dart.',
                  icon: Icons.phone_android,
                  cardColor: colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 30),
              FadeInRight(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 200),
                child: ServiceCard(
                  title: 'App Maintenance',
                  description:
                      'Providing ongoing support, updates, and enhancements to keep your application running smoothly and securely.',
                  icon: Icons.build,
                  cardColor: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletServices(BuildContext context, ColorScheme colorScheme) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                child: ServiceCard(
                  title: 'UI/UX Design',
                  description:
                      'Creating beautiful and functional interfaces that provide an excellent user experience across all devices.',
                  icon: Icons.design_services,
                  cardColor: colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: FadeInRight(
                duration: const Duration(milliseconds: 1000),
                child: ServiceCard(
                  title: 'Flutter Development',
                  description:
                      'Building cross-platform mobile applications with beautiful UI and smooth performance using Flutter and Dart.',
                  icon: Icons.phone_android,
                  cardColor: colorScheme.tertiary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 200),
                child: ServiceCard(
                  title: 'Backend Integration',
                  description:
                      'Connecting your app to powerful backend services like Firebase or custom APIs to handle data and authentication.',
                  icon: Icons.storage,
                  cardColor: colorScheme.tertiary,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: FadeInRight(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 200),
                child: ServiceCard(
                  title: 'App Maintenance',
                  description:
                      'Providing ongoing support, updates, and enhancements to keep your application running smoothly and securely.',
                  icon: Icons.build,
                  cardColor: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileServices(
    BuildContext context,
    ColorScheme colorScheme,
    bool isVerySmall,
  ) {
    return Column(
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: ServiceCard(
            title: 'UI/UX Design',
            description:
                isVerySmall
                    ? 'Creating beautiful interfaces with excellent UX.'
                    : 'Creating beautiful and functional interfaces that provide an excellent user experience across all devices.',
            icon: Icons.design_services,
            cardColor: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 100),
          child: ServiceCard(
            title: 'Flutter Development',
            description:
                isVerySmall
                    ? 'Building cross-platform mobile apps with Flutter.'
                    : 'Building cross-platform mobile applications with beautiful UI and smooth performance using Flutter and Dart.',
            icon: Icons.phone_android,
            cardColor: colorScheme.tertiary,
          ),
        ),
        const SizedBox(height: 20),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 200),
          child: ServiceCard(
            title: 'Backend Integration',
            description:
                isVerySmall
                    ? 'Connecting apps to Firebase or custom APIs.'
                    : 'Connecting your app to powerful backend services like Firebase or custom APIs to handle data and authentication.',
            icon: Icons.storage,
            cardColor: colorScheme.tertiary,
          ),
        ),
        const SizedBox(height: 20),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 300),
          child: ServiceCard(
            title: 'App Maintenance',
            description:
                isVerySmall
                    ? 'Providing ongoing support and updates.'
                    : 'Providing ongoing support, updates, and enhancements to keep your application running smoothly and securely.',
            icon: Icons.build,
            cardColor: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
