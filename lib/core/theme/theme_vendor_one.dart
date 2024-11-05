import 'package:flutter/material.dart';
import 'package:cookbook/core/theme/solution_theme.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/num.dart';
import 'package:cookbook/generated/assets/fonts.gen.dart';

abstract class VendorOneCoreTheme implements SolutionTheme {
  @override
  SolutionSizeTheme sizeTheme = SolutionSizeTheme(
    iconSize: 36.0,
    buttonBorderRadius: 12.0,
  );

  @override
  SolutionDataTheme dataTheme = SolutionDataTheme(
    privacyPolicy: 'privacyPolicyURL',
  );
}

class VendorThemeOneLight extends VendorOneCoreTheme {
  @override
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: false,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: DefaultPalette.white,
        onPrimary: Colors.white,
        secondary: Color(0xFF03DAC6),
        onSecondary: Colors.black,
        surface: Colors.white,
        onSurface: Color(0xFF333333),
        error: Color(0xFFB00020),
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.black,
        color: DefaultPalette.white,
      ),
      iconTheme: const IconThemeData(color: DefaultPalette.white),
      inputDecorationTheme: const InputDecorationTheme(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DefaultPalette.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DefaultPalette.white, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DefaultPalette.white, width: 2.0),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: DefaultPalette.white,
          fontWeight: FontWeight.bold,
          fontSize: 40.0.s,
        ),
        displayMedium: TextStyle(
          color: DefaultPalette.white,
          fontWeight: FontWeight.w400,
          fontSize: 16.0.s,
        ),
        displaySmall: TextStyle(
          color: DefaultPalette.white,
          fontWeight: FontWeight.w400,
          fontSize: 15.0.s,
        ),
        headlineLarge: TextStyle(
          color: DefaultPalette.white,
          fontWeight: FontWeight.w600,
          fontSize: 20.0.s,
        ),
        headlineMedium: TextStyle(
          color: DefaultPalette.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.0.s,
        ),
        headlineSmall: const TextStyle(
          color: DefaultPalette.black,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        titleLarge: TextStyle(
          color: DefaultPalette.white,
          fontWeight: FontWeight.w400,
          fontSize: 16.0.s,
        ),
        titleMedium: TextStyle(
          color: DefaultPalette.black,
          fontWeight: FontWeight.w400,
          fontSize: 14.0.s,
          height: 17 / 15,
        ),
        titleSmall: const TextStyle(
          color: DefaultPalette.black,
          fontWeight: FontWeight.w600,
          fontSize: 13,
          height: 16 / 13,
        ),
        labelLarge: const TextStyle(
          color: DefaultPalette.black,
          fontWeight: FontWeight.w500,
          fontSize: 13,
          height: 16 / 13,
        ),
        labelMedium: const TextStyle(
          color: DefaultPalette.black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          height: 18 / 15,
        ),
        labelSmall: const TextStyle(
          color: DefaultPalette.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 24 / 22,
        ),
        bodyLarge: const TextStyle(
          color: DefaultPalette.black,
          fontWeight: FontWeight.w700,
          fontSize: 28,
          height: 28 / 28,
        ),
        bodyMedium: const TextStyle(
          color: DefaultPalette.black,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
        ),
        bodySmall: const TextStyle(
          color: DefaultPalette.black,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 17 / 14,
        ),
      ).apply(fontFamily: FontFamily.poppins),
    );
  }

  @override
  SolutionAssetsTheme get assetsTheme =>
      SolutionAssetsTheme(logoImage: 'logo2/', envelopeImage: 'assetsTheme');

  @override
  SolutionColorTheme get colorTheme => SolutionColorTheme(
        gray1Color: Colors.greenAccent,
        grayColor: Colors.indigo,
      );
}
