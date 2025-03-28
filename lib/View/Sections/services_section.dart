import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/View/Layout/layout_builder.dart';
import 'package:portfolio_main/View/Widgets/service_card.dart';
import 'package:animate_do/animate_do.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutController(
      mobile: _buildMobileServices(context),
      tablet: _buildTabletServices(context),
      desktop: _buildDesktopServices(context),
    );
  }

  Widget _buildDesktopServices(BuildContext context) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FadeInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: ServiceCard(
                    icon: Icons.phone_android,
                    title: "Mobile App Development",
                    description:
                        "Expert Flutter development for iOS and Android platforms. "
                        "I create beautiful, responsive, and high-performance mobile applications "
                        "using Flutter's powerful framework with engaging UI and smooth animations.",
                    iconBackgroundColor: colorScheme.primary,
                    isBlack: false,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 300),
                  child: ServiceCard(
                    icon: Icons.storage,
                    title: "Backend Integration",
                    description:
                        "Seamless integration with Firebase, Supabase, and other backend services. "
                        "I implement robust authentication, real-time databases, and cloud storage "
                        "to create fully-functional applications with excellent performance.",
                    iconBackgroundColor: colorScheme.secondary,
                    isBlack: true,
                    cardColor: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: FadeInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: ServiceCard(
                    icon: Icons.web,
                    title: "Flutter Web Apps",
                    description:
                        "Cross-platform Flutter web applications with responsive designs. "
                        "I leverage Flutter's web capabilities to create consistent "
                        "experiences across desktop and mobile browsers with the same codebase.",
                    iconBackgroundColor: colorScheme.primary,
                    isBlack: false,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabletServices(BuildContext context) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FadeInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: ServiceCard(
                    icon: Icons.phone_android,
                    title: "Mobile App Development",
                    description:
                        "Expert Flutter development for iOS and Android platforms. "
                        "I create beautiful, responsive, and high-performance mobile applications.",
                    iconBackgroundColor: colorScheme.primary,
                    isBlack: false,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FadeInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: ServiceCard(
                    icon: Icons.storage,
                    title: "Backend Integration",
                    description:
                        "Seamless integration with Firebase, Supabase, and other backend services. "
                        "I implement robust authentication and database solutions.",
                    iconBackgroundColor: colorScheme.secondary,
                    isBlack: true,
                    cardColor: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: ServiceCard(
              icon: Icons.web,
              title: "Flutter Web Apps",
              description:
                  "Cross-platform Flutter web applications with responsive designs. "
                  "I leverage Flutter's web capabilities to create consistent "
                  "experiences across desktop and mobile browsers.",
              iconBackgroundColor: colorScheme.primary,
              isBlack: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileServices(BuildContext context) {
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
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: ServiceCard(
              icon: Icons.phone_android,
              title: "Mobile App Development",
              description:
                  "Expert Flutter development for iOS and Android platforms. "
                  "I create beautiful, responsive, and high-performance mobile applications.",
              iconBackgroundColor: colorScheme.primary,
              isBlack: false,
            ),
          ),
          const SizedBox(height: 20),
          FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: ServiceCard(
              icon: Icons.storage,
              title: "Backend Integration",
              description:
                  "Seamless integration with Firebase, Supabase, and other backend services. "
                  "I implement robust authentication and database solutions.",
              iconBackgroundColor: colorScheme.secondary,
              isBlack: true,
              cardColor: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: ServiceCard(
              icon: Icons.web,
              title: "Flutter Web Apps",
              description:
                  "Cross-platform Flutter web applications with responsive designs. "
                  "I leverage Flutter's capabilities to create consistent experiences.",
              iconBackgroundColor: colorScheme.primary,
              isBlack: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          "My Services",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "What I Can Do For You",
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
