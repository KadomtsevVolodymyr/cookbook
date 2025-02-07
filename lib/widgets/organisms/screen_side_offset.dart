import 'package:flutter/material.dart';
import 'package:cookbook/extensions/extensions.dart';

enum ScreenOffsetSide { left, right }

class ScreenSideOffset extends StatelessWidget {
  const ScreenSideOffset._({
    required this.child,
    required this.margin,
    super.key,
    this.only,
  });

  factory ScreenSideOffset.large({
    required Widget child,
    Key? key,
    ScreenOffsetSide? only,
  }) {
    return ScreenSideOffset._(
      key: key,
      margin: defaultLargeMargin,
      only: only,
      child: child,
    );
  }

  factory ScreenSideOffset.small({
    required Widget child,
    Key? key,
    ScreenOffsetSide? only,
  }) {
    return ScreenSideOffset._(
      key: key,
      margin: defaultSmallMargin,
      only: only,
      child: child,
    );
  }

  static double get defaultSmallMargin => 16.0.s;

  static double get defaultLargeMargin => 22.0.s;

  final Widget child;
  final double margin;
  final ScreenOffsetSide? only;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: only != null
          ? only == ScreenOffsetSide.left
              ? EdgeInsets.only(left: margin)
              : EdgeInsets.only(right: margin)
          : EdgeInsets.symmetric(horizontal: margin),
      child: child,
    );
  }
}
