import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/build_context.dart';
import 'package:balancebyte/navigation/app_router.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/molecules/custom_form_field.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class ResetPasswordLayout extends StatefulWidget {
  const ResetPasswordLayout({super.key});

  @override
  State<ResetPasswordLayout> createState() => _ResetPasswordLayoutState();
}

class _ResetPasswordLayoutState extends State<ResetPasswordLayout> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Password Recovery',
        iconBack: true,
        icon: Container(),
        onIconTap: () {},
      ),
      body: SafeArea(
        child: ScreenSideOffset.large(
          child: Column(
            children: [
              Text(
                'Please enter your email address below. We will send a 6-digit code to help you recover your password.',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displayMedium
                    ?.copyWith(color: DefaultPalette.kDarkGreen),
              ),
              Spacing.spacing24,
              CustomFormField.email(
                label: 'Email',
                controller: emailController,
              ),
              const Spacer(),
              CustomButton.shadowed(
                text: Text(
                  "Send code",
                  style: context.theme.textTheme.headlineMedium,
                ),
                onPressed: () => context.router
                    .push(EmailConfirmationRoute(email: emailController.text)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
