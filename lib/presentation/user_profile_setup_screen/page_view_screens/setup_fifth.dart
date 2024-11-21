import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/data/model/user_settings.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/navigation/app_router.dart';
import 'package:balancebyte/presentation/user_profile_setup_screen/cubit/user_profile_set_up_cubit.dart';
import 'package:balancebyte/utils/diet_utils.dart';
import 'package:balancebyte/widgets/molecules/country_picker.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/molecules/gradient_container.dart';
import 'package:balancebyte/widgets/molecules/scrollable_decorated_container.dart';
import 'package:balancebyte/widgets/organisms/custom_checkbox_list.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:balancebyte/widgets/organisms/yes_no_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            GradientContainer(
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
            spacing24,
            CustomButton.shadowed(
              text: Text(
                "Next",
                style: context.theme.textTheme.headlineMedium,
              ),
              onPressed: () {
                final userSettings =
                    UserSettings.fromSelectedOptions(notificationsOptions);
                print(userSettings);
                context.read<UserProfileSetUpCubit>().setDiet(userSettings);
                widget.onNext();
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
