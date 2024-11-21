import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/presentation/reports_analytics_screen/reports_analytics_screen.dart';
import 'package:balancebyte/utils/platform_utils.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/health_button.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class SettingsLayout extends StatefulWidget {
  const SettingsLayout({super.key});

  @override
  State<SettingsLayout> createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends State<SettingsLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Settings",
        icon: Assets.icons.statisticButton.svg(),
        iconBack: true,
        onIconTap: () => PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const ReportsAnalyticsScreen(),
        ),
      ),
      body: ScreenSideOffset.large(
        child: Column(
          children: [
            Spacing.spacing40,
            Text(
              "Connect your Health App",
              style: context.theme.textTheme.headlineLarge
                  ?.copyWith(color: DefaultPalette.kDarkGreen),
            ),
            Spacing.spacing20,
            if (PlatformUtils.isAndroid()) HealthButton.googleFit(),
            if (PlatformUtils.isIOS()) HealthButton.appleHealth(),
          ],
        ),
      ),
    );
  }
}
