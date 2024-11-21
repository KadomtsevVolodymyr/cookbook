import 'package:camera/camera.dart';
import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/atoms/custom_container.dart';
import 'package:balancebyte/widgets/molecules/focus_point.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:balancebyte/widgets/organisms/zoom_controls.dart';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  final CameraController cameraController;
  final bool isCameraVisible;
  final VoidCallback onClose;
  final VoidCallback onToggleFlash;
  final VoidCallback onFlipCamera;
  final VoidCallback onPickImageFromGallery;
  final VoidCallback onCapturePhoto;
  final FlashMode currentFlashMode;
  final double currentZoomLevel;
  final Function(double zoomLevel) setZoom;
  final Offset? focusPoint;
  final bool isFocusing;
  final Function(TapDownDetails details, BoxConstraints constraints)
      onViewFinderTap;
  final Function(ScaleStartDetails details) onScaleStart;
  final Function(ScaleUpdateDetails details) onScaleUpdate;

  const CameraView({
    required this.cameraController,
    required this.isCameraVisible,
    required this.onClose,
    required this.onToggleFlash,
    required this.onFlipCamera,
    required this.onPickImageFromGallery,
    required this.onCapturePhoto,
    required this.currentFlashMode,
    required this.currentZoomLevel,
    required this.setZoom,
    required this.isFocusing,
    required this.onViewFinderTap,
    required this.onScaleStart,
    required this.onScaleUpdate,
    super.key,
    this.focusPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              AnimatedOpacity(
                opacity: isCameraVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: CameraPreview(cameraController),
                    );
                  },
                ),
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onScaleStart: onScaleStart,
                    onScaleUpdate: onScaleUpdate,
                    onTapDown: (TapDownDetails details) =>
                        onViewFinderTap(details, constraints),
                  );
                },
              ),
              Positioned(
                left: 24.0.s,
                child: SafeArea(
                  child: GestureDetector(
                    onTap: onClose,
                    child: CustomContainer(
                      child: Assets.icons.closeCamera.svg(),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 24.0.s,
                child: SafeArea(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onToggleFlash,
                    child: currentFlashMode == FlashMode.off
                        ? Assets.icons.lightningOff.svg(
                            width: 17.0.s,
                            height: 22.5.s,
                            color: DefaultPalette.white,
                          )
                        : Assets.icons.lightningOn.svg(
                            width: 17.0.s,
                            height: 22.5.s,
                            color: DefaultPalette.white,
                          ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0.s,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    ZoomControls(
                      currentZoomLevel: currentZoomLevel,
                      setZoom: setZoom,
                    ),
                  ],
                ),
              ),
              if (isFocusing && focusPoint != null)
                FocusPoint(
                  position: focusPoint!,
                ),
            ],
          ),
        ),
        Container(
          color: Colors.black,
          height: 130.0.s,
          child: ScreenSideOffset.large(
            child: Padding(
              padding: EdgeInsets.only(top: 16.0.s),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onPickImageFromGallery,
                    child:
                        Assets.icons.gallery.svg(width: 40.0.s, height: 40.0.s),
                  ),
                  GestureDetector(
                    onTap: onCapturePhoto,
                    child:
                        Assets.icons.shutter.svg(width: 56.0.s, height: 56.0.s),
                  ),
                  GestureDetector(
                    onTap: onFlipCamera,
                    child: Assets.icons.cameraFlip
                        .svg(width: 40.0.s, height: 40.0.s),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
