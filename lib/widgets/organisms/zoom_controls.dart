import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/widgets/molecules/zoom_button.dart';
import 'package:flutter/material.dart';

class ZoomControls extends StatelessWidget {
  const ZoomControls({
    required double currentZoomLevel,
    required this.setZoom,
    super.key,
  }) : _currentZoomLevel = currentZoomLevel;

  final double _currentZoomLevel;
  final Function(double p1) setZoom;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.25.s, vertical: 2.25.s),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomButton(
              currentZoomLevel: _currentZoomLevel,
              label: "1",
              onTap: setZoom,
              zoom: 1.0,
            ),
            SizedBox(
              width: 5.0.s,
            ),
            ZoomButton(
              currentZoomLevel: _currentZoomLevel,
              label: "2",
              onTap: setZoom,
              zoom: 2.0,
            ),
            SizedBox(
              width: 5.0.s,
            ),
            ZoomButton(
              currentZoomLevel: _currentZoomLevel,
              label: "3",
              onTap: setZoom,
              zoom: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
