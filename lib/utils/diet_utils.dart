import 'dart:convert';

import 'package:flutter/material.dart';

/// Creates a JSON payload including all selected items based on a provided map.
/// It can handle multiple "other" keys such as "Other Diet:", "Others:", etc.
/// If any of these "other" keys are selected, and the user provided text (textController),
/// that text is added to the resulting list.
///
/// [optionsMap]: a Map of options where keys are strings and values are booleans indicating selection.
/// [textController]: a controller holding custom user input if an "other" option is selected.
/// [topLevelKey]: the key name you want to use in the final JSON, defaults to "diet".
/// [otherKeys]: a set of keys that represent "other" categories.
///
/// Returns a JSON string that looks like:
/// {
///   "diet": ["Vegan", "Custom Input"]
/// }
/// or if [topLevelKey] = "activity", then:
/// {
///   "activity": ["Running", "Custom Input"]
/// }
String createPayload({
  required Map<String, bool> optionsMap,
  required TextEditingController textController,
  String topLevelKey = "diet",
  Set<String> otherKeys = const {"Other Diet:", "Others:", "Custom Diet:"},
}) {
  // Filter selected items excluding the "other" keys
  final List<String> selectedItems = optionsMap.entries
      .where((entry) => entry.value == true && !otherKeys.contains(entry.key))
      .map((entry) => entry.key)
      .toList();

  // Check if any "other" key is selected
  final bool anyOtherSelected = optionsMap.entries
      .any((entry) => otherKeys.contains(entry.key) && entry.value == true);

  // If other is selected and we have text, add it to the list
  if (anyOtherSelected && textController.text.trim().isNotEmpty) {
    selectedItems.add(textController.text.trim());
  }

  // Construct the payload map with the dynamic top-level key
  final Map<String, dynamic> payload = {
    topLevelKey: selectedItems,
  };

  return jsonEncode(payload);
}
