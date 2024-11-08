import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/generated/l10n.dart';
import 'package:cookbook/utils/validators.dart';
import 'package:cookbook/widgets/molecules/error_form_text.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String label;
  final String? type;
  final TextEditingController controller;

  const CustomFormField.username({
    required this.label,
    required this.controller,
    super.key,
  }) : type = 'username';

  const CustomFormField.email({
    required this.label,
    required this.controller,
    super.key,
  }) : type = 'email';

  const CustomFormField.password({
    required this.label,
    required this.controller,
    super.key,
  }) : type = 'password';

  @override
  CustomFormFieldState createState() => CustomFormFieldState();
}

class CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            setState(() {
              _errorMessage = null;
            });
          },
          cursorColor: DefaultPalette.borderColor,
          controller: widget.controller,
          obscureText: widget.type == 'password' ? _obscureText : false,
          style: context.theme.textTheme.titleLarge
              ?.copyWith(color: DefaultPalette.kDarkGreen),
          decoration: InputDecoration(
            filled: true,
            fillColor: DefaultPalette.backgroundFormColor,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.label,
            labelStyle: context.theme.textTheme.titleLarge
                ?.copyWith(color: DefaultPalette.inactiveTextColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _errorMessage.isEmpty
                    ? DefaultPalette.backgroundFormColor
                    : DefaultPalette.errorColor,
              ),
              borderRadius: BorderRadius.circular(14.0.s),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0.s),
              borderSide: BorderSide(
                color: _errorMessage.isEmpty
                    ? DefaultPalette.borderColor
                    : DefaultPalette.errorColor,
              ),
            ),
            suffixIcon: widget.type == 'password'
                ? IconButton(
                    icon: _obscureText
                        ? Assets.icons.hidePassword.svg()
                        : Assets.icons.showPassword.svg(),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
          validator: (value) {
            String? error;

            if (widget.type == 'email' && Validators.isInvalidEmail(value)) {
              error = S.of(context).pleaseEnterEmail;
            } else if (widget.type == 'password' &&
                Validators.isInvalidPassword(value)) {
              error = S.of(context).incorrectPassword;
            } else if (widget.type == 'username' &&
                Validators.isInvalidName(value)) {
              error = S.of(context).usernameIncrorrect;
            } else if (Validators.isEmpty(value)) {
              error = 'Please enter your ${widget.label}.';
            }

            setState(() {
              _errorMessage = error;
            });

            return null;
          },
        ),
        if (_errorMessage != null)
          ErrorFormText(
            errorMessage: _errorMessage,
          ),
      ],
    );
  }
}
