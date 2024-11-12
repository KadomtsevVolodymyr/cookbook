import 'package:auto_route/auto_route.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/navigation/app_router.dart';
import 'package:cookbook/widgets/molecules/circular_progress_indicator.dart';
import 'package:cookbook/widgets/molecules/custom_button.dart';
import 'package:cookbook/widgets/organisms/challenge_status.dart';
import 'package:cookbook/widgets/organisms/horizontal_meal_list.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final spacing40 = SizedBox(height: 40.0.s);
  final spacing24 = SizedBox(height: 24.0.s);
  final spacing22 = SizedBox(height: 22.0.s);
  final spacing20 = SizedBox(height: 20.0.s);
  final spacing16 = SizedBox(height: 16.0.s);
  final spacingWH24 = SizedBox(width: 24.0.s);
  final spacingWH12 = SizedBox(width: 12.0.s);
  final spacingWH10 = SizedBox(width: 10.0.s);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultPalette.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ScreenSideOffset.large(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi, Sara!', // TODO(Volodymyr): Change name
                          style: context.theme.textTheme.headlineLarge
                              ?.copyWith(color: DefaultPalette.kDarkGreen),
                        ),
                        GestureDetector(
                          child: Assets.icons.profile.svg(),
                          onTap: () {
                            // TODO(Volodymyr): Implement profile screen
                          },
                        ),
                      ],
                    ),
                    spacing40,
                    const CustomCircularPercentIndicator(
                      percent: 0.3,
                      value: '1 660',
                      label: 'Calories Burned',
                    ),
                    spacing22,
                    Row(
                      children: [
                        Text(
                          'My Weekly Challenges',
                          style: context.theme.textTheme.headlineLarge
                              ?.copyWith(color: DefaultPalette.kDarkGreen),
                        ),
                      ],
                    ),
                    spacing20,
                    const ChallengeStatusWidget(completedCount: 3),
                    spacing40,
                    Row(
                      children: [
                        Text(
                          'Your Meal Plan',
                          style: context.theme.textTheme.headlineLarge
                              ?.copyWith(color: DefaultPalette.kDarkGreen),
                        ),
                      ],
                    ),
                    spacing40,
                  ],
                ),
              ),
              const HorizontalMealList(),
              spacing24,
              ScreenSideOffset.large(
                child: CustomButton.shadowed(
                  text: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0.s),
                        child: Text(
                          "View More",
                          style: context.theme.textTheme.headlineMedium,
                        ),
                      ),
                      Assets.icons.arrowRight.svg(),
                    ],
                  ),
                  onPressed: () => context.router.push(const HomeRoute()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
