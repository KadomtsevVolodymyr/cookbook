import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/num.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final Widget image;
  final VoidCallback onPressed;

  const ImageButton({
    required this.image,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50.0.s,
        height: 50.0.s,
        decoration: BoxDecoration(
          border: Border.all(color: DefaultPalette.borderColor, width: 0.8.s),
          borderRadius: BorderRadius.circular(8.0.s),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
          ],
        ),
      ),
    );
  }
}
