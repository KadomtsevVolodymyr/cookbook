import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/widgets/molecules/gradient_text.dart';
import 'package:flutter/material.dart';

class AuthFooterText extends StatelessWidget {
  final String mainText;
  final String actionText;
  final VoidCallback onTap;
  final bool isUnderlined;

  const AuthFooterText({
    required this.mainText,
    required this.actionText,
    required this.onTap,
    this.isUnderlined = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mainText,
          style: context.theme.textTheme.titleLarge
              ?.copyWith(color: DefaultPalette.kDarkGreen),
        ),
        SizedBox(
          width: 4.0.s,
        ),
        GestureDetector(
          onTap: onTap,
          child: GradientText(
            text: actionText,
            style: context.theme.textTheme.titleMedium!.copyWith(
              decoration: isUnderlined ? TextDecoration.underline : null,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
