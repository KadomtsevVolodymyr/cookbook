import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/widgets/molecules/gradient_text.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultPalette.white,
        borderRadius: BorderRadius.circular(16.0.s),
        boxShadow: const [DefaultShadowPalette.primaryShadow],
      ),
      height: 65.0.s,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientText(
            colors: const [
              Color(0xFF75DB7E),
              DefaultPalette.startGradientColor,
            ],
            text: value,
            style: context.theme.textTheme.labelMedium!,
          ),
          Text(
            label,
            style: context.theme.textTheme.labelSmall
                ?.copyWith(color: DefaultPalette.inactiveTextColor),
          ),
        ],
      ),
    );
  }
}
