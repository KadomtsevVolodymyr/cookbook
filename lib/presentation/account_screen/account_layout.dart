import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/data/model/reusable_card_item.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/reports_analytics_screen/reports_analytics_screen.dart';
import 'package:balancebyte/presentation/settings_screen/settings_screen.dart';
import 'package:balancebyte/presentation/support_screen/support_screen.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/molecules/gradient_switch.dart';
import 'package:balancebyte/widgets/molecules/reusable_card.dart';
import 'package:balancebyte/widgets/organisms/info_card.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AccountLayout extends StatefulWidget {
  const AccountLayout({super.key});

  @override
  State<AccountLayout> createState() => _AccountLayoutState();
}

class _AccountLayoutState extends State<AccountLayout> {
  final spacing48 = SizedBox(height: 48.0.s);
  final spacing40 = SizedBox(height: 40.0.s);
  final spacing24 = SizedBox(height: 24.0.s);
  final spacing20 = SizedBox(height: 20.0.s);
  final spacing16 = SizedBox(height: 16.0.s);
  final spacing12 = SizedBox(height: 12.0.s);

  final spacingW24 = SizedBox(width: 24.0.s);
  final spacingW16 = SizedBox(width: 16.0.s);
  final spacingW12 = SizedBox(width: 12.0.s);
  final spacingW10 = SizedBox(width: 10.0.s);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            spacingW24,
            GestureDetector(
              onTap: () => PersistentNavBarNavigator.pop(
                context,
              ),
              child: Assets.icons.arrowLeft.svg(),
            ),
          ],
        ),
        actions: [
          ScreenSideOffset.large(
            child: GestureDetector(
              onTap: () => PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const ReportsAnalyticsScreen(),
              ),
              child: Assets.icons.statisticButton.svg(),
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
                spacing20,
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28.0.s,
                      child: Assets.images.avatar.image(),
                    ),
                    spacingW16,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Peter Parker",
                          style: context.theme.textTheme.headlineLarge
                              ?.copyWith(color: DefaultPalette.kDarkGreen),
                        ),
                        Text(
                          "Lose A Fat Program",
                          style:
                              context.theme.textTheme.displayMedium?.copyWith(
                            color: DefaultPalette.inactiveTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                spacing20,
                Row(
                  children: [
                    const Expanded(
                      child: InfoCard(label: 'Height', value: '180 cm'),
                    ),
                    spacingW12,
                    const Expanded(
                      child: InfoCard(label: 'Weight', value: '75 kg'),
                    ),
                    spacingW12,
                    const Expanded(
                      child: InfoCard(label: 'Age', value: '25 yrs'),
                    ),
                  ],
                ),
                spacing20,
                CustomButton.shadowed(
                  text: Text(
                    "Edit",
                    style: context.theme.textTheme.headlineMedium,
                  ),
                  onPressed: () {},
                ),
                spacing40,
                ReusableCard(
                  title: 'Account',
                  items: [
                    ReusableCardItem(
                      text: 'Personal Data',
                      icon: Assets.icons.personalData.svg(),
                      onTap: () {},
                    ),
                    ReusableCardItem(
                      text: 'Subscription Plan',
                      icon: Assets.icons.subPlan.svg(),
                      onTap: () {},
                    ),
                    ReusableCardItem(
                      text: 'References & Goals',
                      icon: Assets.icons.goals.svg(),
                      onTap: () {},
                    ),
                  ],
                ),
                spacing24,
                ReusableCard(
                  title: 'Notification',
                  items: [
                    ReusableCardItem(
                      text: 'Pop-up Notification',
                      icon: Assets.icons.notification.svg(),
                      switchWidget: const GradientSwitch(),
                      onTap: () {},
                    ),
                  ],
                ),
                spacing24,
                ReusableCard(
                  title: 'Account',
                  items: [
                    ReusableCardItem(
                      text: 'Support',
                      icon: Assets.icons.support.svg(),
                      onTap: () => PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const SupportScreen(),
                      ),
                    ),
                    ReusableCardItem(
                      text: 'Settings',
                      icon: Assets.icons.setting.svg(),
                      onTap: () => PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const SettingsScreen(),
                      ),
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
