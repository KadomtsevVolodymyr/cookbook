import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:cookbook/widgets/molecules/gradient_container.dart';
import 'package:flutter/material.dart';

class NutritionBalanceCard extends StatelessWidget {
  const NutritionBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.0.s,
      height: 180.0.s,
      decoration: BoxDecoration(
        color: DefaultPalette.white,
        borderRadius: BorderRadius.circular(10.0.s),
        boxShadow: const [DefaultShadowPalette.primaryShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90.0.s,
            child: GradientContainer(
              radius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.nutritionBalance.svg(),
                ],
              ),
            ),
          ),
          Spacing.spacing30,
          Padding(
            padding: EdgeInsets.only(left: 20.0.s),
            child: Text(
              'Nutrition\nBalance',
              style: context.theme.textTheme.displayMedium
                  ?.copyWith(color: DefaultPalette.kDarkGreen),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
