import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/gradient_container.dart';
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
