import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:cookbook/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  // Holds the list of all filters (categories and their options).
  final Map<String, List<String>> filters;

  // Stores the currently selected filters by category.
  final Map<String, Set<String>> selectedFilters;

  final VoidCallback onApplyFilters;

  const FilterDrawer({
    required this.filters,
    required this.selectedFilters,
    required this.onApplyFilters,
    super.key,
  });

  @override
  FilterDrawerState createState() => FilterDrawerState();
}

class FilterDrawerState extends State<FilterDrawer> {
  late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    // Initializes all categories as collapsed by default.
    isExpandedList = List<bool>.filled(widget.filters.keys.length, false);
  }

  // Toggles the selection of an option within a category.
  void _toggleSelection(String category, String option) {
    setState(() {
      if (widget.selectedFilters[category]?.contains(option) ?? false) {
        widget.selectedFilters[category]?.remove(option);
      } else {
        widget.selectedFilters[category]?.add(option);
      }
    });
  }

  // Deselects all options in each category.
  void _deselectAllCategories() {
    setState(() {
      widget.selectedFilters.forEach((category, options) {
        options.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      width: 295.0.s,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 18.0.s, left: 22.0.s),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter',
                          style: context.theme.textTheme.headlineLarge
                              ?.copyWith(color: DefaultPalette.kDarkGreen),
                        ),
                        // Close button to dismiss the drawer
                        GestureDetector(
                          child: Assets.icons.close.svg(),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),

                  // Dynamically generated filter categories
                  ...widget.filters.keys.toList().asMap().entries.map((entry) {
                    final int index = entry.key;
                    final String category = entry.value;

                    return ScreenSideOffset.large(
                      child: Container(
                        padding: EdgeInsets.only(top: 20.0.s, bottom: 12.0.s),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF3F4F4),
                            ),
                          ),
                        ),
                        child: ExpansionTile(
                          childrenPadding: EdgeInsets.zero,
                          tilePadding: EdgeInsets.zero,
                          minTileHeight: 0,
                          shape: const Border(),
                          onExpansionChanged: (expanded) {
                            // Updates expansion state for the category.
                            setState(() => isExpandedList[index] = expanded);
                          },
                          trailing: isExpandedList[index]
                              ? Assets.icons.arrowTop.svg()
                              : Assets.icons.arrowBottom.svg(),
                          title: Text(
                            category,
                            style: context.theme.textTheme.headlineMedium
                                ?.copyWith(color: DefaultPalette.kDarkGreen),
                          ),
                          children: [
                            SizedBox(height: 5.0.s),
                            Column(
                              children: [
                                ...widget.filters[category]!.map(
                                  (option) => _buildCheckboxTile(
                                    category,
                                    option,
                                    context,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 12.0.s),
                ],
              ),
            ),
            // Footer section with Clear and View Results buttons
            Container(
              width: MediaQuery.of(context).size.width,
              height: 98.0.s,
              decoration: const BoxDecoration(
                color: DefaultPalette.white,
                boxShadow: [DefaultShadowPalette.fourthShadow],
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0.s),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Clear button to remove all selected filters
                    ElevatedButton(
                      onPressed: _deselectAllCategories,
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: DefaultPalette.activeNavColor,
                        ),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.0.s,
                          vertical: 12.0.s,
                        ),
                        backgroundColor: DefaultPalette.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0.s),
                        ),
                      ),
                      child: Text(
                        "Clear",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: DefaultPalette.activeNavColor),
                      ),
                    ),
                    SizedBox(width: 8.0.s),
                    ElevatedButton(
                      onPressed: () {
                        widget.onApplyFilters();
                        Navigator.of(context).pop();
                      },
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
                      child: Text(
                        "View Results",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds a custom checkbox tile for each filter option.
  Widget _buildCheckboxTile(
    String category,
    String option,
    BuildContext context,
  ) {
    final isSelected =
        widget.selectedFilters[category]?.contains(option) ?? false;

    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.s),
      child: GestureDetector(
        onTap: () => _toggleSelection(category, option),
        child: Row(
          children: [
            if (isSelected)
              Assets.icons.checkBoxState2.svg(width: 16.0.s)
            else
              Assets.icons.checkBoxTrnperent.svg(width: 16.0.s),
            SizedBox(width: 12.0.s),
            Text(
              option,
              style: context.theme.textTheme.displayMedium
                  ?.copyWith(color: DefaultPalette.kDarkGreen),
            ),
          ],
        ),
      ),
    );
  }
}
