import 'package:auto_route/auto_route.dart';
import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/navigation/app_router.dart';
import 'package:cookbook/widgets/molecules/country_picker.dart';
import 'package:cookbook/widgets/molecules/custom_button.dart';
import 'package:cookbook/widgets/molecules/custom_form_field.dart';
import 'package:cookbook/widgets/molecules/scrollable_decorated_container.dart';
import 'package:cookbook/widgets/organisms/custom_checkbox_list.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:cookbook/widgets/organisms/yes_no_selection.dart';
import 'package:flutter/material.dart';

class SetUpFifth extends StatefulWidget {
  const SetUpFifth({required this.onNext, required this.onSkip, super.key});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<SetUpFifth> createState() => _SetUpFifthState();
}

class _SetUpFifthState extends State<SetUpFifth> {
  Map<String, bool> notificationsOptions = {
    "Meal prep reminders": false,
    "New recipes": false,
    "Fitness tips": false,
    "Weekly progress": false,
  };

  final TextEditingController countryController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  final spacing10 = SizedBox(height: 10.0.s);
  final spacing12 = SizedBox(height: 12.0.s);
  final spacing24 = SizedBox(height: 24.0.s);
  final spacing40 = SizedBox(height: 40.0.s);
  final padding24 = EdgeInsets.symmetric(vertical: 24.0.s);
  final paddingBottom20 = EdgeInsets.only(bottom: 20.0.s);
  final paddingBottom10 = EdgeInsets.only(bottom: 10.0.s);
  final paddingBottom4 = EdgeInsets.only(bottom: 4.0.s);
  final paddingAll20 = EdgeInsets.all(20.0.s);

  @override
  Widget build(BuildContext context) {
    return ScrollableDecoratedContainer(
      child: ScreenSideOffset.large(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacing24,
            Padding(
              padding: paddingBottom4,
              child: Text(
                'Would you like meal prep reminders?',
                style: context.theme.textTheme.headlineMedium?.copyWith(
                  color: DefaultPalette.kDarkGreen,
                ),
              ),
            ),
            Padding(
              padding: paddingBottom10,
              child: Text(
                "Possible to choose one only",
                style: context.theme.textTheme.labelSmall?.copyWith(
                  color: DefaultPalette.inactiveTextColor,
                ),
              ),
            ),
            spacing10,
            const YesNoSelection(),
            spacing24,
            CountryDropdownSearch(
              onCountrySelected: (Country) {},
            ),
            spacing12,
            Padding(
              padding: paddingBottom10,
              child: Text(
                "Select your time zone and region. This helps us send meal plan reminders and suggest local recipes.",
                style: context.theme.textTheme.labelSmall?.copyWith(
                  color: DefaultPalette.inactiveTextColor,
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFF7F8F8),
                  width: 1.0,
                ),
                gradient: const LinearGradient(
                  end: Alignment(-4, -0.2),
                  begin: Alignment(3, -0.08),
                  colors: [
                    Color.fromRGBO(
                      117,
                      219,
                      126,
                      0.2,
                    ),
                    Color.fromRGBO(0, 205, 172, 0.2),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Padding(
                padding: paddingAll20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: paddingBottom10,
                      child: Text(
                        'Push Notifications',
                        style: context.theme.textTheme.headlineMedium?.copyWith(
                          color: DefaultPalette.kDarkGreen,
                        ),
                      ),
                    ),
                    CustomCheckboxList(
                      isTransparentCheckbox: true,
                      selectedOptions: notificationsOptions,
                      onChanged: (newOptions) {
                        setState(() {
                          notificationsOptions = newOptions;
                        });
                      },
                      textController: textController,
                    ),
                    Text(
                      "Choose the types of notifications you want to receive. We’ll keep you updated with reminders, tips, and new content.",
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        color: DefaultPalette.inactiveTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            spacing24,
            CustomButton.shadowed(
              text: Text(
                "Next",
                style: context.theme.textTheme.headlineMedium,
              ),
              onPressed: () {
                context.router.replaceAll([const ConnectHealthAppRoute()]);
              },
            ),
            spacing24,
            _skipText(context),
            spacing40,
          ],
        ),
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
