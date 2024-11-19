import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double size;

  final double borderWidth;

  const CustomContainer({
    required this.child,
    this.backgroundColor = DefaultPalette.white,
    this.size = 34.0,
    this.borderWidth = 5.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0.s,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: DefaultPalette.white.withOpacity(0.5),
          width: 5,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.s),
          child: child,
        ),
      ),
    );
  }
}
