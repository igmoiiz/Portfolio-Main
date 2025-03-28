// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/Controllers/input_controllers.dart';
import 'package:portfolio_main/View/Layout/layout_builder.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  final InputControllers _inputControllers = InputControllers();

  @override
  Widget build(BuildContext context) {
    return LayoutController(
      mobile: _buildMobileAbout(context),
      tablet: _buildTabletAbout(context),
      desktop: _buildDesktopAbout(context),
    );
  }

  Widget _buildDesktopAbout(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      color: colorScheme.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorScheme.primary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'Assets/Moiz Baloch 11.png',
                      width: 380,
                      height: 380,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 60,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(Icons.favorite, color: colorScheme.tertiary),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  right: 60,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(Icons.code, color: colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "About Me",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "From ${_inputControllers.university}",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _inputControllers.description,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      _buildExperienceTile(
                        context,
                        _inputControllers.completedProjects,
                        "Projects",
                      ),
                      const SizedBox(width: 40),
                      _buildExperienceTile(
                        context,
                        _inputControllers.completedClients,
                        "Clients",
                      ),
                      const SizedBox(width: 40),
                      _buildExperienceTile(
                        context,
                        _inputControllers.ongoingWork,
                        "Ongoing",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletAbout(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      color: colorScheme.background,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'Assets/Moiz Baloch 11.png',
                    width: 320,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: colorScheme.tertiary,
                    size: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 50,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(Icons.code, color: colorScheme.primary, size: 20),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About Me",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "From ${_inputControllers.university}",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                _inputControllers.description,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildExperienceTile(
                    context,
                    _inputControllers.completedProjects,
                    "Projects",
                  ),
                  const SizedBox(width: 40),
                  _buildExperienceTile(
                    context,
                    _inputControllers.completedClients,
                    "Clients",
                  ),
                  const SizedBox(width: 40),
                  _buildExperienceTile(
                    context,
                    _inputControllers.ongoingWork,
                    "Ongoing",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileAbout(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: colorScheme.background,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'Assets/Moiz Baloch 11.png',
                    width: 220,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 30,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: colorScheme.tertiary,
                    size: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 30,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(Icons.code, color: colorScheme.primary, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About Me",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "From ${_inputControllers.university}",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                _inputControllers.description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildExperienceTile(
                        context,
                        _inputControllers.completedProjects,
                        "Projects",
                      ),
                      const SizedBox(width: 30),
                      _buildExperienceTile(
                        context,
                        _inputControllers.completedClients,
                        "Clients",
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildExperienceTile(
                    context,
                    _inputControllers.ongoingWork,
                    "Ongoing",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceTile(
    BuildContext context,
    String number,
    String label,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
