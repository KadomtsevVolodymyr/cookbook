import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';

import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Widget profileImageUrl;
  final String username;
  final String postText;
  final Widget postImageUrl;
  final VoidCallback onFollowPressed;

  const PostCard({
    required this.profileImageUrl,
    required this.username,
    required this.postText,
    required this.postImageUrl,
    required this.onFollowPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 56.0.s / 2,
              child: profileImageUrl,
            ),
            Spacing.spacingW16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        username,
                        style: context.theme.textTheme.headlineMedium
                            ?.copyWith(color: DefaultPalette.kDarkGreen),
                      ),
                      OutlinedButton(
                        onPressed: onFollowPressed,
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0.s, vertical: 4.0.s),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          "Follow",
                          style: context.theme.textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    postText,
                    style: context.theme.textTheme.titleLarge
                        ?.copyWith(color: DefaultPalette.kDarkGreen),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
