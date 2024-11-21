import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/navigation/app_router.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class EmailSuccessLayout extends StatefulWidget {
  const EmailSuccessLayout({super.key});

  @override
  State<EmailSuccessLayout> createState() => _EmailSuccessLayoutState();
}

class _EmailSuccessLayoutState extends State<EmailSuccessLayout> {
  final spacing8 = SizedBox(height: 8.0.s);
  final spacing40 = SizedBox(height: 40.0.s);
  final spacing220 = SizedBox(height: 220.0.s);

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
                  'Success!',
                  style: context.theme.textTheme.headlineLarge?.copyWith(
                      color: DefaultPalette.kDarkGreen, fontSize: 36),
                  textAlign: TextAlign.center,
                ),
                spacing8,
                SizedBox(
                  width: descriptionWidth,
                  child: Text(
                    'Your code has been verified. Welcome aboard! You\'re all set to explore the amazing features of Balance Byte.',
                    style: context.theme.textTheme.titleLarge
                        ?.copyWith(color: DefaultPalette.kDarkGreen),
                    textAlign: TextAlign.center,
                  ),
                ),
                spacing220,
                CustomButton.shadowed(
                  text: Text(
                    "Start Now",
                    style: context.theme.textTheme.headlineMedium,
                  ),
                  onPressed: () =>
                      context.router.push(const UserProfileSetupRoute()),
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
