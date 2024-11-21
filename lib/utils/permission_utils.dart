import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  /// Requests camera permission
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();

    if (status.isGranted) {
      return true; // Permission granted
    } else if (status.isPermanentlyDenied) {
      await openAppSettings(); // Open settings for permanently denied permissions
    }
    return false; // Permission denied
  }
}
