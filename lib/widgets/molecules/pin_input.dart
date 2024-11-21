import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/widgets/atoms/pin_field.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInput extends StatelessWidget {
  const PinInput({
    required this.onComplete,
    required this.pinPutController,
    required this.hasError,
    required this.onChanged,
    super.key,
  });

  final Function(String code) onComplete;
  final Function(String code) onChanged;
  final TextEditingController pinPutController;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 48.0.s,
      height: 49.0.s,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PinField(
          theme: defaultTheme,
          onComplete: onComplete,
          hasError: hasError,
          pinPutController: pinPutController,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
