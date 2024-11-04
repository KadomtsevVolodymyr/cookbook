import 'package:hive/hive.dart';

class HiveHelper {
  //Get value
  Future<T> getValue<T>({
    required HiveInterface hive,
    required String boxName,
    required String key,
  }) async {
    final box = await hive.openBox(boxName);
    final value = await box.get(key);
    await box.close();
    return value;
  }
}
