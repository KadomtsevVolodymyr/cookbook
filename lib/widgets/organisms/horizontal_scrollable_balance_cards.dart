import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/presentation/single_tip_screen/single_tip_screen.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HorizontalScrollableBalanceCards extends StatelessWidget {
  final List<Widget> cards;

  const HorizontalScrollableBalanceCards({required this.cards, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.0.s),
      child: SizedBox(
        height: 200.0.s,
        child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: cards[index],
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const SingleTipScreen(),
                );
              },
            );
          },
          separatorBuilder: (context, index) => Spacing.spacingW12,
          itemCount: cards.length,
        ),
      ),
    );
  }
}
