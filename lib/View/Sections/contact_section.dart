// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/Controllers/input_controllers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  final InputControllers _inputControllers = InputControllers();

  ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isVerySmall = screenWidth < 350;

    return Container(
      color: colorScheme.primary,
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
              'GET IN TOUCH',
              style: GoogleFonts.poppins(
                fontSize: isVerySmall ? 14 : 16,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 8 : 15),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Contact Me',
              style: GoogleFonts.poppins(
                fontSize:
                    isVerySmall
                        ? 24
                        : isMobile
                        ? 28
                        : 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 30 : 50),
          isMobile
              ? _buildMobileContact(context, colorScheme, isVerySmall)
              : _buildDesktopContact(context, colorScheme),
          SizedBox(height: isMobile ? 40 : 60),
          _buildFooter(context, colorScheme, isMobile, isVerySmall),
        ],
      ),
    );
  }

  Widget _buildDesktopContact(BuildContext context, ColorScheme colorScheme) {
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
                  'Let\'s discuss your project',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                _buildContactInfo(
                  Icons.email_outlined,
                  'Email',
                  _inputControllers.email,
                  'mailto:${_inputControllers.email}',
                ),
                const SizedBox(height: 15),
                _buildContactInfo(
                  Icons.phone_outlined,
                  'Phone',
                  _inputControllers.phone,
                  'tel:${_inputControllers.phone}',
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    _buildSocialIcon(
                      FontAwesomeIcons.github,
                      _inputControllers.github,
                    ),
                    const SizedBox(width: 15),
                    _buildSocialIcon(
                      FontAwesomeIcons.linkedin,
                      _inputControllers.linkedin,
                    ),
                    const SizedBox(width: 15),
                    _buildSocialIcon(
                      FontAwesomeIcons.instagram,
                      _inputControllers.instagram,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: _buildContactForm(colorScheme),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContact(
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
                'Let\'s discuss your project',
                style: GoogleFonts.poppins(
                  fontSize: isVerySmall ? 18 : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              _buildContactInfo(
                Icons.email_outlined,
                'Email',
                _inputControllers.email,
                'mailto:${_inputControllers.email}',
                isVerySmall: isVerySmall,
              ),
              const SizedBox(height: 15),
              _buildContactInfo(
                Icons.phone_outlined,
                'Phone',
                _inputControllers.phone,
                'tel:${_inputControllers.phone}',
                isVerySmall: isVerySmall,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  _buildSocialIcon(
                    FontAwesomeIcons.github,
                    _inputControllers.github,
                    size: isVerySmall ? 36 : 40,
                  ),
                  const SizedBox(width: 15),
                  _buildSocialIcon(
                    FontAwesomeIcons.linkedin,
                    _inputControllers.linkedin,
                    size: isVerySmall ? 36 : 40,
                  ),
                  const SizedBox(width: 15),
                  _buildSocialIcon(
                    FontAwesomeIcons.instagram,
                    _inputControllers.instagram,
                    size: isVerySmall ? 36 : 40,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 300),
          child: _buildContactForm(
            colorScheme,
            isMobile: true,
            isVerySmall: isVerySmall,
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(
    IconData icon,
    String title,
    String value,
    String url, {
    bool isVerySmall = false,
  }) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: isVerySmall ? 20 : 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: isVerySmall ? 14 : 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: isVerySmall ? 14 : 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url, {double size = 45}) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: Center(
          child: FaIcon(icon, color: Colors.white, size: size * 0.5),
        ),
      ),
    );
  }

  Widget _buildContactForm(
    ColorScheme colorScheme, {
    bool isMobile = false,
    bool isVerySmall = false,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Message',
            style: GoogleFonts.poppins(
              fontSize: isVerySmall ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 20),
          _buildTextField('Your Name', isVerySmall),
          const SizedBox(height: 15),
          _buildTextField('Your Email', isVerySmall),
          const SizedBox(height: 15),
          _buildTextField('Subject', isVerySmall),
          const SizedBox(height: 15),
          _buildTextField('Your Message', isVerySmall, maxLines: 4),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.tertiary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: isVerySmall ? 12 : 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Send Message',
                style: GoogleFonts.poppins(
                  fontSize: isVerySmall ? 14 : 16,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, bool isVerySmall, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          fontSize: isVerySmall ? 14 : 15,
          color: Colors.black45,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: maxLines > 1 ? 15 : 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: GoogleFonts.poppins(fontSize: isVerySmall ? 14 : 15),
    );
  }

  Widget _buildFooter(
    BuildContext context,
    ColorScheme colorScheme,
    bool isMobile,
    bool isVerySmall,
  ) {
    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      child: Column(
        children: [
          Divider(color: Colors.white.withOpacity(0.2), thickness: 1),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© ${DateTime.now().year} ${_inputControllers.shortName}',
                style: GoogleFonts.poppins(
                  fontSize: isVerySmall ? 13 : 14,
                  color: Colors.white70,
                ),
              ),
              Text(
                'All Rights Reserved',
                style: GoogleFonts.poppins(
                  fontSize: isVerySmall ? 13 : 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
