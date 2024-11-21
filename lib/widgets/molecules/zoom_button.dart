import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({
    required double currentZoomLevel,
    required this.label,
    required this.onTap,
    required this.zoom,
    super.key,
  }) : _currentZoomLevel = currentZoomLevel;

  final double _currentZoomLevel;
  final double zoom;
  final String label;
  final Function(double) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(zoom),
      child: Container(
        width: _currentZoomLevel == zoom ? 26.0.s : 20.0.s,
        padding: EdgeInsets.all(6.0.s),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.35),
        ),
        child: Text(
          _currentZoomLevel == zoom ? "${label}x" : label,
          style: TextStyle(
            color: _currentZoomLevel == zoom
                ? DefaultPalette.activeNavColor
                : DefaultPalette.kDarkGreen,
            fontSize: _currentZoomLevel == zoom ? 12 : 8,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
