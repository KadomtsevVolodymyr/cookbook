import 'package:balancebyte/extensions/num.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isTransparentCheckbox;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    this.isTransparentCheckbox = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: isTransparentCheckbox
          ? (!value
              ? Assets.icons.checkBoxTrnperent.svg(width: 16.0.s)
              : Assets.icons.checkBoxState2.svg(width: 16.0.s))
          : (!value
              ? Assets.icons.checkBoxFalse.svg()
              : Assets.icons.checkBoxTrue.svg()),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final bool selected;
  final ValueChanged<bool> onChanged;

  const CustomRadioButton({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!selected),
      child: !selected
          ? Assets.icons.radioCheck.svg()
          : Assets.icons.radioCheckTrue.svg(),
    );
  }
}
