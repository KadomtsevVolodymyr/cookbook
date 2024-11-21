import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/navigation/app_router.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_cubit.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_state.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/molecules/error_form_text.dart';
import 'package:balancebyte/widgets/molecules/pin_input.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailConfirmationLayout extends StatefulWidget {
  const EmailConfirmationLayout({
    required this.email,
    required this.isPasswordRecovery,
    super.key,
  });

  final String email;
  final bool isPasswordRecovery;

  @override
  State<EmailConfirmationLayout> createState() =>
      _EmailConfirmationLayoutState();
}

class _EmailConfirmationLayoutState extends State<EmailConfirmationLayout> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final TextEditingController pinPutController = TextEditingController();
  bool hasError = false;

  int _remainingTime = 0;
  Timer? _timer;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    context.read<AuthCubit>().resendVerificationCode(email: widget.email);

    setState(() {
      pinPutController.clear();
      hasError = false;
    });
    setState(() {
      _remainingTime = 60; // Set timer for 1 minute
    });

    _timer?.cancel(); // Cancel any existing timers
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Row(
          children: [
            Spacing.spacingW24,
            GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Assets.icons.arrowLeft.svg(),
            ),
          ],
        ),
        title: Column(
          children: [
            Text(
              "Hey there,",
              style: context.theme.textTheme.titleMedium?.copyWith(
                color: DefaultPalette.kDarkGreen,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Confirm yur Email",
              style: context.theme.textTheme.headlineLarge?.copyWith(
                color: DefaultPalette.kDarkGreen,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              emailConfirmationSuccess: () {
                widget.isPasswordRecovery
                    ? context.router.replaceAll(
                        [PasswordRecoveryRoute(isPassRecovery: true)],
                      )
                    : context.router.replaceAll([const EmailSuccessRoute()]);
              },
              emailConfirmationError: () {
                setState(() {
                  hasError = true;
                });
              },
            );
          },
          builder: (context, state) {
            return ScreenSideOffset.large(
              child: Column(
                children: [
                  Spacing.spacing16,
                  Text(
                    'To complete your registration, please verify your email address by entering the 6-digit code sent to your inbox.',
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.displayMedium
                        ?.copyWith(color: DefaultPalette.kDarkGreen),
                  ),
                  Spacing.spacing24,
                  PinInput(
                    onComplete: (String code) {
                      context.read<AuthCubit>().activateUser(code: code);
                    },
                    pinPutController: pinPutController,
                    hasError: hasError,
                    onChanged: (String code) {
                      context.read<AuthCubit>().updateVerificationState();
                      setState(() {
                        hasError = false;
                      });
                    },
                  ),
                  state.maybeWhen(
                    orElse: Container.new,
                    emailConfirmationError: () {
                      return const ErrorFormText(
                        errorMessage:
                            "The code you entered is invalid or has expired. Please check your email for the correct code or request a new one.",
                      );
                    },
                  ),
                  Spacing.spacing24,
                  Text(
                    "Didn’t receive code?",
                    style: context.theme.textTheme.labelSmall
                        ?.copyWith(color: DefaultPalette.inactiveTextColor),
                  ),
                  GestureDetector(
                    onTap: _remainingTime == 0 ? _startTimer : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _remainingTime == 0
                              ? "Resend"
                              : "Resend in $_remainingTime sec",
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: _remainingTime == 0
                                        ? DefaultPalette.activeNavColor
                                        : DefaultPalette.inactiveTextColor,
                                  ),
                        ),
                        const SizedBox(height: 2),
                        if (_remainingTime == 0)
                          Container(
                            color: _remainingTime == 0
                                ? DefaultPalette.activeNavColor
                                : DefaultPalette.inactiveTextColor,
                            height: 1,
                            width: 60,
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomButton.shadowed(
                    text: Text(
                      "Verify Email",
                      style: context.theme.textTheme.headlineMedium,
                    ),
                    onPressed: () {
                      if (pinPutController.text.length == 6) {
                        context
                            .read<AuthCubit>()
                            .activateUser(code: pinPutController.text);
                        context.router.replaceAll(
                          [const EmailSuccessRoute()],
                        ); //TODO: remove
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
