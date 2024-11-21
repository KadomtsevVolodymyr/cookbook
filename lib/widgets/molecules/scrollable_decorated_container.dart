import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/num.dart';
import 'package:flutter/material.dart';

class ScrollableDecoratedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool isShadow;

  const ScrollableDecoratedContainer({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.only(top: 8.0),
    this.isShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: DefaultPalette.white,
          boxShadow: [
            if (isShadow)
              BoxShadow(
                color: DefaultPalette.white.withOpacity(0.2),
                offset: const Offset(0, -4),
                blurRadius: 8,
              ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0.s),
            topRight: Radius.circular(25.0.s),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0.s),
            topRight: Radius.circular(25.0.s),
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: child,
          ),
        ),
      ),
    );
  }
}
