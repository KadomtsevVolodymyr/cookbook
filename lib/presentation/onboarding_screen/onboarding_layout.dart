import 'package:auto_route/auto_route.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/generated/l10n.dart';
import 'package:cookbook/navigation/app_router.dart';
import 'package:cookbook/widgets/molecules/custom_button.dart';
import 'package:cookbook/widgets/molecules/gradient_background.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class OnboardingLayout extends StatefulWidget {
  const OnboardingLayout({super.key});

  @override
  State<OnboardingLayout> createState() => _OnboardingLayoutState();
}

class _OnboardingLayoutState extends State<OnboardingLayout> {
  final spacing24 = SizedBox(height: 24.0.s);
  final spacing8 = SizedBox(height: 8.0.s);
  final spacing12 = SizedBox(height: 12.0.s);
  final spacing40 = SizedBox(height: 40.0.s);
  final spacing110 = SizedBox(height: 110.0.s);

  final double logoWidth = 56.0.s;
  final double logoHeight = 67.0.s;
  final double descriptionWidth = 300.0.s;

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Stack(
        children: [
          Assets.images.onboardingTop.svg(
            width: MediaQuery.of(context).size.width,
          ),
          ScreenSideOffset.large(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Assets.logo.logo.image(width: logoWidth, height: logoHeight),
                spacing24,
                Text(
                  S.of(context).welcomeToCookbook,
                  style: context.theme.textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                spacing8,
                SizedBox(
                  width: descriptionWidth,
                  child: Text(
                    S.of(context).welcome_description,
                    style: context.theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                spacing110,
                CustomButton.primary(
                  text: Text(
                    S.of(context).signUp,
                    style: context.theme.textTheme.headlineMedium
                        ?.copyWith(color: DefaultPalette.kDarkGreen),
                  ),
                  onPressed: () => context.router.push(const SignUpRoute()),
                ),
                spacing12,
                CustomButton.outline(
                  text: Text(
                    S.of(context).logIn,
                    style: context.theme.textTheme.headlineMedium,
                  ),
                  onPressed: () => context.router.push(const LogInRoute()),
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
