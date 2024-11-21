import 'package:balancebyte/extensions/extensions.dart';
import 'package:flutter/material.dart';

class StoryImage extends StatelessWidget {
  final Widget imageUrl;

  const StoryImage({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0.s,
      height: 70.0.s,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0.s,
        ),
      ),
      child: imageUrl,
    );
  }
}
