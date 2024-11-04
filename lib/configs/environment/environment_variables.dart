abstract class EnvironmentVariables {
  // to add a new config and set the default value you can run this --dart-define=variable name=value

  static const _vendorThemeConfiguration = 'vendorThemeConfiguration';
  static const vendorThemeConfiguration =
      int.fromEnvironment(_vendorThemeConfiguration, defaultValue: 1);

  static String environmentValue =
      const String.fromEnvironment('ENV', defaultValue: 'uat');
  static String mockValue =
      const String.fromEnvironment('MOCK', defaultValue: 'none');
}
