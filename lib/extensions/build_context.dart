import 'package:cookbook/generated/l10n.dart';
import 'package:flutter/material.dart';

extension ThemeGetter on BuildContext {
  /// Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}

extension I18nGetter on BuildContext {
  S get i18n => S.of(this);
}
