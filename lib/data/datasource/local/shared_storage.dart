import 'package:flutter/material.dart';
import 'package:cookbook/data/datasource/local/facade/shared_storage_inreface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
  static late SharedPreferences _prefs;

  /// Initialize SharedPreferences instance
  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
