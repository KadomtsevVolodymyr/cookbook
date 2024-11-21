import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomBottomNavBarItem extends PersistentBottomNavBarItem {
  CustomBottomNavBarItem({
    required Widget activeIcon,
    required Widget inactiveIcon,
    required String title,
    required BuildContext context,
    super.activeColorPrimary = DefaultPalette.activeNavColor,
    Color super.activeColorSecondary = DefaultPalette.inactiveTextColor,
    double iconSpacing = 4.0,
  }) : super(
          icon: Column(
            children: [
              SizedBox(height: 20.0.s),
              activeIcon,
              SizedBox(height: iconSpacing),
              Text(
                title,
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: activeColorPrimary,
                ),
              ),
            ],
          ),
          inactiveIcon: Column(
            children: [
              SizedBox(height: 20.0.s),
              inactiveIcon,
              SizedBox(height: iconSpacing),
              Text(
                title,
                style: context.theme.textTheme.bodySmall,
              ),
            ],
          ),
        );
}
