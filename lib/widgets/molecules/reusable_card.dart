import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:balancebyte/data/model/reusable_card_item.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final List<ReusableCardItem> items;

  const ReusableCard({
    required this.title,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final spacingW10 = SizedBox(width: 10.0.s);
    final spacing16 = SizedBox(height: 16.0.s);
    final spacing12 = SizedBox(height: 12.0.s);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DefaultPalette.white,
        borderRadius: BorderRadius.circular(20.0.s),
        boxShadow: const [DefaultShadowPalette.primaryShadow],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.0.s,
          bottom: 8.0.s,
          left: 20.0.s,
          right: 20.0.s,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.theme.textTheme.headlineLarge
                  ?.copyWith(color: DefaultPalette.kDarkGreen),
            ),
            spacing16,
            for (final item in items) ...[
              GestureDetector(
                onTap: item.onTap,
                child: Row(
                  children: [
                    if (item.icon != null) item.icon!,
                    if (item.icon != null) spacingW10,
                    Text(
                      item.text,
                      style: context.theme.textTheme.displayMedium
                          ?.copyWith(color: DefaultPalette.inactiveTextColor),
                    ),
                    const Spacer(),
                    item.switchWidget ?? Assets.icons.arrowRightType2.svg(),
                  ],
                ),
              ),
              spacing12,
            ],
          ],
        ),
      ),
    );
  }
}
