import 'package:cookbook/core/theme/solution_theme.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/num.dart';
import 'package:cookbook/generated/assets/fonts.gen.dart';
import 'package:flutter/material.dart';

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
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: DefaultPalette.white,
        onSurface: Color(0xFF333333),
      ),
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.black,
        color: DefaultPalette.white,
      ),
      iconTheme: const IconThemeData(color: DefaultPalette.white),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.only(left: 14.0.s),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: DefaultPalette.errorColor),
          borderRadius: BorderRadius.circular(14.0.s),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: DefaultPalette.errorColor),
          borderRadius: BorderRadius.circular(14.0.s),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0.s),
          borderSide: const BorderSide(color: DefaultPalette.inactiveTextColor),
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
          fontWeight: FontWeight.w500,
          fontSize: 14.0.s,
        ),
        titleSmall: const TextStyle(
          color: DefaultPalette.kDarkGreen,
          fontWeight: FontWeight.w300,
          fontSize: 12,
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
          fontSize: 16,
        ),
        labelSmall: TextStyle(
          color: DefaultPalette.black,
          fontSize: 14.0.s,
          fontWeight: FontWeight.w400,
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
          color: DefaultPalette.inactiveTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
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
