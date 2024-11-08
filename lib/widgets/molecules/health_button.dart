import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class HealthButton extends StatelessWidget {
  final String text;
  final Widget icon;

  HealthButton._({
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);

  // Constructor for Apple Health button
  factory HealthButton.appleHealth({Key? key}) {
    return HealthButton._(
      key: key,
      text: 'Apple Health',
      icon: Assets.icons.appleLogo.svg(),
    );
  }

  // Constructor for Google Fit button
  factory HealthButton.googleFit({Key? key}) {
    return HealthButton._(
      key: key,
      text: 'Google Fit',
      icon: Assets.icons.googleLogo.image(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 15.0.s),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0.s),
          side: const BorderSide(color: DefaultPalette.borderColor, width: 0.8),
        ),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.0.s),
            child: icon,
          ),
          SizedBox(width: 12.0.s),
          Text(
            text,
            style: context.theme.textTheme.titleLarge
                ?.copyWith(color: DefaultPalette.kDarkGreen),
          ),
        ],
      ),
    );
  }
}
