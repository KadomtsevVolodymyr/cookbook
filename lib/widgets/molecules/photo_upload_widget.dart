import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class PhotoUploadWidget extends StatelessWidget {
  final Future<void> Function()? onTap;
  final String? imagePath;

  const PhotoUploadWidget({
    super.key,
    this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 24.0.s),
          Center(
            child: Container(
              width: 120.0.s,
              height: 120.0.s,
              decoration: BoxDecoration(
                color: DefaultPalette.backgroundFormColor,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                image: imagePath != null
                    ? DecorationImage(
                        image: AssetImage(imagePath!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: imagePath == null
                  ? Center(
                      child:
                          Assets.icons.add.svg(width: 24.0.s, height: 24.0.s),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Upload photo',
            style: context.theme.textTheme.displayMedium?.copyWith(
              color: DefaultPalette.kDarkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
