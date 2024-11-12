import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;

  const GradientContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.s),
        border: Border.all(
          color: DefaultPalette.backgroundFormColor,
        ),
        gradient: const LinearGradient(
          end: Alignment(-4, -0.2),
          begin: Alignment(3, -0.08),
          colors: [
            Color.fromRGBO(117, 219, 126, 0.2),
            Color.fromRGBO(0, 205, 172, 0.2),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0.s),
        child: child,
      ),
    );
  }
}
