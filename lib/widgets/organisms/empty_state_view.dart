import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final Widget iconPath;
  final String message;
  final String subtitle;
  final VoidCallback? onButtonPressed;

  EmptyState.filter({
    super.key,
  })  : onButtonPressed = null,
        iconPath = Assets.icons.nothingFound.svg(),
        message = "Nothing was found",
        subtitle =
            "Sorry, we couldn\'t find anything for your request. Try changing the filter settings";

  EmptyState.item({
    required this.onButtonPressed,
    super.key,
  })  : iconPath = Assets.icons.nothingFound.svg(),
        message = "You don't have  favorite recipes yet",
        subtitle =
            "Please start exploring our recipes and choose your favorites";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconPath,
        Spacing.spacing20,
        Text(
          message,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: DefaultPalette.kDarkGreen,
              ),
          textAlign: TextAlign.center,
        ),
        Spacing.spacing8,
        Text(
          subtitle,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: DefaultPalette.kDarkGreen,
              ),
          textAlign: TextAlign.center,
        ),
        if (onButtonPressed != null) ...[
          Spacing.spacing24,
          CustomButton.shadowed(
            text: Text(
              'Start exploring',
              style: context.theme.textTheme.headlineMedium,
            ),
            onPressed: () => onButtonPressed,
          ),
        ],
      ],
    );
  }
}
