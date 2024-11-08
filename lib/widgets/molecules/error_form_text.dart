import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/build_context.dart';
import 'package:cookbook/extensions/num.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class ErrorFormText extends StatelessWidget {
  const ErrorFormText({
    required String? errorMessage,
    super.key,
  }) : _errorMessage = errorMessage;

  final String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.icons.informationError.svg(),
          SizedBox(width: 8.0.s),
          Expanded(
            child: Text(
              _errorMessage!,
              style: context.theme.textTheme.labelSmall
                  ?.copyWith(color: DefaultPalette.errorColor),
            ),
          ),
        ],
      ),
    );
  }
}
