import 'package:health/health.dart';

class HealthPermissionUtil {
  /// Requests permission for the specified [types].
  /// Returns `true` if permission was granted, `false` otherwise.
  static Future<bool> requestPermission(List<HealthDataType> types) async {
    return Health().requestAuthorization(types);
  }

  /// Provides a preset of commonly requested health data types, with support for future additions.
  static List<HealthDataType> get defaultTypes => [
        // HealthDataType.STEPS,
        // HealthDataType.BLOOD_GLUCOSE,
        // HealthDataType.ATRIAL_FIBRILLATION_BURDEN,
        // HealthDataType.AUDIOGRAM,
        // HealthDataType.BIRTH_DATE,
        HealthDataType.HEART_RATE,

        // Add more HealthDataTypes as needed for future requirements.
      ];

  /// Utility to request permission with default types.
  static Future<bool> requestDefaultPermission() async {
    return requestPermission(defaultTypes);
  }
}
