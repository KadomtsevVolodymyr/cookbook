import 'package:cookbook/app_entry.dart';
import 'package:cookbook/data/datasource/local/shared_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await configureApp();
  await SharedStorage.initialize();
  runApp(AppEntry());
}

Future configureApp() async {
  await Hive.initFlutter();
}
