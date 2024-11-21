import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/widgets/molecules/custom_checkbox.dart';
import 'package:flutter/material.dart';

class YesNoSelection extends StatefulWidget {
  final bool? initialValue;

  const YesNoSelection({
    super.key,
    this.initialValue,
  });

  @override
  State<YesNoSelection> createState() => _YesNoSelectionState();
}

class _YesNoSelectionState extends State<YesNoSelection> {
  bool? isSelectedYes;

  @override
  void initState() {
    super.initState();
    isSelectedYes = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRadioButton(
          selected: isSelectedYes == true,
          onChanged: (isSelected) {
            setState(() {
              isSelectedYes = isSelected ? true : null;
            });
          },
        ),
        SizedBox(width: 12.0.s),
        Text(
          'Yes',
          style: context.theme.textTheme.displayMedium?.copyWith(
            color: DefaultPalette.kDarkGreen,
          ),
        ),
        SizedBox(width: 42.0.s),
        CustomRadioButton(
          selected: isSelectedYes == false,
          onChanged: (isSelected) {
            setState(() {
              isSelectedYes = isSelected ? false : null;
            });
          },
        ),
        SizedBox(width: 12.0.s),
        Text(
          'No',
          style: context.theme.textTheme.displayMedium?.copyWith(
            color: DefaultPalette.kDarkGreen,
          ),
        ),
      ],
    );
  }
}
