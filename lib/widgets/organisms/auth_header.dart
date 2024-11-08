import 'package:auto_route/auto_route.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String greetingText;
  final String mainTitle;

  const AuthHeader({
    required this.greetingText,
    required this.mainTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Assets.icons.arrowLeft.svg(width: 24.0.s, height: 24.0.s),
          onTap: () => context.router.maybePop(),
        ),
        Column(
          children: [
            Text(
              greetingText,
              style: context.theme.textTheme.titleLarge?.copyWith(
                color: DefaultPalette.kDarkGreen,
              ),
            ),
            SizedBox(height: 5.0.s),
            Text(
              mainTitle,
              style: context.theme.textTheme.headlineLarge?.copyWith(
                color: DefaultPalette.kDarkGreen,
              ),
            ),
          ],
        ),
        SizedBox(width: 24.0.s),
      ],
    );
  }
}
