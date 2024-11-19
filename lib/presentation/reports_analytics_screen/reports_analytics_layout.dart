import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/data/model/reusable_card_item.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/molecules/gradient_container.dart';
import 'package:cookbook/widgets/molecules/reusable_card.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ReportsAnalyticsLayout extends StatefulWidget {
  const ReportsAnalyticsLayout({super.key});

  @override
  State<ReportsAnalyticsLayout> createState() => _ReportsAnalyticsLayoutState();
}

class _ReportsAnalyticsLayoutState extends State<ReportsAnalyticsLayout>
    with TickerProviderStateMixin {
  final spacing40 = SizedBox(height: 40.0.s);
  final spacing24 = SizedBox(height: 24.0.s);
  final spacing12 = SizedBox(height: 12.0.s);

  final spacingW24 = SizedBox(width: 24.0.s);
  final spacingW12 = SizedBox(width: 12.0.s);

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Row(
          children: [
            spacingW24,
            Text(
              'Your Reports & Analytics',
              style: context.theme.textTheme.headlineLarge
                  ?.copyWith(color: DefaultPalette.kDarkGreen),
            ),
          ],
        ),
        actions: [
          ScreenSideOffset.large(
            child: GestureDetector(
              onTap: () => PersistentNavBarNavigator.pop(
                context,
              ),
              child: Assets.icons.profile.svg(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: ScreenSideOffset.large(
            child: Column(
              children: [
                spacing40,
                GradientContainer(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: DefaultPalette.white,
                              borderRadius: BorderRadius.circular(10.0.s),
                            ),
                            width: 56.0.s,
                            height: 56.0.s,
                            child: Padding(
                              padding: EdgeInsets.all(10.0.s),
                              child: Assets.icons.hydrationBalance.svg(),
                            ),
                          ),
                          spacingW12,
                          Expanded(
                            child: Text(
                              'Hydration Recommendation',
                              style: context.theme.textTheme.headlineMedium
                                  ?.copyWith(color: DefaultPalette.kDarkGreen),
                            ),
                          ),
                        ],
                      ),
                      spacing12,
                      Text(
                        'Hydration is essential for maintaining overall health as the water supports many bodily functions, including temperature regulation, digestion, and cognitive performance.',
                        style: context.theme.textTheme.displayMedium
                            ?.copyWith(color: DefaultPalette.kDarkGreen),
                      ),
                      spacing12,
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: Column(
                          children: [
                            if (isExpanded) ...[
                              Text(
                                'Daily water intake recommendations vary, with adult women needing about 2.7 liters and men 3.7 liters, though factors like exercise, climate, and diet can increase these needs. Signs of proper hydration include clear urine, consistent energy levels, and healthy skin, while dehydration can cause fatigue, dizziness, and dark urine.',
                                style: context.theme.textTheme.displayMedium
                                    ?.copyWith(
                                  color: DefaultPalette.kDarkGreen,
                                ),
                              ),
                              spacing12,
                              Row(
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100.0.s),
                                      gradient: const LinearGradient(
                                        end: Alignment(-2.300, -0.2),
                                        begin: Alignment(1, -0.08),
                                        colors: [
                                          DefaultPalette.startGradientColor,
                                          DefaultPalette.endGradientColor,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.0.s,
                                        vertical: 2.0.s,
                                      ),
                                      child: Text(
                                        "BE CAREFUL",
                                        style: context
                                            .theme.textTheme.labelSmall
                                            ?.copyWith(
                                          color: DefaultPalette.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              spacing12,
                              Text(
                                'Overhydration, though rare, can lead to hyponatremia, where sodium levels drop dangerously low, highlighting the need for balanced water and electrolyte intake.',
                                style: context.theme.textTheme.displayMedium
                                    ?.copyWith(
                                  color: DefaultPalette.inactiveTextColor,
                                ),
                              ),
                              spacing12,
                            ],
                          ],
                        ),
                      ),
                      spacing12,
                      GestureDetector(
                        child: Assets.icons.arrowBottomType2.svg(),
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                spacing24,
                ReusableCard(
                  title: 'Analytics',
                  items: [
                    ReusableCardItem(
                      text: 'Calories',
                      onTap: () {},
                    ),
                    ReusableCardItem(
                      text: 'BMI',
                      onTap: () {},
                    ),
                    ReusableCardItem(
                      text: 'Macronutrient Distribution',
                      onTap: () {},
                    ),
                    ReusableCardItem(
                      text: 'Weight Progress',
                      onTap: () {},
                    ),
                    ReusableCardItem(
                      text: 'Food Group Intake',
                      onTap: () {},
                    ),
                    ReusableCardItem(
                      text: 'Hydration Levels',
                      onTap: () {},
                    ),
                    ReusableCardItem(
                      text: 'Exercise Tracking & Performance',
                      onTap: () {},
                    ),
                  ],
                ),
                spacing24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
