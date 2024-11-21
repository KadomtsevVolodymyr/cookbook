import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/data/model/menu_item.dart';
import 'package:balancebyte/extensions/build_context.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/reports_analytics_screen/reports_analytics_screen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/molecules/custom_dropdown_menu.dart';
import 'package:balancebyte/widgets/molecules/custom_form_field.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class SupportLayout extends StatefulWidget {
  const SupportLayout({super.key});

  @override
  State<SupportLayout> createState() => _SupportLayoutState();
}

class _SupportLayoutState extends State<SupportLayout> {
  String initialHintText = "Choose your type of problem";
  String selectedHintText = 'Choose your type of problem';
  Widget? selectedIcon;
  bool isDropdownOpen = false;
  final List<MenuItem> dropDownItems = [
    MenuItem(text: 'Low calorie', icon: Assets.icons.lowCaloriesIcon),
    MenuItem(text: 'High protein', icon: Assets.icons.hightProtein),
    MenuItem(text: 'Low carb', icon: Assets.icons.lowCarb),
    MenuItem(text: 'High fiber', icon: Assets.icons.hightFiber),
  ];
  TextEditingController reportController = TextEditingController();
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
            Row(
              children: [
                Text(
                  "Report a Problem",
                  style: context.theme.textTheme.headlineLarge
                      ?.copyWith(color: DefaultPalette.kDarkGreen),
                ),
              ],
            ),
            Spacing.spacing20,
            CustomDropdownMenu(
              selectedHintText: selectedHintText,
              dropDownItems: dropDownItems,
              isDropdownOpen: isDropdownOpen,
              onChanged: (value) {
                setState(() {
                  if (value == null) {
                    selectedHintText = initialHintText;
                    selectedIcon = null;
                  } else {
                    selectedHintText = value.text;
                    selectedIcon =
                        value.icon.svg(color: DefaultPalette.inactiveTextColor);
                  }
                  isDropdownOpen = false;
                });
              },
              onMenuStateChange: (isOpen) {
                setState(() {
                  isDropdownOpen = isOpen;
                });
              },
            ),
            Spacing.spacing20,
            CustomFormField.custom(
              label: 'Comment',
              controller: reportController,
            ),
            const Spacer(),
            CustomButton.shadowed(
              text: Text(
                'Report',
                style: context.theme.textTheme.headlineMedium,
              ),
              onPressed: () {},
            ),
            Spacing.spacing40,
          ],
        ),
      ),
    );
  }
}
