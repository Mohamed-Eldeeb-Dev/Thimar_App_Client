// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/leaves.png
  AssetGenImage get leaves => const AssetGenImage('assets/images/leaves.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/vegetablesPaper.png
  AssetGenImage get vegetablesPaper =>
      const AssetGenImage('assets/images/vegetablesPaper.png');

  /// File path: assets/images/wall.png
  AssetGenImage get wall => const AssetGenImage('assets/images/wall.png');

  /// List of all assets
  List<AssetGenImage> get values => [leaves, logo, vegetablesPaper, wall];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/flag.svg
  String get flag => 'assets/svgs/flag.svg';

  /// File path: assets/svgs/logo.svg
  String get logo => 'assets/svgs/logo.svg';

  /// File path: assets/svgs/phone.svg
  String get phone => 'assets/svgs/phone.svg';

  /// File path: assets/svgs/sud.svg
  String get sud => 'assets/svgs/sud.svg';

  /// File path: assets/svgs/unlock.svg
  String get unlock => 'assets/svgs/unlock.svg';

  /// File path: assets/svgs/user.svg
  String get user => 'assets/svgs/user.svg';

  /// List of all assets
  List<String> get values => [flag, logo, phone, sud, unlock, user];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
