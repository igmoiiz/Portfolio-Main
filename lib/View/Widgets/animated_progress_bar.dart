import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedProgressBar extends StatefulWidget {
  final String label;
  final int percentage;
  final Color color;
  final bool isSmallScreen;

  const AnimatedProgressBar({
    super.key,
    required this.label,
    required this.percentage,
    required this.color,
    this.isSmallScreen = false,
  });

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.percentage / 100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.poppins(
                    fontSize: widget.isSmallScreen ? 13 : 16,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.secondary,
                  ),
                ),
                Text(
                  '${(widget.percentage).round()}%',
                  style: GoogleFonts.poppins(
                    fontSize: widget.isSmallScreen ? 13 : 16,
                    fontWeight: FontWeight.w500,
                    color: widget.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: widget.isSmallScreen ? 10 : 12,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FractionallySizedBox(
                widthFactor: _animation.value,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
