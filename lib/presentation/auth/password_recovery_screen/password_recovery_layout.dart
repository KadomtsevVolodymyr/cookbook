import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/navigation/app_router.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/molecules/custom_form_field.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryLayout extends StatefulWidget {
  const PasswordRecoveryLayout({required this.isPassRecovery, super.key});

  final bool isPassRecovery;

  @override
  State<PasswordRecoveryLayout> createState() => _PasswordRecoveryLayoutState();
}

class _PasswordRecoveryLayoutState extends State<PasswordRecoveryLayout> {
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.isPassRecovery ? 'Password Recovery' : "Change Password",
        iconBack: true,
        icon: Container(),
        onIconTap: () {},
      ),
      body: SafeArea(
        child: ScreenSideOffset.large(
          child: Column(
            children: [
              Text(
                'Your new password should be secure and easy for you to remember.',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displayMedium
                    ?.copyWith(color: DefaultPalette.kDarkGreen),
              ),
              Spacing.spacing24,
              CustomFormField.password(
                label: 'New Password',
                controller: newPassController,
              ),
              Spacing.spacing20,
              CustomFormField.password(
                label: 'Confirm Password',
                controller: confirmPassController,
              ),
              const Spacer(),
              CustomButton.shadowed(
                text: Text(
                  widget.isPassRecovery ? "Confirm" : "Change Password",
                  style: context.theme.textTheme.headlineMedium,
                ),
                onPressed: () {
                  widget.isPassRecovery
                      ? context.router.replaceAll([const LogInRoute()])
                      : context.router.maybePop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
