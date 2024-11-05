import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: DefaultPalette.borderColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.s),
          child: Text(
            text,
            style: context.theme.textTheme.titleSmall,
          ),
        ),
        const Expanded(
          child: Divider(
            color: DefaultPalette.borderColor,
          ),
        ),
      ],
    );
  }
}
