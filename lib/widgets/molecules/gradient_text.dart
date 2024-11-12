import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final List<Color> colors;

  const GradientText({
    required this.text,
    required this.style,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: colors,
        ).createShader(const Rect.fromLTWH(10.0, 0.0, 10.0, 10.0));
      },
      child: Text(
        text,
        style: style.copyWith(color: DefaultPalette.white),
      ),
    );
  }
}
