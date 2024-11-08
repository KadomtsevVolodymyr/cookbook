/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Isaiah (1).zip
  String get isaiah1 => 'assets/icons/Isaiah (1).zip';

  /// File path: assets/icons/Isaiah.zip
  String get isaiah => 'assets/icons/Isaiah.zip';

  /// File path: assets/icons/add.svg
  SvgGenImage get add => const SvgGenImage('assets/icons/add.svg');

  /// File path: assets/icons/apple_logo.svg
  SvgGenImage get appleLogo => const SvgGenImage('assets/icons/apple_logo.svg');

  /// File path: assets/icons/arrow-left.svg
  SvgGenImage get arrowLeft => const SvgGenImage('assets/icons/arrow-left.svg');

  /// File path: assets/icons/arrow-white.svg
  SvgGenImage get arrowWhite =>
      const SvgGenImage('assets/icons/arrow-white.svg');

  /// File path: assets/icons/arrow_bottom.svg
  SvgGenImage get arrowBottom =>
      const SvgGenImage('assets/icons/arrow_bottom.svg');

  /// File path: assets/icons/arrow_top.svg
  SvgGenImage get arrowTop => const SvgGenImage('assets/icons/arrow_top.svg');

  /// File path: assets/icons/check-box-state2.svg
  SvgGenImage get checkBoxState2 =>
      const SvgGenImage('assets/icons/check-box-state2.svg');

  /// File path: assets/icons/check-box-trnperent.svg
  SvgGenImage get checkBoxTrnperent =>
      const SvgGenImage('assets/icons/check-box-trnperent.svg');

  /// File path: assets/icons/check_box_false.svg
  SvgGenImage get checkBoxFalse =>
      const SvgGenImage('assets/icons/check_box_false.svg');

  /// File path: assets/icons/check_box_true.svg
  SvgGenImage get checkBoxTrue =>
      const SvgGenImage('assets/icons/check_box_true.svg');

  /// File path: assets/icons/facebook_logo.svg
  SvgGenImage get facebookLogo =>
      const SvgGenImage('assets/icons/facebook_logo.svg');

  /// File path: assets/icons/google_logo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/icons/google_logo.png');

  /// File path: assets/icons/hide_password.svg
  SvgGenImage get hidePassword =>
      const SvgGenImage('assets/icons/hide_password.svg');

  /// File path: assets/icons/information_error.svg
  SvgGenImage get informationError =>
      const SvgGenImage('assets/icons/information_error.svg');

  /// File path: assets/icons/qustion_icon.svg
  SvgGenImage get qustionIcon =>
      const SvgGenImage('assets/icons/qustion_icon.svg');

  /// File path: assets/icons/radio-check.svg
  SvgGenImage get radioCheck =>
      const SvgGenImage('assets/icons/radio-check.svg');

  /// File path: assets/icons/radio_check_true.svg
  SvgGenImage get radioCheckTrue =>
      const SvgGenImage('assets/icons/radio_check_true.svg');

  /// File path: assets/icons/show_password.svg
  SvgGenImage get showPassword =>
      const SvgGenImage('assets/icons/show_password.svg');

  /// List of all assets
  List<dynamic> get values => [
        isaiah1,
        isaiah,
        add,
        appleLogo,
        arrowLeft,
        arrowWhite,
        arrowBottom,
        arrowTop,
        checkBoxState2,
        checkBoxTrnperent,
        checkBoxFalse,
        checkBoxTrue,
        facebookLogo,
        googleLogo,
        hidePassword,
        informationError,
        qustionIcon,
        radioCheck,
        radioCheckTrue,
        showPassword
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/active.png
  AssetGenImage get active => const AssetGenImage('assets/images/active.png');

  /// File path: assets/images/connect_health.svg
  SvgGenImage get connectHealth =>
      const SvgGenImage('assets/images/connect_health.svg');

  /// File path: assets/images/dietary.png
  AssetGenImage get dietary => const AssetGenImage('assets/images/dietary.png');

  /// File path: assets/images/health_goal.png
  AssetGenImage get healthGoal =>
      const AssetGenImage('assets/images/health_goal.png');

  /// File path: assets/images/onboarding_top.svg
  SvgGenImage get onboardingTop =>
      const SvgGenImage('assets/images/onboarding_top.svg');

  /// List of all assets
  List<dynamic> get values =>
      [active, connectHealth, dietary, healthGoal, onboardingTop];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logo/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class Assets {
  Assets._();

  static const String countries = 'assets/countries.json';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();

  /// List of all assets
  static List<String> get values => [countries];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
