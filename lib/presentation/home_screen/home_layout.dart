import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/presentation/main_screen/main_screen.dart';
import 'package:cookbook/widgets/molecules/custom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        navBarHeight: 74.0.s,
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        resizeToAvoidBottomInset: true,
        padding: const EdgeInsets.only(left: 8, right: 8),
        animationSettings: const NavBarAnimationSettings(
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
          ),
        ),
        navBarStyle: NavBarStyle.style3,
        decoration: const NavBarDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFF7F8F8),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x14040F0B),
              offset: Offset(0, -4),
              blurRadius: 16,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const MainScreen(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      CustomBottomNavBarItem(
        activeIcon:
            Assets.icons.homeNavActive.svg(width: 21.0.s, height: 21.0.s),
        inactiveIcon:
            Assets.icons.homeNavUnnactive.svg(width: 21.0.s, height: 21.0.s),
        title: 'Home',
        context: context,
      ),
      CustomBottomNavBarItem(
        activeIcon:
            Assets.icons.recipiesNavActive.svg(width: 21.0.s, height: 21.0.s),
        inactiveIcon: Assets.icons.recipiesNavUnnactive
            .svg(width: 21.0.s, height: 21.0.s),
        title: 'Recipes',
        context: context,
      ),
      CustomBottomNavBarItem(
        activeIcon:
            Assets.icons.tipsNavActive.svg(width: 21.0.s, height: 21.0.s),
        inactiveIcon:
            Assets.icons.tipsNavUnnactive.svg(width: 21.0.s, height: 21.0.s),
        title: 'Tips',
        context: context,
      ),
      CustomBottomNavBarItem(
        activeIcon:
            Assets.icons.scannerNavActive.svg(width: 21.0.s, height: 21.0.s),
        inactiveIcon:
            Assets.icons.scannerNavUnnactive.svg(width: 21.0.s, height: 21.0.s),
        title: 'Scanner',
        context: context,
      ),
      CustomBottomNavBarItem(
        activeIcon:
            Assets.icons.forumNavActive.svg(width: 21.0.s, height: 21.0.s),
        inactiveIcon:
            Assets.icons.forumNavUnnactive.svg(width: 21.0.s, height: 21.0.s),
        title: 'Forum',
        context: context,
      ),
    ];
  }
}
