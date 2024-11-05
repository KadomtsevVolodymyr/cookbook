import 'package:cookbook/core/theme/theme_container.dart';
import 'package:flutter/material.dart';
import 'package:value_provider/value_provider.dart';

class SolutionColorTheme {
  SolutionColorTheme({
    required this.grayColor,
    required this.gray1Color,
  });

  Color grayColor;
  Color gray1Color;
}

class SolutionSizeTheme {
  SolutionSizeTheme({
    required this.iconSize,
    required this.buttonBorderRadius,
  });

  final double iconSize;
  final double buttonBorderRadius;
}

class SolutionAssetsTheme {
  SolutionAssetsTheme({
    required this.logoImage,
    required this.envelopeImage,
  });

  String logoImage;
  String envelopeImage;
}

class SolutionDataTheme {
  SolutionDataTheme({
    required this.privacyPolicy,
  });

  String privacyPolicy;
}

abstract class SolutionTheme {
  factory SolutionTheme(BuildContext context) {
    final themeMode = ValueProvider.of<ThemeMode>(context).value;
    switch (themeMode) {
      case ThemeMode.light:
        return ThemeFactory.lightTheme;
      default:
        return ThemeFactory.lightTheme;
    }
  }

  ThemeData get themeData;

  SolutionColorTheme get colorTheme;
  SolutionSizeTheme get sizeTheme;
  SolutionAssetsTheme get assetsTheme;
  SolutionDataTheme get dataTheme;
}
