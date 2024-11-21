import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget icon;
  final VoidCallback onIconTap;
  final bool iconBack;

  const CustomAppBar({
    required this.title,
    required this.icon,
    required this.onIconTap,
    this.iconBack = false,
    super.key,
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
          ? Text(
              title,
              style: theme.headlineLarge?.copyWith(
                color: DefaultPalette.kDarkGreen,
              ),
              textAlign: TextAlign.center,
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
