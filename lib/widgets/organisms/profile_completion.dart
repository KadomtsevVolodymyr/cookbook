import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class ProfileCompletionWidget extends StatelessWidget {
  final String progressText;
  final int currentPage;
  final Function() onBack;

  const ProfileCompletionWidget({
    required this.progressText,
    required this.currentPage,
    required this.onBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0.s),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: currentPage != 0
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (currentPage != 0)
                Padding(
                  padding: EdgeInsets.only(left: 24.0.s),
                  child: GestureDetector(
                    onTap: onBack,
                    child: Assets.icons.arrowWhite
                        .svg(width: 24.0.s, height: 24.0.s),
                  ),
                ),
              Text(
                "Build your profile",
                style: context.theme.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              if (currentPage != 0)
                SizedBox(
                  width: 48.0.s,
                ),
            ],
          ),
          SizedBox(
            height: 4.0.s,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                progressText,
                style: context.theme.textTheme.headlineMedium,
              ),
              SizedBox(
                width: 8.0.s,
              ),
              Text(
                "complete",
                style: context.theme.textTheme.titleLarge?.copyWith(
                  color: DefaultPalette.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.0.s,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 22.0.s,
              right: 22.0.s,
              bottom: 16.0.s,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Expanded(
                  child: Container(
                    height: 2.0.s,
                    margin: EdgeInsets.symmetric(horizontal: 2.0.s),
                    decoration: BoxDecoration(
                      color: currentPage >= index
                          ? DefaultPalette.white
                          : DefaultPalette.backgroundFormColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
