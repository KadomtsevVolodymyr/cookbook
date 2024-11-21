import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget icon;
  final VoidCallback onIconTap;
  final bool iconBack;
  final String? secondText;

  const CustomAppBar({
    required this.title,
    required this.icon,
    required this.onIconTap,
    this.iconBack = false,
    super.key,
    this.secondText,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.textTheme;

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leadingWidth: iconBack ? null : MediaQuery.of(context).size.width,
      leading: Row(
        children: [
          if (iconBack) Spacing.spacingW24,
          if (iconBack)
            GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Assets.icons.arrowLeft.svg(),
            ),
          if (!iconBack) Spacing.spacingW24,
          if (!iconBack)
            Text(
              title,
              style: theme.headlineLarge?.copyWith(
                color: DefaultPalette.kDarkGreen,
              ),
            ),
        ],
      ),
      title: iconBack
          ? Column(
              children: [
                Text(
                  title,
                  style: theme.headlineLarge?.copyWith(
                    color: DefaultPalette.kDarkGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (secondText != null)
                  Text(
                    "(123)",
                    style: theme.titleMedium?.copyWith(
                      color: DefaultPalette.inactiveTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
            )
          : null,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 24.0.s),
          child: GestureDetector(
            onTap: onIconTap,
            child: icon,
          ),
        ),
      ],
    );
  }
}
