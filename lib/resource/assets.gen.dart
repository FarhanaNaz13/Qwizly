/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/avatar
  $AssetsIconsAvatarGen get avatar => const $AssetsIconsAvatarGen();

  /// Directory path: assets/icons/home
  $AssetsIconsHomeGen get home => const $AssetsIconsHomeGen();

  /// Directory path: assets/icons/leader_board
  $AssetsIconsLeaderBoardGen get leaderBoard =>
      const $AssetsIconsLeaderBoardGen();

  /// Directory path: assets/icons/splash
  $AssetsIconsSplashGen get splash => const $AssetsIconsSplashGen();

  /// File path: assets/icons/sun.svg
  String get sun => 'assets/icons/sun.svg';

  /// List of all assets
  List<String> get values => [sun];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/questions.json
  String get questions => 'assets/json/questions.json';

  /// List of all assets
  List<String> get values => [questions];
}

class $AssetsIconsAvatarGen {
  const $AssetsIconsAvatarGen();

  /// File path: assets/icons/avatar/avatar.png
  AssetGenImage get avatar =>
      const AssetGenImage('assets/icons/avatar/avatar.png');

  /// File path: assets/icons/avatar/cool_avatar.png
  AssetGenImage get coolAvatar =>
      const AssetGenImage('assets/icons/avatar/cool_avatar.png');

  /// File path: assets/icons/avatar/flappy_purple.png
  AssetGenImage get flappyPurple =>
      const AssetGenImage('assets/icons/avatar/flappy_purple.png');

  /// File path: assets/icons/avatar/gentle_female_avatar.png
  AssetGenImage get gentleFemaleAvatar =>
      const AssetGenImage('assets/icons/avatar/gentle_female_avatar.png');

  /// File path: assets/icons/avatar/purple.png
  AssetGenImage get purple =>
      const AssetGenImage('assets/icons/avatar/purple.png');

  /// File path: assets/icons/avatar/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/avatar/user.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [avatar, coolAvatar, flappyPurple, gentleFemaleAvatar, purple, user];
}

class $AssetsIconsHomeGen {
  const $AssetsIconsHomeGen();

  /// File path: assets/icons/home/fx.png
  AssetGenImage get fx => const AssetGenImage('assets/icons/home/fx.png');

  /// File path: assets/icons/home/fx_2.png
  AssetGenImage get fx2 => const AssetGenImage('assets/icons/home/fx_2.png');

  /// File path: assets/icons/home/general.png
  AssetGenImage get generalPng =>
      const AssetGenImage('assets/icons/home/general.png');

  /// File path: assets/icons/home/general.svg
  String get generalSvg => 'assets/icons/home/general.svg';

  /// File path: assets/icons/home/stat.png
  AssetGenImage get stat => const AssetGenImage('assets/icons/home/stat.png');

  /// File path: assets/icons/home/stats.svg
  String get stats => 'assets/icons/home/stats.svg';

  /// List of all assets
  List<dynamic> get values => [fx, fx2, generalPng, generalSvg, stat, stats];
}

class $AssetsIconsLeaderBoardGen {
  const $AssetsIconsLeaderBoardGen();

  /// File path: assets/icons/leader_board/bronze.svg
  String get bronze => 'assets/icons/leader_board/bronze.svg';

  /// File path: assets/icons/leader_board/gold.svg
  String get gold => 'assets/icons/leader_board/gold.svg';

  /// File path: assets/icons/leader_board/silver.svg
  String get silver => 'assets/icons/leader_board/silver.svg';

  /// List of all assets
  List<String> get values => [bronze, gold, silver];
}

class $AssetsIconsSplashGen {
  const $AssetsIconsSplashGen();

  /// File path: assets/icons/splash/Group 3.svg
  String get group3 => 'assets/icons/splash/Group 3.svg';

  /// File path: assets/icons/splash/goods 1.svg
  String get goods1 => 'assets/icons/splash/goods 1.svg';

  /// File path: assets/icons/splash/qwizly_logo.svg
  String get qwizlyLogo => 'assets/icons/splash/qwizly_logo.svg';

  /// File path: assets/icons/splash/welcome 1.svg
  String get welcome1 => 'assets/icons/splash/welcome 1.svg';

  /// List of all assets
  List<String> get values => [group3, goods1, qwizlyLogo, welcome1];
}

class QuizzAsset {
  const QuizzAsset._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
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
