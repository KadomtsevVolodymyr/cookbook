import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/charts/bar_chart.dart';
import 'package:balancebyte/widgets/molecules/circular_progress_indicator.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CaloriesLayout extends StatefulWidget {
  const CaloriesLayout({super.key});

  @override
  State<CaloriesLayout> createState() => _CaloriesLayoutState();
}

class _CaloriesLayoutState extends State<CaloriesLayout> {
  final PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconBack: true,
        title: 'Calories',
        icon: Assets.icons.profile.svg(),
        onIconTap: () => PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const AccountScreen(),
        ),
      ),
      body: ScreenSideOffset.large(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacing.spacing40,
            const CustomCircularPercentIndicator(
              percent: 0.3,
              value: '1 660',
              label: 'Calories Burned',
            ),
            Spacing.spacing20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: currentPage == 0
                      ? null
                      : () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                          );
                        },
                  child: Assets.icons.arrowLeft.svg(
                    color: currentPage == 0
                        ? DefaultPalette.inactiveTextColor
                        : DefaultPalette.kDarkGreen,
                  ),
                ),
                Text(
                  currentPage == 0 ? "Calories Intake" : "Calories Burn",
                  style: context.theme.textTheme.headlineLarge
                      ?.copyWith(color: DefaultPalette.kDarkGreen),
                ),
                GestureDetector(
                  onTap: currentPage == 1
                      ? null
                      : () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                          );
                        },
                  child: Assets.icons.arrowRightPage.svg(
                    color: currentPage == 1
                        ? DefaultPalette.inactiveTextColor
                        : DefaultPalette.kDarkGreen,
                  ),
                ),
              ],
            ),
            Spacing.spacing20,
            Expanded(
              child: PageView(
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                controller: pageController,
                children: [
                  BarChartSample1(),
                  BarChartSample1(),
                ],
              ),
            ),
            Spacing.spacing20,
          ],
        ),
      ),
    );
  }
}
