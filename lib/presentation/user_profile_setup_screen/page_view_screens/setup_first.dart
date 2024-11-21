import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/data/model/user_settings.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/presentation/auth/cubit/auth_cubit.dart';
import 'package:balancebyte/presentation/user_profile_setup_screen/cubit/user_profile_set_up_cubit.dart';
import 'package:balancebyte/utils/diet_utils.dart';
import 'package:balancebyte/utils/image_picker.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/molecules/custom_form_field.dart';
import 'package:balancebyte/widgets/molecules/photo_upload_widget.dart';
import 'package:balancebyte/widgets/molecules/scrollable_decorated_container.dart';
import 'package:balancebyte/widgets/organisms/custom_checkbox_list.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetUpFirst extends StatefulWidget {
  const SetUpFirst({required this.onNext, required this.onSkip, super.key});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<SetUpFirst> createState() => _SetUpFirstState();
}

class _SetUpFirstState extends State<SetUpFirst> {
  String? _imagePath;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePickerUtil.pickImage();
    if (pickedFile != null) {
      final filePath = pickedFile.path;
      setState(() {
        _imagePath = pickedFile.path;
      });
      await context
          .read<UserProfileSetUpCubit>()
          .uploadAvatar(filePath: filePath);
    }
  }

  Map<String, bool> selectedOptions = {
    'Dairy': false,
    'Gluten': false,
    'Nuts': false,
    'Soy': false,
    'Shellfish': false,
    'Others:': false,
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
      isShadow: true,
      child: ScreenSideOffset.large(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: PhotoUploadWidget(
                onTap: _pickImage,
                imagePath: _imagePath,
              ),
            ),
            Padding(
              padding: padding24,
              child: CustomFormField.username(
                label: 'Name',
                controller: nameController,
              ),
            ),
            Padding(
              padding: paddingBottom4,
              child: Text(
                'Do you have any allergies or intolerances? ',
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
              selectedOptions: selectedOptions,
              onChanged: (newOptions) {
                setState(() {
                  selectedOptions = newOptions;
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
              onPressed: () {
                final userSettings =
                    UserSettings.fromSelectedOptions(selectedOptions);
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
