import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String name;
  final String quantity;

  const IngredientItem({
    required this.name,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: DefaultPalette.kDarkGreen,
                ),
          ),
          Text(
            quantity,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: DefaultPalette.inactiveTextColor,
                ),
          ),
        ],
      ),
    );
  }
}
