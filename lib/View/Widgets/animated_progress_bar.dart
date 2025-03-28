import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedProgressBar extends StatefulWidget {
  final String label;
  final double percentage;
  final Color color;
  final Duration animationDuration;

  const AnimatedProgressBar({
    super.key,
    required this.label,
    required this.percentage,
    this.color = Colors.black,
    this.animationDuration = const Duration(milliseconds: 1500),
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
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.percentage,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colorScheme.secondary,
              ),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Text(
                  "${(_animation.value * 100).toInt()}%",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: widget.color,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
