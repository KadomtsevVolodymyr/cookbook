import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/utils/platform_utils.dart';
import 'package:cookbook/widgets/molecules/gradient_background.dart';
import 'package:cookbook/widgets/molecules/health_button.dart';
import 'package:cookbook/widgets/molecules/scrollable_decorated_container.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class ConnectHealthAppLayout extends StatefulWidget {
  const ConnectHealthAppLayout({super.key});

  @override
  State<ConnectHealthAppLayout> createState() => _ConnectHealthAppLayoutState();
}

class _ConnectHealthAppLayoutState extends State<ConnectHealthAppLayout> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Stack(
        children: [
          Positioned(
            top: -30.0.s,
            child: Assets.images.connectHealth
                .svg(width: MediaQuery.of(context).size.width),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: 180.0.s),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0.s),
                    topRight: Radius.circular(25.0.s),
                  ),
                  color: DefaultPalette.white,
                ),
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  top: false,
                  child: ScreenSideOffset.large(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.0.s,
                        ),
                        Text(
                          'Connect Your Health App',
                          style:
                              context.theme.textTheme.headlineLarge?.copyWith(
                            color: DefaultPalette.kDarkGreen,
                          ),
                        ),
                        SizedBox(
                          height: 8.0.s,
                        ),
                        Text(
                          'To give you the best personalized recommendations, please choose a health app to integrate with us. By connecting, we can analyze your health data to provide customized insights and recipe suggestions tailored to your wellness goals.\n\nSelect an app to start improving your health journey with us:',
                          textAlign: TextAlign.center,
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            color: DefaultPalette.kDarkGreen,
                          ),
                        ),
                        SizedBox(
                          height: 24.0.s,
                        ),
                        if (PlatformUtils.isAndroid()) HealthButton.googleFit(),
                        if (PlatformUtils.isAndroid())
                          SizedBox(
                            height: 12.0.s,
                          ),
                        if (PlatformUtils.isIOS()) HealthButton.appleHealth(),
                        SizedBox(
                          height: 12.0.s,
                        ),
                        const Spacer(),
                        _skipText(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _skipText(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Skip',
            style: context.theme.textTheme.headlineMedium?.copyWith(
              decoration: TextDecoration.underline,
              color: DefaultPalette.kDarkGreen,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
