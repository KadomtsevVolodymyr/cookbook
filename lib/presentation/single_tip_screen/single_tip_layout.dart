import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/presentation/account_screen/account_screen.dart';
import 'package:cookbook/widgets/atoms/handle_bar.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class SingleTipLayout extends StatefulWidget {
  const SingleTipLayout({super.key});

  @override
  State<SingleTipLayout> createState() => _SingleTipLayoutState();
}

class _SingleTipLayoutState extends State<SingleTipLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Assets.images.tipsBg.svg(
                  width: MediaQuery.of(context).size.width,
                  height: 400.0.s,
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 60.0.s),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.hydrationBalance
                            .svg(width: 89.0.s, height: 120.0.s),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: ScreenSideOffset.large(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Assets.icons.arrowLeft.svg(),
                          onTap: () => PersistentNavBarNavigator.pop(context),
                        ),
                        GestureDetector(
                          child: Assets.icons.profile.svg(),
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const AccountScreen(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: DefaultPalette.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0.s)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HandleBar(),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        controller: scrollController,
                        child: ScreenSideOffset.large(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hydration Balance",
                                    style: context.theme.textTheme.headlineLarge
                                        ?.copyWith(
                                      color: DefaultPalette.kDarkGreen,
                                    ),
                                  ),
                                ],
                              ),
                              Spacing.spacing12,
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Facilisis massa sodales erat nam pellentesque amet interdum egestas. Semper scelerisque massa sed pretium turpis consectetur lectus orci.Lorem ipsum dolor sit amet consectetur. Facilisis massa sodales erat nam pellentesque amet interdum egestas. Semper scelerisque Lorem ipsum dolor sit amet consectetur. Facilisis massa sodales erat nam pellentesque amet interdum egestas. Semper scelerisque massa sed pretium turpis consectetur lectus orci.\nLorem ipsum dolor sit amet consectetur. Facilisis massa sodales erat nam pellentesque amet interdum egestas. Semper scelerisque massa sed pretium turpis consectetur lectus orci. Lorem ipsum dolor sit amet consectetur. Facilisis massa sodales erat nam pellentesque amet interdum egestas. Semper scelerisque massa sed pretium turpis consectetur lectus orci.\nLorem ipsum dolor sit amet consectetur. Facilisis massa sodales erat nam pellentesque amet interdum egestas. Semper scelerisque\nLorem ipsum dolor sit amet consectetur. Facilisis massa sodales erat nam pellentesque amet interdum egestas. Semper scelerisque ",
                                style: context.theme.textTheme.displayMedium
                                    ?.copyWith(
                                  color: DefaultPalette.inactiveTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
