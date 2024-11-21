import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_form_field.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/drop_down_menu_sort.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FollowingLayout extends StatefulWidget {
  const FollowingLayout({super.key});

  @override
  State<FollowingLayout> createState() => _FollowingLayoutState();
}

class _FollowingLayoutState extends State<FollowingLayout> {
  String selectedHintText = "Default";
  Widget? selectedIcon;
  bool isDropdownOpen = false;
  final List<String> sortOptions = ['Default', 'Top'];

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        secondText: "123",
        iconBack: true,
        title: 'Following',
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
            CustomFormField.custom(
              label: 'Search',
              controller: searchController,
              prefixIcon: Assets.icons.searchIcon.svg(),
            ),
            Spacing.spacing12,
            DropdownMenuSort(
              selectedHintText: selectedHintText,
              selectedIcon: selectedIcon,
              dropDownItems: sortOptions,
              isDropdownOpen: isDropdownOpen,
              onChanged: (value) {
                setState(() {
                  if (value == null) {
                    selectedHintText = "Default";
                    selectedIcon = null;
                  } else {
                    selectedHintText = value;
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
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(Assets.images.userProfile.path),
                        radius: 28.0.s,
                      ),
                      Spacing.spacingW12,
                      Text(
                        "Peter",
                        style: context.theme.textTheme.headlineMedium
                            ?.copyWith(color: DefaultPalette.kDarkGreen),
                      ),
                      const Spacer(),
                      Container(
                        width: 135.0.s,
                        height: 40.0.s,
                        decoration: const BoxDecoration(
                          boxShadow: [DefaultShadowPalette.primaryShadow],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Assets.icons.minus.svg(),
                              Spacing.spacingW10,
                              Text(
                                "Unfollow",
                                style: context.theme.textTheme.titleLarge
                                    ?.copyWith(
                                  color: DefaultPalette.kDarkGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Spacing.spacing20,
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
