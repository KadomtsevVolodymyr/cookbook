import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:balancebyte/utils/image_utils.dart';

class CameraService {
  late CameraController _cameraController;
  List<CameraDescription> _cameras = [];
  bool isRearCamera = true;
  bool isCameraInitialized = false;
  double currentZoomLevel = 1.0;
  double minAvailableZoom = 1.0;
  double maxAvailableZoom = 1.0;
  FlashMode currentFlashMode = FlashMode.off;

  CameraController get cameraController => _cameraController;

  Future<void> initializeCamera({bool useRearCamera = true}) async {
    try {
      _cameras = await availableCameras();

      if (_cameras.isEmpty) {
        throw Exception("No cameras found");
      }

      final selectedCamera = useRearCamera ? _cameras[0] : _cameras[1];

      _cameraController = CameraController(
        selectedCamera,
        ResolutionPreset.ultraHigh,
      );

      await _cameraController.initialize();

      await _cameraController.setFlashMode(FlashMode.off);
      isCameraInitialized = true;

      minAvailableZoom = await _cameraController.getMinZoomLevel();
      maxAvailableZoom = await _cameraController.getMaxZoomLevel();
      print(maxAvailableZoom);
    } catch (e) {
      log("Error initializing camera: $e");
    }
  }

  Future<void> flipCamera() async {
    if (_cameras.length < 2) return;

    await _cameraController.dispose();

    isRearCamera = !isRearCamera;
    await initializeCamera(useRearCamera: isRearCamera);
    await _cameraController.setFlashMode(FlashMode.off);
    currentFlashMode = FlashMode.off;
  }

  Future<void> toggleFlash() async {
    if (isRearCamera) {
      currentFlashMode = _cameraController.value.flashMode == FlashMode.torch
          ? FlashMode.off
          : FlashMode.torch;
    } else {
      currentFlashMode = _cameraController.value.flashMode == FlashMode.always
          ? FlashMode.off
          : FlashMode.always;
    }
    await _cameraController.setFlashMode(currentFlashMode);
  }

  Future<XFile?> capturePhoto() async {
    if (!isCameraInitialized) return null;

    try {
      final photo = await _cameraController.takePicture();
      return isRearCamera ? photo : await ImageUtils.flipCapturedPhoto(photo);
    } catch (e) {
      log("Error capturing photo: $e");
      return null;
    }
  }

  Future<void> setZoomLevel(double zoomLevel) async {
    if (zoomLevel < minAvailableZoom || zoomLevel > maxAvailableZoom) return;

    await _cameraController.setZoomLevel(zoomLevel);
    currentZoomLevel = zoomLevel;
  }

  Future<void> dispose() async {
    if (isCameraInitialized) {
      await _cameraController.dispose();
    }
  }
}
