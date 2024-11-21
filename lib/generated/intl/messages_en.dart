// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 6 characters, include an uppercase letter, a lowercase letter, and a number."),
        "logIn": MessageLookupByLibrary.simpleMessage("Log in"),
        "pleaseEnterEmail": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address."),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "termsAndConditions": MessageLookupByLibrary.simpleMessage(
            "You must agree to the Terms and Conditions"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usernameIncrorrect": MessageLookupByLibrary.simpleMessage(
            "Name must be at least 3 characters long."),
        "welcomeToCookbook":
            MessageLookupByLibrary.simpleMessage("Welcome to Balance Byte"),
        "welcome_description": MessageLookupByLibrary.simpleMessage(
            "Discover nutritious, delicious, and easy-to-make recipes tailored to your lifestyle. Whether you\'re looking to fuel up, tone up, or simply eat healthier, Cookbook is here to guide you every step of the way.!")
      };
}
