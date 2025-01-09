import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/widgets/dialogs/video_view_dialog.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_image_screen.dart';
import 'package:video_player/video_player.dart';

///{@template EstablishmentDetailsImage}
/// Custom widget that display the amenities details image
///{@endtemplate}
class DetailsImage extends StatefulWidget {
  ///{@macro EstablishmentDetailsImage}
  const DetailsImage({
    required double imageHeight,
    required List<String> images,
    required String video,
    super.key,
  })  : _video = video,
        _images = images,
        _imageHeight = imageHeight;

  final double _imageHeight;
  final List<String> _images;
  final String _video;

  @override
  State<DetailsImage> createState() => _DetailsImageState();
}

class _DetailsImageState extends State<DetailsImage> {
  final _carouselController = CarouselSliderController();

  int _currentIndex = 0;

  /// Getter for the list of assets to be displayed
  ///
  List<String> get _assets {
    final assets = <String>[];
    if (widget._video.isNotEmpty) {
      assets.add(widget._video);
    }

    assets.addAll(widget._images);

    return assets;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget._imageHeight,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: _assets.length,
            itemBuilder: (context, index, realIndex) {
              final asset = _assets[index];

              //  Check if the asset is a video
              if (asset.contains('video')) {
                return InkWell(
                  onTap: () {
                    //  Show the video dialog
                    VideoViewDialog.show(context, asset);
                  },
                  child: Stack(
                    children: [
                      VideoPlayer(
                        VideoPlayerController.networkUrl(
                          Uri.parse(asset),
                        )..initialize(),
                      ),
                      const Align(
                        child: Icon(
                          Icons.play_circle,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return InkWell(
                onTap: () {
                  context.push(EstablishmentImageScreen.route, extra: asset);
                },
                child: CachedNetworkImage(
                  imageUrl: asset,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              viewportFraction: 2,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Container(
            height: widget._imageHeight,
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            alignment: Alignment.bottomCenter,
            child: Wrap(
              spacing: 8,
              children: _assets.map((asset) {
                final index = _assets.indexOf(asset);

                return _ImageIndicatorWidget(
                  isCurrent: _currentIndex == index,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageIndicatorWidget extends StatelessWidget {
  const _ImageIndicatorWidget({
    required bool isCurrent,
  }) : _isCurrent = isCurrent;

  final bool _isCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: _isCurrent ? Colors.white : Colors.transparent,
        border: const Border.fromBorderSide(
          BorderSide(),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
