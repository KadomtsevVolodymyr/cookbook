import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/charts/line_chart.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class WeightProgressLayout extends StatefulWidget {
  const WeightProgressLayout({super.key});

  @override
  State<WeightProgressLayout> createState() => _WeightProgressLayoutState();
}

class _WeightProgressLayoutState extends State<WeightProgressLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconBack: true,
        title: 'Weight Progress',
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
            LineChartSample1(),
          ],
        ),
      ),
    );
  }
}
