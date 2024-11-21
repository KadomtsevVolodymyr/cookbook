import 'package:balancebyte/app_entry.dart';
import 'package:balancebyte/data/datasource/local/shared_storage.dart';
import 'package:balancebyte/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await configureApp();
  await SharedStorage.initialize();
  runApp(AppEntry());
}

Future configureApp() async {
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
