// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/SFPRODISPLAYBLACKITALIC.OTF
  String get sfprodisplayblackitalic =>
      'assets/fonts/SFPRODISPLAYBLACKITALIC.OTF';

  /// File path: assets/fonts/SFPRODISPLAYBOLD.OTF
  String get sfprodisplaybold => 'assets/fonts/SFPRODISPLAYBOLD.OTF';

  /// File path: assets/fonts/SFPRODISPLAYHEAVYITALIC.OTF
  String get sfprodisplayheavyitalic =>
      'assets/fonts/SFPRODISPLAYHEAVYITALIC.OTF';

  /// File path: assets/fonts/SFPRODISPLAYLIGHTITALIC.OTF
  String get sfprodisplaylightitalic =>
      'assets/fonts/SFPRODISPLAYLIGHTITALIC.OTF';

  /// File path: assets/fonts/SFPRODISPLAYMEDIUM.OTF
  String get sfprodisplaymedium => 'assets/fonts/SFPRODISPLAYMEDIUM.OTF';

  /// File path: assets/fonts/SFPRODISPLAYREGULAR.OTF
  String get sfprodisplayregular => 'assets/fonts/SFPRODISPLAYREGULAR.OTF';

  /// File path: assets/fonts/SFPRODISPLAYSEMIBOLDITALIC.OTF
  String get sfprodisplaysemibolditalic =>
      'assets/fonts/SFPRODISPLAYSEMIBOLDITALIC.OTF';

  /// File path: assets/fonts/SFPRODISPLAYTHINITALIC.OTF
  String get sfprodisplaythinitalic =>
      'assets/fonts/SFPRODISPLAYTHINITALIC.OTF';

  /// File path: assets/fonts/SFPRODISPLAYULTRALIGHTITALIC.OTF
  String get sfprodisplayultralightitalic =>
      'assets/fonts/SFPRODISPLAYULTRALIGHTITALIC.OTF';

  /// List of all assets
  List<String> get values => [
    sfprodisplayblackitalic,
    sfprodisplaybold,
    sfprodisplayheavyitalic,
    sfprodisplaylightitalic,
    sfprodisplaymedium,
    sfprodisplayregular,
    sfprodisplaysemibolditalic,
    sfprodisplaythinitalic,
    sfprodisplayultralightitalic,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bookmark_selected.png
  AssetGenImage get bookmarkSelected =>
      const AssetGenImage('assets/images/bookmark_selected.png');

  /// File path: assets/images/bookmark_unselected.png
  AssetGenImage get bookmarkUnselected =>
      const AssetGenImage('assets/images/bookmark_unselected.png');

  /// File path: assets/images/cancel.png
  AssetGenImage get cancel => const AssetGenImage('assets/images/cancel.png');

  /// File path: assets/images/home_selected.png
  AssetGenImage get homeSelected =>
      const AssetGenImage('assets/images/home_selected.png');

  /// File path: assets/images/home_unselected.png
  AssetGenImage get homeUnselected =>
      const AssetGenImage('assets/images/home_unselected.png');

  /// File path: assets/images/image_placeholder.jpeg
  AssetGenImage get imagePlaceholder =>
      const AssetGenImage('assets/images/image_placeholder.jpeg');

  /// File path: assets/images/no_data.png
  AssetGenImage get noData => const AssetGenImage('assets/images/no_data.png');

  /// File path: assets/images/no_image.jpg
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no_image.jpg');

  /// File path: assets/images/search_selected.png
  AssetGenImage get searchSelected =>
      const AssetGenImage('assets/images/search_selected.png');

  /// File path: assets/images/search_unselected.png
  AssetGenImage get searchUnselected =>
      const AssetGenImage('assets/images/search_unselected.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    bookmarkSelected,
    bookmarkUnselected,
    cancel,
    homeSelected,
    homeUnselected,
    imagePlaceholder,
    noData,
    noImage,
    searchSelected,
    searchUnselected,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
