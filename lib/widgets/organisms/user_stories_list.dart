import 'package:balancebyte/extensions/num.dart';
import 'package:balancebyte/widgets/molecules/story_item.dart';
import 'package:flutter/material.dart';

class UserStoriesList extends StatelessWidget {
  final List<Widget> userImages;

  const UserStoriesList({required this.userImages, super.key});

  @override
  Widget build(BuildContext context) {
    final double storyGap = 8.0.s;

    return SizedBox(
      height: 76.0.s,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: userImages.length + 1,
        separatorBuilder: (context, index) => SizedBox(width: storyGap),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const StoryItem(isAddButton: true);
          }
          return StoryItem(imageUrl: userImages[index - 1]);
        },
      ),
    );
  }
}
