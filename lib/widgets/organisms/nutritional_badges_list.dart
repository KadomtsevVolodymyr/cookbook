import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/atoms/nutritional_badge.dart';
import 'package:flutter/material.dart';

class NutritionalBadgesList extends StatelessWidget {
  final List<String> badges;

  const NutritionalBadgesList({
    required this.badges,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.0.s,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: badges.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == badges.length - 1 ? 0 : 8.0,
            ),
            child: NutritionalBadge(
              text: badges[index],
              image: Assets.icons.fats.svg(),
            ),
          );
        },
      ),
    );
  }
}
