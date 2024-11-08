import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/molecules/custom_button.dart';
import 'package:cookbook/widgets/molecules/scrollable_decorated_container.dart';
import 'package:cookbook/widgets/organisms/custom_checkbox_list.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class SetUpThird extends StatefulWidget {
  const SetUpThird({required this.onNext, required this.onSkip, super.key});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<SetUpThird> createState() => _SetUpThirdState();
}

class _SetUpThirdState extends State<SetUpThird> {
  Map<String, bool> healthGoals = {
    "Weight Management": false,
    "Muscle Building & Strength": false,
    "Improve Overall Health": false,
    "Cardiovascular Health": false,
    "Endurance & Stamina": false,
    "Nutrition Goals": false,
    "Immune Support": false,
    "Disease Management": false,
    "Healthy Aging": false,
    "Mental Wellness & Stress Relief": false,
  };

  final TextEditingController nameController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  final spacing24 = SizedBox(height: 24.0.s);
  final spacing40 = SizedBox(height: 40.0.s);
  final padding24 = EdgeInsets.symmetric(vertical: 24.0.s);
  final paddingBottom20 = EdgeInsets.only(bottom: 20.0.s);
  final paddingBottom10 = EdgeInsets.only(bottom: 10.0.s);
  final paddingBottom4 = EdgeInsets.only(bottom: 4.0.s);

  @override
  Widget build(BuildContext context) {
    return ScrollableDecoratedContainer(
      child: Column(
        children: [
          Assets.images.healthGoal.image(
            fit: BoxFit.cover,
            height: 250.0.s,
            width: double.infinity,
          ),
          ScreenSideOffset.large(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacing24,
                Padding(
                  padding: paddingBottom4,
                  child: Text(
                    'What is your dietary preference?',
                    style: context.theme.textTheme.headlineMedium?.copyWith(
                      color: DefaultPalette.kDarkGreen,
                    ),
                  ),
                ),
                Padding(
                  padding: paddingBottom10,
                  child: Text(
                    "Possible to choose a variety",
                    style: context.theme.textTheme.labelSmall?.copyWith(
                      color: DefaultPalette.inactiveTextColor,
                    ),
                  ),
                ),
                CustomCheckboxList(
                  selectedOptions: healthGoals,
                  onChanged: (newOptions) {
                    setState(() {
                      healthGoals = newOptions;
                    });
                  },
                  textController: textController,
                ),
                spacing24,
                CustomButton.shadowed(
                  text: Text(
                    "Next",
                    style: context.theme.textTheme.headlineMedium,
                  ),
                  onPressed: widget.onNext,
                ),
                spacing24,
                _skipText(context),
                spacing40,
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _skipText(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSkip,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Skip',
            style: context.theme.textTheme.headlineMedium?.copyWith(
              decoration: TextDecoration.underline,
              color: DefaultPalette.kDarkGreen,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
