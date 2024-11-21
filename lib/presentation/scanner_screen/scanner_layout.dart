import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/account_screen/account_screen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ScannerLayout extends StatefulWidget {
  const ScannerLayout({super.key});

  @override
  State<ScannerLayout> createState() => _ScannerLayoutState();
}

class _ScannerLayoutState extends State<ScannerLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Scanner',
        icon: Assets.icons.profile.svg(),
        onIconTap: () => PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const AccountScreen(),
        ),
      ),
      body: SingleChildScrollView(
        child: ScreenSideOffset.large(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScannerItemsSection(),
              Spacing.spacing40,
              CustomButton.shadowed(
                prefixIcon: Assets.icons.scannerNavActive
                    .svg(color: DefaultPalette.white),
                text: Text(
                  "Scanner",
                  style: context.theme.textTheme.headlineMedium,
                ),
                onPressed: () {},
              ),
              Spacing.spacing24,
              Center(child: AddManuallyLink()),
              const SizedBox(height: 16),
              NonAvailableItemsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ScannerItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) => ScannerItem(),
      ),
    );
  }
}

class ScannerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete, color: Colors.red),
        ),
        const SizedBox(width: 12),
        Text(
          'Juice',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        QuantityAdjuster(),
      ],
    );
  }
}

class AddManuallyLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Add manually',
        style: TextStyle(
          fontSize: 16,
          color: DefaultPalette.grey,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class NonAvailableItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Non Available',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: List.generate(
            3,
            (index) => NonAvailableItem(),
          ),
        ),
      ],
    );
  }
}

class NonAvailableItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: DefaultPalette.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Text(
              'Juice',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            QuantityAdjuster(isEnabled: false),
          ],
        ),
      ),
    );
  }
}

class QuantityAdjuster extends StatelessWidget {
  final bool isEnabled;

  QuantityAdjuster({this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: isEnabled ? () {} : null,
          icon: Icon(
            Icons.remove,
            color: DefaultPalette.inactiveTextColor,
          ),
          iconSize: 20,
        ),
        DropdownButton<String>(
          value: '1 ml',
          items: ['1 ml', '5 ml', '10 ml'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: isEnabled ? (String? newValue) {} : null,
        ),
        IconButton(
          onPressed: isEnabled ? () {} : null,
          icon: Icon(
            Icons.add,
            color: DefaultPalette.inactiveTextColor,
          ),
          iconSize: 20,
        ),
      ],
    );
  }
}
