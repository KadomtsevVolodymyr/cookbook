import 'package:auto_route/auto_route.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/navigation/app_router.dart';
import 'package:cookbook/widgets/molecules/check_box.dart';
import 'package:cookbook/widgets/molecules/custom_button.dart';
import 'package:cookbook/widgets/organisms/auth_footer_text.dart';
import 'package:cookbook/widgets/organisms/auth_header.dart';
import 'package:cookbook/widgets/organisms/divider_with_text.dart';
import 'package:cookbook/widgets/organisms/registration_form.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:cookbook/widgets/organisms/social_media_buttons.dart';
import 'package:flutter/material.dart';

class SignUpLayout extends StatefulWidget {
  const SignUpLayout({super.key});

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final spacing50 = SizedBox(height: 50.0.s);
  final spacing20 = SizedBox(height: 20.0.s);
  final spacing30 = SizedBox(height: 30.0.s);
  final spacing12 = SizedBox(height: 12.0.s);
  final spacing24 = SizedBox(height: 24.0.s);

  bool _isChecked = false;
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultPalette.white,
        automaticallyImplyLeading: false,
        title: const AuthHeader(
          greetingText: "Hey there,",
          mainTitle: "Log in your Account",
        ),
      ),
      backgroundColor: DefaultPalette.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: ScreenSideOffset.large(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: RegisterForm(
                              usernameController: usernameController,
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                          ),
                          spacing12,
                          CheckBoxWithText(
                            isChecked: _isChecked,
                            showErrorText: _showError,
                            onTap: () {
                              setState(() {
                                _isChecked = true;
                                _showError = false;
                              });
                            },
                          ),
                          const Spacer(),
                          CustomButton.shadowed(
                            text: Text(
                              "Register",
                              style: context.theme.textTheme.headlineMedium,
                            ),
                            onPressed: _onRegisterPressed,
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
                            mainText: 'Already have an account?',
                            actionText: 'Login',
                            onTap: () => context.router.replaceAll(
                              [const OnboardingRoute(), const LogInRoute()],
                            ),
                          ),
                          spacing50,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onRegisterPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isChecked) {
        // context.router.replaceAll([const UserProfileSetupRoute()]);
        // TODO(Volodymyr): Handle Registration
      } else {
        setState(() {
          _showError = true;
        });
      }
    }
  }
}
