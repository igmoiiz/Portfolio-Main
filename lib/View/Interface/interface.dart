import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/Controllers/input_controllers.dart';
import 'package:portfolio_main/View/Sections/about_section.dart';
import 'package:portfolio_main/View/Sections/contact_section.dart';
import 'package:portfolio_main/View/Sections/experience_section.dart';
import 'package:portfolio_main/View/Sections/header_section.dart';
import 'package:portfolio_main/View/Sections/services_section.dart';
import 'package:portfolio_main/View/Sections/skills_section.dart';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  final InputControllers _inputControllers = InputControllers();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isScrolled = false;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 100 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 100 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  void _scrollToSection(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _scrollController.animateTo(
      position.dy - 100,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    // Close the mobile menu if it's open
    if (_isMenuOpen) {
      setState(() {
        _isMenuOpen = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get color scheme from theme
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(child: HeaderSection(key: _headerKey)),
              SliverToBoxAdapter(child: AboutSection(key: _aboutKey)),
              SliverToBoxAdapter(child: SkillsSection(key: _skillsKey)),
              SliverToBoxAdapter(child: ServicesSection(key: _servicesKey)),
              SliverToBoxAdapter(child: ExperienceSection(key: _experienceKey)),
              SliverToBoxAdapter(child: ContactSection(key: _contactKey)),
            ],
          ),
          isMobile
              ? _buildMobileAppBar(colorScheme)
              : _buildDesktopAppBar(colorScheme),
          if (isMobile && _isMenuOpen) _buildMobileMenu(colorScheme),
        ],
      ),
    );
  }

  Widget _buildDesktopAppBar(ColorScheme colorScheme) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 70,
        decoration: BoxDecoration(
          color: _isScrolled ? colorScheme.primary : Colors.transparent,
          boxShadow:
              _isScrolled
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ]
                  : [],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _inputControllers.shortName,
                style: GoogleFonts.poppins(
                  color: _isScrolled ? Colors.white : colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Row(
                children: [
                  _buildNavItem('Home', _headerKey, colorScheme),
                  _buildNavItem('About', _aboutKey, colorScheme),
                  _buildNavItem('Skills', _skillsKey, colorScheme),
                  _buildNavItem('Services', _servicesKey, colorScheme),
                  _buildNavItem('Experience', _experienceKey, colorScheme),
                  _buildNavItem('Contact', _contactKey, colorScheme),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileAppBar(ColorScheme colorScheme) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 70,
        decoration: BoxDecoration(
          color:
              _isScrolled || _isMenuOpen
                  ? colorScheme.primary
                  : Colors.transparent,
          boxShadow:
              _isScrolled || _isMenuOpen
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ]
                  : [],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _inputControllers.shortName,
                style: GoogleFonts.poppins(
                  color:
                      _isScrolled || _isMenuOpen
                          ? Colors.white
                          : colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                icon: Icon(
                  _isMenuOpen ? Icons.close : Icons.menu,
                  color:
                      _isScrolled || _isMenuOpen
                          ? Colors.white
                          : colorScheme.primary,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    _isMenuOpen = !_isMenuOpen;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileMenu(ColorScheme colorScheme) {
    return Positioned(
      top: 70, // Below the app bar
      left: 0,
      right: 0,
      child: Container(
        color: colorScheme.primary,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMobileNavItem('Home', _headerKey, colorScheme),
            _buildMobileNavItem('About', _aboutKey, colorScheme),
            _buildMobileNavItem('Skills', _skillsKey, colorScheme),
            _buildMobileNavItem('Services', _servicesKey, colorScheme),
            _buildMobileNavItem('Experience', _experienceKey, colorScheme),
            _buildMobileNavItem('Contact', _contactKey, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, GlobalKey key, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () => _scrollToSection(key),
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: _isScrolled ? Colors.white : colorScheme.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavItem(
    String title,
    GlobalKey key,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: () => _scrollToSection(key),
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
