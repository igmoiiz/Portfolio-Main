import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_main/View/Layout/layout_builder.dart';
import 'package:portfolio_main/Controllers/input_controllers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection({super.key});

  final InputControllers _inputControllers = InputControllers();

  @override
  Widget build(BuildContext context) {
    return LayoutController(
      mobile: _buildMobileHeader(context),
      tablet: _buildTabletHeader(context),
      desktop: _buildDesktopHeader(context),
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.9,
      color: colorScheme.background,
      padding: const EdgeInsets.only(top: 70),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HELLO! I'M",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _inputControllers.fullName.toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Flutter & ",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.secondary,
                          ),
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Full-Stack',
                              textStyle: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.primary,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                            TypewriterAnimatedText(
                              'Developer',
                              textStyle: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.primary,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          repeatForever: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _inputControllers.location,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        _buildButton(
                          "Hire Me",
                          true,
                          context,
                          () => _launchUrl('mailto:${_inputControllers.email}'),
                        ),
                        const SizedBox(width: 20),
                        _buildButton(
                          "My GitHub",
                          false,
                          context,
                          () => _launchUrl(_inputControllers.github),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    _buildSocialLinks(colorScheme),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ZoomIn(
              duration: const Duration(milliseconds: 1000),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 50),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'profile-image',
                    child: ClipOval(
                      child: Image.asset(
                        'Assets/Moiz Baloch.jpg',
                        width: 350,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.9,
      color: colorScheme.background,
      padding: const EdgeInsets.only(top: 70),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HELLO! I'M",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _inputControllers.fullName.toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Flutter & ",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.secondary,
                          ),
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Full-Stack',
                              textStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.primary,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                            TypewriterAnimatedText(
                              'Developer',
                              textStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.primary,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          repeatForever: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _inputControllers.location,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        _buildButton(
                          "Hire Me",
                          true,
                          context,
                          () => _launchUrl('mailto:${_inputControllers.email}'),
                        ),
                        const SizedBox(width: 20),
                        _buildButton(
                          "My GitHub",
                          false,
                          context,
                          () => _launchUrl(_inputControllers.github),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    _buildSocialLinks(colorScheme),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ZoomIn(
              duration: const Duration(milliseconds: 1000),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'profile-image',
                    child: ClipOval(
                      child: Image.asset(
                        'Assets/Moiz Baloch.jpg',
                        width: 280,
                        height: 280,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.9,
      color: colorScheme.background,
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          const SizedBox(height: 30),
          ZoomIn(
            duration: const Duration(milliseconds: 1000),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorScheme.primary.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                ),
                Hero(
                  tag: 'profile-image',
                  child: ClipOval(
                    child: Image.asset(
                      'Assets/Moiz Baloch.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Column(
                children: [
                  Text(
                    "HELLO! I'M",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _inputControllers.shortName.toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Flutter & ",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.secondary,
                        ),
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Full-Stack',
                            textStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: colorScheme.primary,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            'Developer',
                            textStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: colorScheme.primary,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _inputControllers.location,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(
                        "Hire Me",
                        true,
                        context,
                        () => _launchUrl('mailto:${_inputControllers.email}'),
                      ),
                      const SizedBox(width: 20),
                      _buildButton(
                        "My GitHub",
                        false,
                        context,
                        () => _launchUrl(_inputControllers.github),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSocialLinks(colorScheme),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildButton(
    String text,
    bool isPrimary,
    BuildContext context,
    VoidCallback? onPressed,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: isPrimary ? colorScheme.primary : Colors.white,
        foregroundColor: isPrimary ? Colors.white : colorScheme.primary,
        side: BorderSide(
          color:
              isPrimary
                  ? Colors.transparent
                  : colorScheme.primary.withOpacity(0.5),
          width: 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildSocialLinks(ColorScheme colorScheme) {
    return Row(
      children: [
        _buildSocialIcon(
          FontAwesomeIcons.instagram,
          colorScheme,
          () => _launchUrl(_inputControllers.instagram),
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          FontAwesomeIcons.linkedin,
          colorScheme,
          () => _launchUrl(_inputControllers.linkedin),
        ),
        const SizedBox(width: 16),
        _buildSocialIcon(
          FontAwesomeIcons.github,
          colorScheme,
          () => _launchUrl(_inputControllers.github),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(
    IconData icon,
    ColorScheme colorScheme,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorScheme.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: colorScheme.primary, size: 20),
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
