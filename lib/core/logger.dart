import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: CustomLogPrinter(className));
}

class CustomLogPrinter extends LogPrinter {
  CustomLogPrinter(this.className);

  final String className;

  @override
  List<String> log(LogEvent event) {
    final eventCast = event.message as String;
    if (eventCast.length > 1024) {
      printWrapped(event.message);
      return ['--------------------------------------'];
    } else {
      final emoji = PrettyPrinter.defaultLevelEmojis[event.level]!;
      return ['$emoji [$className] ${PrettyPrinter.singleDivider} ${event.message}'];
    }
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
  }
}
