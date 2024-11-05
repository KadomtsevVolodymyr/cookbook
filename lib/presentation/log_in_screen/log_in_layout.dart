import 'package:auto_route/auto_route.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/navigation/app_router.dart';
import 'package:cookbook/widgets/molecules/custom_button.dart';
import 'package:cookbook/widgets/organisms/auth_footer_text.dart';
import 'package:cookbook/widgets/organisms/auth_header.dart';
import 'package:cookbook/widgets/organisms/divider_with_text.dart';
import 'package:cookbook/widgets/organisms/registration_form.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:cookbook/widgets/organisms/social_media_buttons.dart';
import 'package:flutter/material.dart';

class LogInLayout extends StatefulWidget {
  const LogInLayout({super.key});

  @override
  State<LogInLayout> createState() => _LogInLayoutState();
}

class _LogInLayoutState extends State<LogInLayout> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final spacing50 = SizedBox(height: 50.0.s);
  final spacing20 = SizedBox(height: 20.0.s);
  final spacing30 = SizedBox(height: 30.0.s);
  final spacing12 = SizedBox(height: 12.0.s);
  final spacing24 = SizedBox(height: 24.0.s);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultPalette.white,
      body: ScreenSideOffset.large(
        child: Column(
          children: [
            spacing50,
            const AuthHeader(
              greetingText: "Hey there,",
              mainTitle: "Log in your Account",
            ),
            RegisterForm(
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController,
              showUsernameField: false,
            ),
            spacing12,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO(Volodymyr): Handle reset password
                  },
                  child: Text(
                    'Reset Password',
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      color: DefaultPalette.borderColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButton.shadowed(
              text: Text(
                "Log in",
                style: context.theme.textTheme.headlineMedium,
              ),
              onPressed: () {
                // TODO(Volodymyr): Handle Log in
              },
            ),
            spacing20,
            const DividerWithText(text: 'Or'),
            spacing20,
            SocialMediaButtons(
              onGooglePressed: () {
                // TODO(Volodymyr): Handle Google login
              },
              onFacebookPressed: () {
                // TODO(Volodymyr): Handle Facebook login
              },
              onApplePressed: () {
                // TODO(Volodymyr): Handle Apple login
              },
            ),
            spacing30,
            AuthFooterText(
              isUnderlined: true,
              mainText: 'I want to create a',
              actionText: 'new account',
              onTap: () => context.router
                  .replaceAll([const OnboardingRoute(), const SignUpRoute()]),
            ),
            spacing50,
          ],
        ),
      ),
    );
  }
}
