import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';

///{@template EstablishmentImageScreen}
/// Screen to display the image of the establishment.
///{@endtemplate}
class EstablishmentImageScreen extends StatelessWidget {
  ///{@macro EstablishmentImageScreen}
  const EstablishmentImageScreen({
    required String imagePath,
    super.key,
  }) : _imagePath = imagePath;

  final String _imagePath;

  static const route = rEstablishmentImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => context.pop(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InteractiveViewer(
                child: CachedNetworkImage(
                  imageUrl: _imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
