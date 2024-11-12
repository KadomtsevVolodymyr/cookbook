import 'package:auto_route/auto_route.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/navigation/app_router.dart';
import 'package:cookbook/widgets/molecules/custom_button.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class LoginSuccessLayout extends StatefulWidget {
  const LoginSuccessLayout({super.key});

  @override
  State<LoginSuccessLayout> createState() => _LoginSuccessLayoutState();
}

class _LoginSuccessLayoutState extends State<LoginSuccessLayout> {
  final spacing8 = SizedBox(height: 8.0.s);
  final spacing40 = SizedBox(height: 40.0.s);
  final spacing210 = SizedBox(height: 210.0.s);

  final double descriptionWidth = 300.0.s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultPalette.white,
      body: Stack(
        children: [
          Assets.images.congrtTop.svg(
            width: MediaQuery.of(context).size.width,
          ),
          ScreenSideOffset.large(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Congratulations!',
                  style: context.theme.textTheme.headlineLarge
                      ?.copyWith(color: DefaultPalette.kDarkGreen),
                  textAlign: TextAlign.center,
                ),
                spacing8,
                SizedBox(
                  width: descriptionWidth,
                  child: Text(
                    'You\'ve completed your first step toward a healthier, happier you!\n\nKeep exploring delicious recipes, personalized just for you. We\'re here to make your journey fun, flavorful, and easy!',
                    style: context.theme.textTheme.titleLarge
                        ?.copyWith(color: DefaultPalette.kDarkGreen),
                    textAlign: TextAlign.center,
                  ),
                ),
                spacing210,
                CustomButton.shadowed(
                  text: Text(
                    "Go To Home",
                    style: context.theme.textTheme.headlineMedium,
                  ),
                  onPressed: () => context.router.push(const HomeRoute()),
                ),
                spacing40,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
