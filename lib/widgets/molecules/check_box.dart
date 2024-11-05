import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/molecules/error_form_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CheckBoxWithText extends StatefulWidget {
  const CheckBoxWithText({
    required this.isChecked,
    required this.showErrorText,
    required this.onTap,
    super.key,
  });

  final bool isChecked;
  final bool showErrorText;
  final VoidCallback onTap;

  @override
  CheckBoxWithTextState createState() => CheckBoxWithTextState();
}

class CheckBoxWithTextState extends State<CheckBoxWithText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: widget.onTap,
              child: SizedBox(
                width: 16.0.s,
                height: 16.0.s,
                child: !widget.isChecked
                    ? Assets.svg.checkBoxFalse.svg()
                    : Assets.svg.checkBoxTrue.svg(),
              ),
            ),
            SizedBox(width: 8.0.s),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'By continuing you accept our ',
                  style: context.theme.textTheme.labelSmall
                      ?.copyWith(color: DefaultPalette.inactiveTextColor),
                  children: [
                    TextSpan(
                      text: 'Privacy Policy',
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        color: DefaultPalette.inactiveTextColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO(Volodymyr): Implement Privacy Policy
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                      style: context.theme.textTheme.labelSmall
                          ?.copyWith(color: DefaultPalette.inactiveTextColor),
                    ),
                    TextSpan(
                      text: 'Terms of Use',
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        color: DefaultPalette.inactiveTextColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO(Volodymyr): Implement Terms of Use
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (widget.showErrorText)
          const ErrorFormText(
            errorMessage: 'You must agree to the Terms and Conditions',
          ),
        SizedBox(height: 24.0.s),
      ],
    );
  }
}
