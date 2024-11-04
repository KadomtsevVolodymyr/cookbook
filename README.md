A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## If you are starting this project for the first time, follow these steps:

(1) Upgrade build runner
```bash
$ flutter upgrade build_runner
```
(2) Install flutter_gen (https://pub.dev/packages/flutter_gen)
```bash
$  brew install FlutterGen/tap/fluttergen
```
(3) Generate linked assets resources
```bash
$ dart pub global activate flutter_gen
```
(4) Generate annotations
```bash
$ flutter packages pub run build_runner build
```
(5) Specify the path to generate
```bash
$ fluttergen -c pubspec.yaml
```
(6) Put away conflicting dependencies
```bash
$ dart run build_runner build --delete-conflicting-outputs
```
(7) Generation for unsplash assets
(https://pub.dev/packages/flutter_native_splash)
```bash
$ flutter pub run flutter_native_splash:create
```
(8) Generate localization
```bash
$  flutter pub run intl_utils:generate
```