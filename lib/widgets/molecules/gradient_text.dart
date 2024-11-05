import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const GradientText({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            DefaultPalette.endGradientColor,
            DefaultPalette.startGradientColor,
          ],
        ).createShader(const Rect.fromLTWH(0.0, 0.0, 10.0, 10.0));
      },
      child: Text(
        text,
        style: style.copyWith(color: DefaultPalette.white),
      ),
    );
  }
}
