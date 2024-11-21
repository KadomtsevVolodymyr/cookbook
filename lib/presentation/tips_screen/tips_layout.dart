import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/presentation/account_screen/account_screen.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:cookbook/widgets/molecules/hydration_balance_card.dart';
import 'package:cookbook/widgets/molecules/nutrition_balance_card.dart';
import 'package:cookbook/widgets/organisms/custom_appbar.dart';
import 'package:cookbook/widgets/organisms/horizontal_scrollable_balance_cards.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class TipsLayout extends StatefulWidget {
  const TipsLayout({super.key});

  @override
  State<TipsLayout> createState() => _TipsLayoutState();
}

class _TipsLayoutState extends State<TipsLayout> {
  final List<Widget> cards = [
    const HydrationBalanceCard(),
    const NutritionBalanceCard(),
    const HydrationBalanceCard(),
    const NutritionBalanceCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Health & Fitness\nRecommendation',
        icon: Assets.icons.profile.svg(),
        onIconTap: () => PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const AccountScreen(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.spacing40,
            ScreenSideOffset.large(
              child: Text(
                'Your journey reports',
                style: context.theme.textTheme.headlineLarge
                    ?.copyWith(color: DefaultPalette.kDarkGreen),
              ),
            ),
            Spacing.spacing20,
            HorizontalScrollableBalanceCards(
              cards: cards,
            ),
            Spacing.spacing40,
            ScreenSideOffset.large(
              child: Text(
                'Health Recommendations',
                style: context.theme.textTheme.headlineLarge
                    ?.copyWith(color: DefaultPalette.kDarkGreen),
              ),
            ),
            Spacing.spacing20,
            HorizontalScrollableBalanceCards(
              cards: cards,
            ),
            Spacing.spacing40,
            ScreenSideOffset.large(
              child: Text(
                'Fitness Recommendations',
                style: context.theme.textTheme.headlineLarge
                    ?.copyWith(color: DefaultPalette.kDarkGreen),
              ),
            ),
            Spacing.spacing20,
            HorizontalScrollableBalanceCards(
              cards: cards,
            ),
            Spacing.spacing40,
          ],
        ),
      ),
    );
  }
}
