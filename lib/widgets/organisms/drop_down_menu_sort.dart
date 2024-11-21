import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownMenuSort extends StatefulWidget {
  final String selectedHintText;
  final Widget? selectedIcon;
  final List<String> dropDownItems;
  final Function(String?) onChanged;
  final bool isDropdownOpen;
  final Function(bool) onMenuStateChange;

  const DropdownMenuSort({
    required this.selectedHintText,
    required this.dropDownItems,
    required this.onChanged,
    required this.isDropdownOpen,
    required this.onMenuStateChange,
    super.key,
    this.selectedIcon,
  });

  @override
  DropdownMenuSortState createState() => DropdownMenuSortState();
}

class DropdownMenuSortState extends State<DropdownMenuSort> {
  String? _selectedItem;
  final spacingW10 = SizedBox(width: 10.0.s);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Text(
              "Sort: ",
              style: context.theme.textTheme.displayMedium?.copyWith(
                color: DefaultPalette.inactiveTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Text(
                widget.selectedHintText,
                style: context.theme.textTheme.displayMedium?.copyWith(
                  color: DefaultPalette.kDarkGreen,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.dropDownItems
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _selectedItem == item
                        ? DefaultPalette.inactiveTextColor
                        : Colors.transparent,
                    border: const Border(
                      bottom: BorderSide(
                        color: DefaultPalette.backgroundFormColor,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.0.s,
                          top: 14.0.s,
                          right: 20.0.s,
                          bottom: 16.0.s,
                        ),
                        child: Row(
                          children: [
                            Text(
                              item,
                              style: context.theme.textTheme.displayMedium
                                  ?.copyWith(
                                color: DefaultPalette.kDarkGreen,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (String? newItem) {
          setState(() {
            if (_selectedItem == newItem) {
              _selectedItem = null;
              widget.onChanged(null);
            } else {
              _selectedItem = newItem;
              widget.onChanged(newItem);
            }
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50.0.s,
          padding: EdgeInsets.only(left: 14.0.s, right: 14.0.s),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0.s),
            color: DefaultPalette.backgroundFormColor,
          ),
          elevation: 0,
        ),
        iconStyleData: IconStyleData(
          icon: widget.isDropdownOpen
              ? Assets.icons.arrowTop.svg()
              : Assets.icons.arrowBottom.svg(),
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          maxHeight: 216.0.s,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            boxShadow: const [
              DefaultShadowPalette.secondaryShadow,
              DefaultShadowPalette.thirdShadow,
            ],
            borderRadius: BorderRadius.circular(14.0.s),
            color: DefaultPalette.white,
          ),
          offset: const Offset(0, -12),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(0),
            thumbVisibility: WidgetStateProperty.all<bool>(false),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.zero,
          height: 56.0.s,
        ),
        onMenuStateChange: widget.onMenuStateChange,
      ),
    );
  }
}
