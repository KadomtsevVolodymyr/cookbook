import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:flutter/material.dart';

class HandleBar extends StatelessWidget {
  const HandleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50.0.s,
        height: 5.0.s,
        margin: EdgeInsets.only(bottom: 12.0.s, top: 24.0.s),
        decoration: BoxDecoration(
          color: DefaultPalette.kDarkGreen.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50.0.s),
        ),
      ),
    );
  }
}
