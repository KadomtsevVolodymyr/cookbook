import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/charts/radar_chart.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FoodGroupLayout extends StatefulWidget {
  const FoodGroupLayout({super.key});

  @override
  State<FoodGroupLayout> createState() => _FoodGroupLayoutState();
}

class _FoodGroupLayoutState extends State<FoodGroupLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconBack: true,
        title: 'Food Group Intake',
        icon: Assets.icons.profile.svg(),
        onIconTap: () => PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const AccountScreen(),
        ),
      ),
      body: ScreenSideOffset.large(
        child: Column(
          children: [
            Spacing.spacing40,
            const SizedBox(
              height: 400,
              child: CustomRadarChart(),
            ),
          ],
        ),
      ),
    );
  }
}
