import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/presentation/forum/followers_screen/followers_screen.dart';
import 'package:balancebyte/presentation/forum/following_screen/following_screen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_form_field.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/post_card.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:balancebyte/widgets/organisms/user_stories_list.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CommunityLayout extends StatefulWidget {
  const CommunityLayout({super.key});

  @override
  State<CommunityLayout> createState() => _CommunityLayoutState();
}

class _CommunityLayoutState extends State<CommunityLayout> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Hi, Sara!',
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
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.0.s,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          elevation: 10,
                          shadowColor: const Color(0x1D161712),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const FollowingScreen(),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Following: ",
                              style: context.theme.textTheme.titleLarge
                                  ?.copyWith(color: DefaultPalette.kDarkGreen),
                            ),
                            TextSpan(
                              text: "12",
                              style: context.theme.textTheme.titleLarge
                                  ?.copyWith(
                                      color: DefaultPalette.inactiveTextColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Spacing.spacingW12,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const FollowersScreen(),
                      );
                    },
                    child: Container(
                      height: 40.0.s,
                      decoration: BoxDecoration(
                        boxShadow: const [DefaultShadowPalette.primaryShadow],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(
                              117,
                              219,
                              126,
                              0.2,
                            ),
                            Color.fromRGBO(
                              0,
                              205,
                              172,
                              0.2,
                            ),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.zero,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Followers: ",
                                style: context.theme.textTheme.titleLarge
                                    ?.copyWith(
                                        color: DefaultPalette.kDarkGreen),
                              ),
                              TextSpan(
                                text: "12",
                                style: context.theme.textTheme.titleLarge
                                    ?.copyWith(
                                        color:
                                            DefaultPalette.inactiveTextColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacing.spacing20,
            CustomFormField.custom(
              label: 'Search',
              controller: searchController,
              prefixIcon: Assets.icons.searchIcon.svg(),
            ),
            Spacing.spacing20,
            UserStoriesList(
              userImages: [
                Assets.images.profileCustom.image(fit: BoxFit.cover),
                Assets.images.profileCustom.image(fit: BoxFit.cover),
                Assets.images.profileCustom.image(fit: BoxFit.cover),
                Assets.images.profileCustom.image(fit: BoxFit.cover),
                Assets.images.profileCustom.image(fit: BoxFit.cover),
                Assets.images.profileCustom.image(fit: BoxFit.cover),
              ],
            ),
            Spacing.spacing40,
            Expanded(
              child: ListView(
                children: [
                  PostCard(
                    profileImageUrl:
                        Assets.images.profileCustom.image(fit: BoxFit.cover),
                    username: "Peter",
                    postText:
                        "Lorem ipsum dolor sit amet consectetur. Cursus pellentesque egestas pharetra ornare felis enim. Integer quis egestas cras justo neque odio. Nulla sed sed odio egestas elementum eu amet.",
                    postImageUrl:
                        Assets.images.profileCustom.image(fit: BoxFit.cover),
                    onFollowPressed: () {},
                  ),
                  Spacing.spacing20,
                  PostCard(
                    profileImageUrl:
                        Assets.images.profileCustom.image(fit: BoxFit.cover),
                    username: "Jane",
                    postText: "This is another amazing post!",
                    postImageUrl:
                        Assets.images.profileCustom.image(fit: BoxFit.cover),
                    onFollowPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
