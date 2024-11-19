import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/data/model/menu_item.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:cookbook/widgets/molecules/custom_dropdown_menu.dart';
import 'package:flutter/material.dart';

class FilterOptions extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<MenuItem> dropDownItems;
  final String initialHintText;

  const FilterOptions({
    required this.scaffoldKey,
    required this.dropDownItems,
    required this.initialHintText,
    super.key,
  });

  @override
  FilterOptionsState createState() => FilterOptionsState();
}

class FilterOptionsState extends State<FilterOptions> {
  late String selectedHintText;
  Widget? selectedIcon;
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    selectedHintText = widget.initialHintText;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => widget.scaffoldKey.currentState?.openDrawer(),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 18.0.s,
              vertical: 12.0.s,
            ),
            backgroundColor: DefaultPalette.activeNavColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0.s),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.filter.svg(),
              Spacing.spacingW10,
              Text(
                "Filters",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        Spacing.spacingW12,
        Expanded(
          child: CustomDropdownMenu(
            selectedHintText: selectedHintText,
            selectedIcon: selectedIcon,
            dropDownItems: widget.dropDownItems,
            isDropdownOpen: isDropdownOpen,
            onChanged: (value) {
              setState(() {
                if (value == null) {
                  selectedHintText = widget.initialHintText;
                  selectedIcon = null;
                } else {
                  selectedHintText = value.text;
                  selectedIcon =
                      value.icon.svg(color: DefaultPalette.inactiveTextColor);
                }
                isDropdownOpen = false;
              });
            },
            onMenuStateChange: (isOpen) {
              setState(() {
                isDropdownOpen = isOpen;
              });
            },
          ),
        ),
      ],
    );
  }
}
