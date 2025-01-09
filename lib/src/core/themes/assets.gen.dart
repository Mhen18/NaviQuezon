/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/backgrounds
  $AssetsImagesBackgroundsGen get backgrounds =>
      const $AssetsImagesBackgroundsGen();

  /// Directory path: assets/images/headers
  $AssetsImagesHeadersGen get headers => const $AssetsImagesHeadersGen();

  /// Directory path: assets/images/icons
  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();

  /// Directory path: assets/images/logo
  $AssetsImagesLogoGen get logo => const $AssetsImagesLogoGen();
}

class $AssetsImagesBackgroundsGen {
  const $AssetsImagesBackgroundsGen();

  /// File path: assets/images/backgrounds/bg-discover.webp
  AssetGenImage get bgDiscover =>
      const AssetGenImage('assets/images/backgrounds/bg-discover.webp');

  /// File path: assets/images/backgrounds/bg-popup.webp
  AssetGenImage get bgPopup =>
      const AssetGenImage('assets/images/backgrounds/bg-popup.webp');

  /// File path: assets/images/backgrounds/bg-tour.webp
  AssetGenImage get bgTour =>
      const AssetGenImage('assets/images/backgrounds/bg-tour.webp');

  /// List of all assets
  List<AssetGenImage> get values => [bgDiscover, bgPopup, bgTour];
}

class $AssetsImagesHeadersGen {
  const $AssetsImagesHeadersGen();

  /// File path: assets/images/headers/header-profile-drawer.webp
  AssetGenImage get headerProfileDrawer =>
      const AssetGenImage('assets/images/headers/header-profile-drawer.webp');

  /// List of all assets
  List<AssetGenImage> get values => [headerProfileDrawer];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// Directory path: assets/images/icons/amenities
  $AssetsImagesIconsAmenitiesGen get amenities =>
      const $AssetsImagesIconsAmenitiesGen();

  /// File path: assets/images/icons/ic-admin.webp
  AssetGenImage get icAdmin =>
      const AssetGenImage('assets/images/icons/ic-admin.webp');

  /// File path: assets/images/icons/ic-app.png
  AssetGenImage get icApp =>
      const AssetGenImage('assets/images/icons/ic-app.png');

  /// File path: assets/images/icons/ic-owner.webp
  AssetGenImage get icOwner =>
      const AssetGenImage('assets/images/icons/ic-owner.webp');

  /// File path: assets/images/icons/ic-user.webp
  AssetGenImage get icUser =>
      const AssetGenImage('assets/images/icons/ic-user.webp');

  /// List of all assets
  List<AssetGenImage> get values => [icAdmin, icApp, icOwner, icUser];
}

class $AssetsImagesLogoGen {
  const $AssetsImagesLogoGen();

  /// File path: assets/images/logo/logo-navi.webp
  AssetGenImage get logoNavi =>
      const AssetGenImage('assets/images/logo/logo-navi.webp');

  /// File path: assets/images/logo/logo-navigate.webp
  AssetGenImage get logoNavigate =>
      const AssetGenImage('assets/images/logo/logo-navigate.webp');

  /// File path: assets/images/logo/logo-pidol.webp
  AssetGenImage get logoPidol =>
      const AssetGenImage('assets/images/logo/logo-pidol.webp');

  /// List of all assets
  List<AssetGenImage> get values => [logoNavi, logoNavigate, logoPidol];
}

class $AssetsImagesIconsAmenitiesGen {
  const $AssetsImagesIconsAmenitiesGen();

  /// File path: assets/images/icons/amenities/ic-ac.webp
  AssetGenImage get icAc =>
      const AssetGenImage('assets/images/icons/amenities/ic-ac.webp');

  /// File path: assets/images/icons/amenities/ic-coffee.webp
  AssetGenImage get icCoffee =>
      const AssetGenImage('assets/images/icons/amenities/ic-coffee.webp');

  /// File path: assets/images/icons/amenities/ic-hotel.webp
  AssetGenImage get icHotel =>
      const AssetGenImage('assets/images/icons/amenities/ic-hotel.webp');

  /// File path: assets/images/icons/amenities/ic-location.webp
  AssetGenImage get icLocation =>
      const AssetGenImage('assets/images/icons/amenities/ic-location.webp');

  /// File path: assets/images/icons/amenities/ic-parking.webp
  AssetGenImage get icParking =>
      const AssetGenImage('assets/images/icons/amenities/ic-parking.webp');

  /// File path: assets/images/icons/amenities/ic-pool.webp
  AssetGenImage get icPool =>
      const AssetGenImage('assets/images/icons/amenities/ic-pool.webp');

  /// File path: assets/images/icons/amenities/ic-rate.webp
  AssetGenImage get icRate =>
      const AssetGenImage('assets/images/icons/amenities/ic-rate.webp');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icAc, icCoffee, icHotel, icLocation, icParking, icPool, icRate];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
