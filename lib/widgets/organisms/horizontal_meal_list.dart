import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class HorizontalMealList extends StatelessWidget {
  final int itemCount;

  const HorizontalMealList({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    final spacingWH24 = SizedBox(width: 24.0.s);
    final spacingWH12 = SizedBox(width: 12.0.s);
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 195.0.s,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    if (index == 0) spacingWH24,
                    _MealCard(),
                    spacingWH12,
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _MealCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DefaultPalette.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1D161712),
            offset: Offset(2, 2),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: SizedBox(
        height: 190.0.s,
        width: 172.0.s,
        child: Column(
          children: [
            Stack(
              children: [
                Assets.images.mealPlan.image(
                  fit: BoxFit.cover,
                  height: 114.0.s,
                ),
                Positioned(
                  top: 12.0.s,
                  left: 12.0.s,
                  child: Container(
                    decoration: BoxDecoration(
                      color: DefaultPalette.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 74.0.s,
                    height: 34.0.s,
                    child: Center(
                      child: Text(
                        "45 min",
                        style: context.theme.textTheme.displayMedium?.copyWith(
                          color: DefaultPalette.kDarkGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0.s),
              child: Text(
                "Chicken Healthy Recipe",
                style: context.theme.textTheme.displayMedium?.copyWith(
                  color: DefaultPalette.kDarkGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
