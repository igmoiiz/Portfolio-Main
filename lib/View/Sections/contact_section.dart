import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/Controllers/input_controllers.dart';
import 'package:portfolio_main/View/Layout/layout_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final InputControllers _inputControllers = InputControllers();

  // Form controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulating form submission
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Message sent successfully! I\'ll get back to you soon.',
                style: GoogleFonts.poppins(),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutController(
      mobile: _buildMobileContact(context),
      tablet: _buildTabletContact(context),
      desktop: _buildDesktopContact(context),
    );
  }

  Widget _buildDesktopContact(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.primary.withOpacity(0.05),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Text(
                  "Contact Me",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Let's work together on your next project",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FadeInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get In Touch",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        FontAwesomeIcons.locationDot,
                        "Location",
                        _inputControllers.location,
                        colorScheme,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        FontAwesomeIcons.envelope,
                        "Email",
                        _inputControllers.email,
                        colorScheme,
                        onTap:
                            () =>
                                _launchUrl('mailto:${_inputControllers.email}'),
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        FontAwesomeIcons.phone,
                        "Phone",
                        _inputControllers.phone,
                        colorScheme,
                        onTap:
                            () => _launchUrl('tel:${_inputControllers.phone}'),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "Follow Me",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSocialLinks(colorScheme),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: FadeInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Send Message",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              "Your Name",
                              _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              "Your Email",
                              _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              "Your Message",
                              _messageController,
                              maxLines: 5,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your message';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _isSubmitting ? null : _submitForm,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child:
                                    _isSubmitting
                                        ? const SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2.0,
                                          ),
                                        )
                                        : Text(
                                          "Send Message",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabletContact(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.primary.withOpacity(0.05),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Text(
                  "Contact Me",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Let's work together on your next project",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get In Touch",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildContactInfo(
                        FontAwesomeIcons.locationDot,
                        "Location",
                        _inputControllers.location,
                        colorScheme,
                      ),
                    ),
                    Expanded(
                      child: _buildContactInfo(
                        FontAwesomeIcons.envelope,
                        "Email",
                        _inputControllers.email,
                        colorScheme,
                        onTap:
                            () =>
                                _launchUrl('mailto:${_inputControllers.email}'),
                      ),
                    ),
                    Expanded(
                      child: _buildContactInfo(
                        FontAwesomeIcons.phone,
                        "Phone",
                        _inputControllers.phone,
                        colorScheme,
                        onTap:
                            () => _launchUrl('tel:${_inputControllers.phone}'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Follow Me:",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    _buildSocialLinks(colorScheme),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Card(
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Send Message",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildTextField(
                              "Your Name",
                              _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _buildTextField(
                              "Your Email",
                              _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        "Your Message",
                        _messageController,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child:
                              _isSubmitting
                                  ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                  : Text(
                                    "Send Message",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileContact(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.primary.withOpacity(0.05),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Text(
                  "Contact Me",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Let's work together on your next project",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get In Touch",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                _buildContactInfo(
                  FontAwesomeIcons.locationDot,
                  "Location",
                  _inputControllers.location,
                  colorScheme,
                ),
                const SizedBox(height: 15),
                _buildContactInfo(
                  FontAwesomeIcons.envelope,
                  "Email",
                  _inputControllers.email,
                  colorScheme,
                  onTap: () => _launchUrl('mailto:${_inputControllers.email}'),
                ),
                const SizedBox(height: 15),
                _buildContactInfo(
                  FontAwesomeIcons.phone,
                  "Phone",
                  _inputControllers.phone,
                  colorScheme,
                  onTap: () => _launchUrl('tel:${_inputControllers.phone}'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Follow Me:",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    _buildSocialLinks(colorScheme),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Card(
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Send Message",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        "Your Name",
                        _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        "Your Email",
                        _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        "Your Message",
                        _messageController,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child:
                              _isSubmitting
                                  ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                  : Text(
                                    "Send Message",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(
    IconData icon,
    String title,
    String info,
    ColorScheme colorScheme, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FaIcon(icon, color: colorScheme.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  info,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      style: GoogleFonts.poppins(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.black38, fontSize: 14),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: colorScheme.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }

  Widget _buildSocialLinks(ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSocialIcon(
          FontAwesomeIcons.instagram,
          colorScheme,
          () => _launchUrl(_inputControllers.instagram),
        ),
        const SizedBox(width: 12),
        _buildSocialIcon(
          FontAwesomeIcons.linkedin,
          colorScheme,
          () => _launchUrl(_inputControllers.linkedin),
        ),
        const SizedBox(width: 12),
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
        child: FaIcon(icon, color: colorScheme.primary, size: 18),
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
