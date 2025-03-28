// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedNavigation extends StatefulWidget {
  const AnimatedNavigation({super.key});

  @override
  State<AnimatedNavigation> createState() => _AnimatedNavigationState();
}

class _AnimatedNavigationState extends State<AnimatedNavigation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  bool _isOpen = false;

  final List<Map<String, dynamic>> _menuItems = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.person, "label": "About"},
    {"icon": Icons.design_services, "label": "Services"},
    {"icon": Icons.work, "label": "Portfolio"},
    {"icon": Icons.star, "label": "Reviews"},
    {"icon": Icons.contact_mail, "label": "Contact"},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return _buildMenuItems(colorScheme);
          },
        ),
        FloatingActionButton(
          onPressed: _toggleMenu,
          backgroundColor: colorScheme.primary,
          child: AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value * 3.14159 * 2,
                child: Icon(
                  _isOpen ? Icons.close : Icons.menu,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems(ColorScheme colorScheme) {
    return IgnorePointer(
      ignoring: !_isOpen,
      child: AnimatedOpacity(
        opacity: _isOpen ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          margin: const EdgeInsets.only(bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(_menuItems.length, (index) {
              return AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  final delay =
                      _isOpen
                          ? ((_menuItems.length - index) * 0.1)
                          : (index * 0.05);
                  final scale =
                      _isOpen
                          ? Curves.easeOutBack.transform(
                            _scaleAnimation.value - delay,
                          )
                          : 0.0;
                  return Transform.scale(
                    scale: scale < 0.0 ? 0.0 : scale,
                    child: _buildMenuItem(
                      _menuItems[index]["icon"],
                      _menuItems[index]["label"],
                      _menuItems.length - index,
                      colorScheme,
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String label,
    int index,
    ColorScheme colorScheme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: colorScheme.secondary, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
