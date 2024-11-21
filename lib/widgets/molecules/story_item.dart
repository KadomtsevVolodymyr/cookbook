import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/presentation/forum/add_story_screen/add_story_screen.dart';
import 'package:balancebyte/widgets/atoms/add_story_button.dart';
import 'package:balancebyte/widgets/atoms/story_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class StoryItem extends StatelessWidget {
  final Widget? imageUrl;
  final bool isAddButton;

  const StoryItem({
    this.imageUrl,
    this.isAddButton = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      colors: [
        Color(0xFF18593F),
        Color(0xFF75DB7E),
      ],
      begin: Alignment(-0.83, 0),
      end: Alignment(1.42, 0),
    );

    final double padding = 2.0.s;
    final double borderRadius = 10.0.s;

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(padding),
      child: isAddButton
          ? GestureDetector(
              onTap: () => PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const AddStoryScreen(),
              ),
              child: const AddStoryButton(),
            )
          : StoryImage(imageUrl: imageUrl!),
    );
  }
}
