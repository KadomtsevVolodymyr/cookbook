import 'package:flutter/material.dart';

class DefaultShadowPalette {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color(0x1D161712),
    offset: Offset(0, 10),
    blurRadius: 40,
  );

  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color(0x1D161712),
    offset: Offset(-10, -10),
    blurRadius: 40,
  );

  static const BoxShadow thirdShadow = BoxShadow(
    color: Color(0x1D161712),
    offset: Offset(10, 10),
    blurRadius: 40,
  );

  static const BoxShadow fourthShadow = BoxShadow(
    color: Color(0x12000000),
    offset: Offset(0, -4),
    blurRadius: 16,
  );
}
