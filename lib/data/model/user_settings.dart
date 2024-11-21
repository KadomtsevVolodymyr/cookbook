class UserSettings {
  final List<String> items;

  UserSettings(this.items);

  factory UserSettings.fromJson(Map<String, dynamic> json, String key) {
    final items =
        (json[key] as List<dynamic>).map((e) => e.toString()).toList();
    return UserSettings(items);
  }
  static UserSettings fromSelectedOptions(Map<String, bool> options) {
    final selectedItems = options.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    return UserSettings(selectedItems);
  }
}
