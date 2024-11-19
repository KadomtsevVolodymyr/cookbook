import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:cookbook/widgets/molecules/gradient_container.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final Widget imageUrl;
  final String recipeName;
  final String time;
  final String effortLevel;
  final Widget nutritionalIcon;
  final Widget effortlessIcon;
  final bool isFavourite;

  final VoidCallback onHeartTap;

  const RecipeItem({
    required this.imageUrl,
    required this.recipeName,
    required this.time,
    required this.effortLevel,
    required this.nutritionalIcon,
    required this.effortlessIcon,
    required this.onHeartTap,
    required this.isFavourite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GradientContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0.s),
                            child: imageUrl,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 12.0.s,
                      left: 12.0.s,
                      child: Container(
                        width: 34.0.s,
                        height: 34.0.s,
                        padding: EdgeInsets.all(7.0.s),
                        decoration: BoxDecoration(
                          color: DefaultPalette.white,
                          borderRadius: BorderRadius.circular(100.0.s),
                        ),
                        child: nutritionalIcon,
                      ),
                    ),
                    Positioned(
                      top: 12.0.s,
                      right: 12.0.s,
                      child: Container(
                        padding: EdgeInsets.all(7.0.s),
                        decoration: BoxDecoration(
                          color: DefaultPalette.white,
                          borderRadius: BorderRadius.circular(100.0.s),
                        ),
                        child: Text(time),
                      ),
                    ),
                  ],
                ),
                Spacing.spacing12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      recipeName,
                      style: context.theme.textTheme.titleLarge
                          ?.copyWith(color: DefaultPalette.kDarkGreen),
                    ),
                    GestureDetector(
                      onTap: onHeartTap,
                      child: isFavourite
                          ? Assets.icons.heartFull.svg()
                          : Assets.icons.heartEmpty.svg(),
                    ),
                  ],
                ),
                Spacing.spacing4,
                Row(
                  children: [
                    effortlessIcon,
                    SizedBox(width: 8.0.s),
                    Text(
                      effortLevel,
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        color: DefaultPalette.inactiveTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
