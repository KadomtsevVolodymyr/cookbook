import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:flutter/material.dart';

class HydrationBalanceCard extends StatelessWidget {
  const HydrationBalanceCard({super.key});

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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacing.spacing24,
          Text(
            "Hydration\nBalance",
            style: context.theme.textTheme.displayMedium
                ?.copyWith(color: DefaultPalette.kDarkGreen),
            textAlign: TextAlign.center,
          ),
          Spacing.spacing24,
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0.s),
                child: Assets.images.tipsBg.svg(width: 158.0.s),
              ),
              Align(
                child: Assets.icons.hydrationBalance
                    .svg(width: 45.0.s, height: 60.0.s),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
