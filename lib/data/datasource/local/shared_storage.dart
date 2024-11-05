import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
  static late SharedPreferences _prefs;

  /// Initialize SharedPreferences instance
  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
