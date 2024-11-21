import 'dart:developer';

import 'package:balancebyte/data/services/camera_service.dart';
import 'package:balancebyte/widgets/pages/camera_view.dart';
import 'package:balancebyte/widgets/pages/preview_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CameraLayout extends StatefulWidget {
  const CameraLayout({super.key});

  @override
  State<CameraLayout> createState() => _CameraLayoutState();
}

class _CameraLayoutState extends State<CameraLayout> {
  final CameraService _cameraService = CameraService();
  XFile? _capturedPhoto;
  bool _isCameraVisible = true;
  double _baseScale = 1.0;
  Offset? _focusPoint;
  bool _isFocusing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    await _cameraService.initializeCamera();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraService.isCameraInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: _capturedPhoto == null
          ? CameraView(
              cameraController: _cameraService.cameraController,
              isCameraVisible: _isCameraVisible,
              onClose: () => PersistentNavBarNavigator.pop(context),
              onToggleFlash: _toggleFlash,
              onFlipCamera: _flipCamera,
              onPickImageFromGallery: _pickImageFromGallery,
              onCapturePhoto: _capturePhoto,
              currentFlashMode: _cameraService.currentFlashMode,
              currentZoomLevel: _cameraService.currentZoomLevel,
              setZoom: _setZoomLevel,
              focusPoint: _focusPoint,
              isFocusing: _isFocusing,
              onViewFinderTap: _onViewFinderTap,
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
            )
          : PreviewView(
              photoPath: _capturedPhoto!.path,
              onClose: () => setState(() => _capturedPhoto = null),
              onPublish: () {
                // Handle publish action
              },
            ),
    );
  }

  Future<void> _toggleFlash() async {
    await _cameraService.toggleFlash();
    setState(() {});
  }

  Future<void> _flipCamera() async {
    setState(() => _isCameraVisible = false);

    await Future.delayed(const Duration(milliseconds: 300));

    await _cameraService.flipCamera();
    setState(() => _isCameraVisible = true);
  }

  Future<void> _capturePhoto() async {
    final photo = await _cameraService.capturePhoto();
    if (photo != null) {
      setState(() => _capturedPhoto = photo);
    }
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() => _capturedPhoto = image);
    }
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _cameraService.currentZoomLevel;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    final newZoomLevel = (_baseScale * details.scale).clamp(
      _cameraService.minAvailableZoom,
      5.0,
    );
    _cameraService.setZoomLevel(newZoomLevel);
    setState(() {});
  }

  void _onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    final cameraController = _cameraService.cameraController;
    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );

    try {
      cameraController.setExposurePoint(offset);
      cameraController.setFocusPoint(offset);
    } catch (e) {
      log("Error setting focus/exposure point: $e");
    }

    setState(() {
      _focusPoint = details.localPosition;
      _isFocusing = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() => _isFocusing = false);
    });
  }

  Future<void> _setZoomLevel(double zoomLevel) async {
    await _cameraService.setZoomLevel(zoomLevel);
    setState(() {});
  }

  @override
  void dispose() {
    _cameraService.dispose();
    super.dispose();
  }
}
