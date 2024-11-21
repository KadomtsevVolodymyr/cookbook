import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/navigation/app_router.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_cubit.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_state.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/organisms/auth_footer_text.dart';
import 'package:balancebyte/widgets/organisms/auth_header.dart';
import 'package:balancebyte/widgets/organisms/divider_with_text.dart';
import 'package:balancebyte/widgets/organisms/registration_form.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:balancebyte/widgets/organisms/social_media_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        backgroundColor: DefaultPalette.white,
        automaticallyImplyLeading: false,
        title: const AuthHeader(
          greetingText: "Hey there,",
          mainTitle: "Log in your Account",
        ),
      ),
      backgroundColor: DefaultPalette.white,
      body: ScreenSideOffset.large(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              authenticated: () {
                context.router.replaceAll([const HomeRoute()]);
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
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
                      onTap: () =>
                          context.router.push(const ResetPasswordRoute()),
                      child: Text(
                        'Reset Password',
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          color: DefaultPalette.borderColor,
                          decoration: TextDecoration.underline,
                          decorationColor: DefaultPalette.borderColor,
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
                    print(usernameController.text);
                    context.read<AuthCubit>().login(
                        login: usernameController.text,
                        password: passwordController.text);
                    // context.router.replaceAll([const HomeRoute()]);
                    // TODO(Volodymyr): Handle Log in
                  },
                ),
                spacing20,
                const DividerWithText(text: 'Or'),
                spacing20,
                SocialMediaButtons(
                  onGooglePressed: () {
                    context.read<AuthCubit>().loginWithGoogle();
                  },
                  onFacebookPressed: () {
                    context.read<AuthCubit>().loginWithFacebook();
                  },
                  onApplePressed: () {
                    context.read<AuthCubit>().loginWithApple();
                  },
                ),
                spacing30,
                AuthFooterText(
                  isUnderlined: true,
                  mainText: 'I want to create a',
                  actionText: 'new account',
                  onTap: () => context.router.replaceAll(
                      [const OnboardingRoute(), const SignUpRoute()]),
                ),
                spacing50,
              ],
            );
          },
        ),
      ),
    );
  }
}
