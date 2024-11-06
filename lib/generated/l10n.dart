// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Cookbook`
  String get welcomeToCookbook {
    return Intl.message(
      'Welcome to Cookbook',
      name: 'welcomeToCookbook',
      desc: '',
      args: [],
    );
  }

  /// `Discover nutritious, delicious, and easy-to-make recipes tailored to your lifestyle. Whether you're looking to fuel up, tone up, or simply eat healthier, Cookbook is here to guide you every step of the way.!`
  String get welcome_description {
    return Intl.message(
      'Discover nutritious, delicious, and easy-to-make recipes tailored to your lifestyle. Whether you\'re looking to fuel up, tone up, or simply eat healthier, Cookbook is here to guide you every step of the way.!',
      name: 'welcome_description',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters, include an uppercase letter, a lowercase letter, and a number.`
  String get incorrectPassword {
    return Intl.message(
      'Password must be at least 6 characters, include an uppercase letter, a lowercase letter, and a number.',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 3 characters long.`
  String get usernameIncrorrect {
    return Intl.message(
      'Name must be at least 3 characters long.',
      name: 'usernameIncrorrect',
      desc: '',
      args: [],
    );
  }

  /// `You must agree to the Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'You must agree to the Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'uk', countryCode: 'UA'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
