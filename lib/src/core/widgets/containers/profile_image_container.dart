import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///{@template ProfileImageContainer}
/// Custom container for the profile image.
///{@endtemplate}
class ProfileImageContainer extends StatelessWidget {
  ///{@macro ProfileImageContainer}
  const ProfileImageContainer({
    required String imagePlaceHolder,
    String? imageUrl,
    String? imagePath,
    double? size,
    super.key,
  })  : _imagePlaceHolder = imagePlaceHolder,
        _imageUrl = imageUrl,
        _imagePath = imagePath,
        _size = size;

  final String _imagePlaceHolder;
  final String? _imagePath;
  final String? _imageUrl;
  final double? _size;

  /// Image provider for the profile image.
  ///
  ImageProvider _getImageProvider() {
    //  Check if the image url is not null
    if (_imageUrl != null) {
      if (_imageUrl.isNotEmpty) {
        return CachedNetworkImageProvider(_imageUrl);
      }
    }

    //  Check if the image path is not null
    if (_imagePath != null) {
      if (_imagePath.isNotEmpty) {
        return FileImage(
          File(_imagePath),
        );
      }
    }

    //  Return the image placeholder
    return AssetImage(_imagePlaceHolder);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size ?? 100,
      width: _size ?? 100,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: _getImageProvider(),
          ),
        ),
      ),
    );
  }
}
