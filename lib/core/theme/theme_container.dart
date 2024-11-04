import 'package:cookbook/core/theme/solution_theme.dart';
import 'package:cookbook/core/theme/theme_vendor_one.dart';

abstract class ThemeFactory {
  static SolutionTheme get lightTheme => _vendorTheme.lightTheme;

  static final _vendorTheme1 = ThemeContainer(VendorThemeOneLight());

  static final _defaultVendorTheme = _vendorTheme1;

  static ThemeContainer get _vendorTheme {
    return _defaultVendorTheme;
  }
}

class ThemeContainer {
  final SolutionTheme lightTheme;

  ThemeContainer(this.lightTheme);
}
