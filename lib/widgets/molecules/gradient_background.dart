import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final double angle;
  final Widget? child;

  const GradientBackground({
    required this.colors,
    super.key,
    this.angle = 0.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: const Alignment(-2.300, -0.2),
          begin: const Alignment(1, -0.08),
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}
