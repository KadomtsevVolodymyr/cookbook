import 'package:cookbook/generated/assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final SvgGenImage icon;
}
