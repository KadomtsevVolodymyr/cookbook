import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  final double percent;
  final String value;
  final String label;

  const CustomCircularPercentIndicator({
    required this.percent,
    required this.value,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0.s,
      lineWidth: 18.0.s,
      percent: percent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: context.theme.textTheme.headlineMedium
                ?.copyWith(color: DefaultPalette.kDarkGreen),
          ),
          Text(
            label,
            style: context.theme.textTheme.titleLarge
                ?.copyWith(color: DefaultPalette.inactiveTextColor),
          ),
        ],
      ),
      linearGradient: const LinearGradient(
        colors: [
          Color(0xFF75DB7E),
          Color(0xFF18593F),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        transform: GradientRotation(
          274.42 * 3.14159265 / 180,
        ),
      ),
      backgroundColor: DefaultPalette.backgroundFormColor,
    );
  }
}
