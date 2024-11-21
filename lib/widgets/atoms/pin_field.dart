import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinField extends StatelessWidget {
  final PinTheme theme;
  final Function(String code) onComplete;
  final TextEditingController pinPutController;
  final bool hasError;
  final Function(String code) onChanged;

  const PinField({
    required this.theme,
    required this.onComplete,
    required this.pinPutController,
    required this.hasError,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinPutController,
      forceErrorState: hasError,
      cursor: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 10,
          height: 1,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: DefaultPalette.activeNavColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      length: 6,
      defaultPinTheme: theme,
      focusedPinTheme: theme.copyWith(
        decoration: theme.decoration!.copyWith(
          border: Border.all(color: DefaultPalette.activeNavColor),
        ),
      ),
      errorPinTheme: theme.copyWith(
        decoration: theme.decoration!.copyWith(
          border: Border.all(color: DefaultPalette.errorColor),
        ),
      ),
      onChanged: onChanged,
      onCompleted: onComplete,
    );
  }
}
