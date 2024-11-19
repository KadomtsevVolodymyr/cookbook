import 'dart:math';

import 'package:cookbook/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  final BoxDecoration decoration;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  // Primary button style with white gradient background
  CustomButton.primary({
    required this.text,
    required this.onPressed,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
  }) : decoration = BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF8F4F5),
            ],
            stops: [0.0, 1.0],
            transform: GradientRotation(274.34 * (pi / 180)),
          ),
          borderRadius: BorderRadius.circular(99),
        );

  // Outline button style with transparent background and white border
  CustomButton.outline({
    required this.text,
    required this.onPressed,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
  }) : decoration = BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xFFFFFFFF), width: 1),
          borderRadius: BorderRadius.circular(99),
        );

  // Shadowed button style with green gradient background and box shadow
  CustomButton.shadowed({
    required this.text,
    required this.onPressed,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
  }) : decoration = BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF18593F),
              Color(0xFF75DB7E),
            ],
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(99),
          boxShadow: const [
            BoxShadow(
              color: Color(0x2C744C33),
              offset: Offset(0, 10),
              blurRadius: 22,
            ),
          ],
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60.0.s,
        padding: EdgeInsets.symmetric(vertical: 18.0.s),
        decoration: decoration,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Padding(
                padding: EdgeInsets.only(right: 10.0.s),
                child: prefixIcon,
              ),
            text,
            if (suffixIcon != null)
              Padding(
                padding: EdgeInsets.only(left: 10.0.s),
                child: suffixIcon,
              ),
          ],
        ),
      ),
    );
  }
}
