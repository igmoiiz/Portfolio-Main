import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/View/Layout/layout_builder.dart';
import 'package:portfolio_main/View/Widgets/animated_progress_bar.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutController(
      mobile: _buildMobileSkills(context),
      tablet: _buildTabletSkills(context),
      desktop: _buildDesktopSkills(context),
    );
  }

  Widget _buildDesktopSkills(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      color: colorScheme.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Creative & Professional",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Experience",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 40),
                _buildStatItem("10+", "Completed Clients", colorScheme),
                const SizedBox(height: 20),
                _buildStatItem("8+", "Completed Projects", colorScheme),
                const SizedBox(height: 20),
                _buildStatItem("3+", "Maintained Projects", colorScheme),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                AnimatedProgressBar(
                  label: "Full Stack Development",
                  percentage: 0.85,
                  color: colorScheme.primary,
                ),
                const SizedBox(height: 20),
                AnimatedProgressBar(
                  label: "Supabase and Firebase",
                  percentage: 0.7,
                  color: colorScheme.primary,
                ),
                const SizedBox(height: 20),
                AnimatedProgressBar(
                  label: "UI/UX Design",
                  percentage: 0.75,
                  color: colorScheme.primary,
                ),
                const SizedBox(height: 20),
                AnimatedProgressBar(
                  label: "Flutter Development",
                  percentage: 0.95,
                  color: colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletSkills(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      color: colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Creative & Professional",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Experience",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: _buildStatItem("530+", "Completed Clients", colorScheme),
              ),
              Expanded(
                child: _buildStatItem(
                  "92,543",
                  "Completed Projects",
                  colorScheme,
                ),
              ),
              Expanded(
                child: _buildStatItem("2,543", "Ongoing Work", colorScheme),
              ),
            ],
          ),
          const SizedBox(height: 40),
          AnimatedProgressBar(
            label: "Photoshop & Illustrator",
            percentage: 0.9,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 20),
          AnimatedProgressBar(
            label: "Web & App Design",
            percentage: 0.85,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 20),
          AnimatedProgressBar(
            label: "UI/UX Design",
            percentage: 0.75,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 20),
          AnimatedProgressBar(
            label: "Web Design & Development",
            percentage: 0.95,
            color: colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileSkills(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Creative & Professional",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              "Experience",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildStatItem("530+", "Completed Clients", colorScheme),
          const SizedBox(height: 15),
          _buildStatItem("92,543", "Completed Projects", colorScheme),
          const SizedBox(height: 15),
          _buildStatItem("2,543", "Ongoing Work", colorScheme),
          const SizedBox(height: 30),
          AnimatedProgressBar(
            label: "Photoshop & Illustrator",
            percentage: 0.9,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 15),
          AnimatedProgressBar(
            label: "Web & App Design",
            percentage: 0.85,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 15),
          AnimatedProgressBar(
            label: "UI/UX Design",
            percentage: 0.75,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 15),
          AnimatedProgressBar(
            label: "Web Design & Development",
            percentage: 0.95,
            color: colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
