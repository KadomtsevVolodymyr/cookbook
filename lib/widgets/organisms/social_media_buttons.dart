import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/molecules/image_button.dart';
import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;
  final VoidCallback onApplePressed;

  const SocialMediaButtons({
    required this.onGooglePressed,
    required this.onFacebookPressed,
    required this.onApplePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageButton(
          image: Assets.icons.googleLogo.image(width: 20.0.s, height: 20.0.s),
          onPressed: onGooglePressed,
        ),
        SizedBox(width: 24.0.s),
        ImageButton(
          image: Assets.icons.facebookLogo.svg(width: 20.0.s, height: 20.0.s),
          onPressed: onFacebookPressed,
        ),
        SizedBox(width: 24.0.s),
        ImageButton(
          image: Assets.icons.appleLogo.svg(width: 20.0.s, height: 20.0.s),
          onPressed: onApplePressed,
        ),
      ],
    );
  }
}
