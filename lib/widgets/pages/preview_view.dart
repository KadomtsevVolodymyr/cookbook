import 'dart:io';

import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/atoms/custom_container.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:flutter/material.dart';

class PreviewView extends StatelessWidget {
  final String photoPath;
  final VoidCallback onClose;
  final VoidCallback onPublish;

  const PreviewView({
    required this.photoPath,
    required this.onClose,
    required this.onPublish,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.file(
            File(photoPath),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 24.0.s,
          child: SafeArea(
            child: GestureDetector(
              onTap: onClose,
              child: CustomContainer(
                child: Assets.icons.closeCamera.svg(),
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 40,
          child: CustomButton.primary(
            text: Text(
              "Publish",
              style: context.theme.textTheme.headlineMedium
                  ?.copyWith(color: DefaultPalette.kDarkGreen),
            ),
            onPressed: onPublish,
            suffixIcon: Assets.icons.arrowRightOutlined.svg(),
          ),
        ),
      ],
    );
  }
}
