import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:cookbook/widgets/molecules/gradient_container.dart';
import 'package:flutter/material.dart';

class NutritionalBadge extends StatelessWidget {
  final String text;
  final Widget image;

  const NutritionalBadge({required this.text, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      padding: EdgeInsets.all(12.0.s),
      child: Row(
        children: [
          image,
          Spacing.spacingW12,
          Text(
            text,
            style: context.theme.textTheme.displayMedium
                ?.copyWith(color: DefaultPalette.kDarkGreen),
          ),
        ],
      ),
    );
  }
}
