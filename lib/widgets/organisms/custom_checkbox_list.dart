import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/widgets/molecules/custom_checkbox.dart';
import 'package:flutter/material.dart';

class CustomCheckboxList extends StatefulWidget {
  final Map<String, bool> selectedOptions;
  final ValueChanged<Map<String, bool>> onChanged;

  final TextEditingController? textController;
  final bool isTransparentCheckbox;
  final bool isRadio;

  const CustomCheckboxList({
    required this.selectedOptions,
    required this.onChanged,
    this.isRadio = false,
    this.textController,
    this.isTransparentCheckbox = true,
    super.key,
  });

  @override
  CustomCheckboxListState createState() => CustomCheckboxListState();
}

class CustomCheckboxListState extends State<CustomCheckboxList> {
  String? selectedRadioOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.selectedOptions.keys.map((option) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.0.s),
            child: Row(
              children: [
                if (widget.isRadio)
                  CustomRadioButton(
                    selected: selectedRadioOption == option,
                    onChanged: (bool selected) {
                      setState(() {
                        selectedRadioOption = selected ? option : null;
                      });
                      widget.onChanged({
                        ...widget.selectedOptions,
                        option: selected,
                      });
                    },
                  )
                else
                  CustomCheckbox(
                    value: widget.selectedOptions[option] ?? false,
                    onChanged: (bool newValue) {
                      widget.onChanged({
                        ...widget.selectedOptions,
                        option: newValue,
                      });
                    },
                    isTransparentCheckbox: widget.isTransparentCheckbox,
                  ),
                SizedBox(width: 12.0.s),
                Text(
                  option,
                  style: context.theme.textTheme.displayMedium?.copyWith(
                    color: DefaultPalette.kDarkGreen,
                  ),
                ),
              ],
            ),
          );
        }),
        if (widget.selectedOptions.containsKey('Others:') ||
            widget.selectedOptions.containsKey('Custom Diet:'))
          SizedBox(
            height: 35.0.s,
            child: TextField(
              controller: widget.textController,
              cursorColor: DefaultPalette.borderColor,
              style: context.theme.textTheme.titleLarge
                  ?.copyWith(color: DefaultPalette.kDarkGreen),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 0.0.s, bottom: 10.0.s),
                labelText: 'Type Here',
                labelStyle: context.theme.textTheme.titleLarge
                    ?.copyWith(color: DefaultPalette.inactiveTextColor),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: const UnderlineInputBorder(),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: DefaultPalette.borderColor),
                ),
              ),
              enabled: widget.selectedOptions['Others:'] ?? false,
            ),
          ),
      ],
    );
  }
}
