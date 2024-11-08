import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final double angle;
  final Widget? child;

  const GradientBackground({
    super.key,
    this.angle = 0.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment(-2.300, -0.2),
            begin: Alignment(1, -0.08),
            colors: [
              DefaultPalette.startGradientColor,
              DefaultPalette.endGradientColor,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
