import 'package:cookbook/data/datasource/local/facade/solution_storage_interface.dart';
import 'package:cookbook/utils/hive_helper.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SolutionStorage implements ISolutionStorage {
  SolutionStorage({
    required HiveInterface hive,
    required String boxPrefix,
    required HiveHelper hiveHelper,
  })  : _hive = hive,
        _hiveHelper = hiveHelper,
        _boxName = boxPrefix + _configurationBoxKey;

  static const _configurationBoxKey = 'configurationBox';
  static const _themeValueKey = 'themeValue';
  static const _localeValueKey = 'localeValue';

  final HiveInterface _hive;
  final String _boxName;
  final HiveHelper _hiveHelper;

  @override
  Future<int?> getTheme() async => await _hiveHelper.getValue<int?>(
        hive: _hive,
        boxName: _boxName,
        key: _themeValueKey,
      );

  @override
  Future<String?> getLocale() async => await _hiveHelper.getValue<String?>(
        hive: _hive,
        boxName: _boxName,
        key: _localeValueKey,
      );
}
