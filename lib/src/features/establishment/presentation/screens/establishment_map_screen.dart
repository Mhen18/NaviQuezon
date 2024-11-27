import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_itinerary_cubit.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_list_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_itinerary_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_details_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_image_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_like_button.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template EstablishmentMapScreen}
/// Screen for displaying the map.
///{@endtemplate}
class EstablishmentMapScreen extends StatefulWidget {
  ///{@macro EstablishmentMapScreen}
  const EstablishmentMapScreen({
    required LatLng latLng,
    super.key,
  }) : _latLng = latLng;

  final LatLng _latLng;

  static const route = rEstablishmentMap;

  @override
  State<EstablishmentMapScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentMapScreen> {
  final _estaCubit = EstablishmentListGetCubit();

  final _mapMarkerList = <Marker>[];

  CameraPosition? _cameraPosition;

  @override
  void initState() {
    super.initState();

    _cameraPosition = CameraPosition(
      target: widget._latLng,
      zoom: 14.4746,
    );

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  ///
  void _initBlocs() {
    _estaCubit.run();
  }

  /// Future method to create a google map marker icon.
  ///
  Future<BitmapDescriptor?> _createMarker(String url) async {
    try {
      //  Get the icon from the network.
      final image = await _loadImageNetwork(url);

      //  Create a bitmap descriptor from the image.
      final imageCodec = await instantiateImageCodec(
        image!.buffer.asUint8List(),
        targetHeight: 70,
        targetWidth: 100,
      );

      //  Create a frame info from the image codec.
      final frameInfo = await imageCodec.getNextFrame();

      //  Create a byte data from the frame info.
      final byteData = await frameInfo.image.toByteData(
        format: ImageByteFormat.png,
      );

      //  Create a bitmap descriptor from the byte data.
      final imageMarkerResized = byteData!.buffer.asUint8List();

      //  Create a bitmap descriptor from the resized image.
      final imageMarker = BitmapDescriptor.bytes(imageMarkerResized);

      //  Return the image marker.
      return imageMarker;
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);
    }

    //  Return null if the image marker is not created.
    return null;
  }

  /// Future method to load the image from the network.
  ///
  Future<Uint8List?> _loadImageNetwork(String url) async {
    try {
      //  Create a completer to handle the image info.
      final completer = Completer<ImageInfo>();
      //  Create a network image from the url.
      final image = CachedNetworkImageProvider(url);

      //  Add a listener to the image.
      image.resolve(ImageConfiguration.empty).addListener(
        ImageStreamListener((info, _) {
          if (mounted) {
            completer.complete(info);
          }
        }),
      );

      final imageInfo = await completer.future;
      final byteData = await imageInfo.image.toByteData(
        format: ImageByteFormat.png,
      );

      return byteData?.buffer.asUint8List();
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);
    }

    //  Return null if the image is not loaded.
    return null;
  }

  /// Method to get the marker.
  ///
  Future<void> _getMarker(List<EstablishmentModel> estaList) async {
    if (estaList.isNotEmpty) {
      for (final esta in estaList) {
        //  Create a marker icon from the thumbnail.
        final markerIcon = await _createMarker(esta.thumbnail ?? '');

        final marker = Marker(
          markerId: MarkerId(esta.id),
          position: LatLng(
            esta.latitude.toDouble(),
            esta.longitude.toDouble(),
          ),
          icon: markerIcon ?? BitmapDescriptor.defaultMarker,
          onTap: () {
            showModalBottomSheet<_EstablishmentCard>(
              context: context,
              builder: (context) {
                return _EstablishmentCard(establishment: esta);
              },
            );
          },
        );

        if (mounted) {
          setState(() {
            _mapMarkerList.add(marker);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _estaCubit,
      child: Scaffold(
        body: BlocConsumer<EstablishmentListGetCubit, CubitState>(
          listener: (context, estaState) {
            if (estaState is CubitStateSuccess<List<EstablishmentModel>>) {
              final estaList = estaState.value;

              //  Check if the list is not empty
              if (estaList.isNotEmpty) {
                //  Create the markers
                _getMarker(estaList);
              }
            }
          },
          builder: (context, estaState) {
            if (estaState is CubitStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (estaState is CubitStateFailed) {
              final failure = estaState.failure;

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(failure.message),
                    const Gap(16),
                    RoundedButton(
                      onPressed: _estaCubit.run,
                      label: 'Retry',
                    ),
                  ],
                ),
              );
            }

            return FutureBuilder(
              future: Geolocator.getCurrentPosition(),
              builder: (context, AsyncSnapshot<Position> snapshot) {
                //  Default latitude and longitude [CSTC]
                var lat = 13.9648961;
                var long = 121.5273711;

                //  Check if the snapshot has data
                if (snapshot.hasData) {
                  final position = snapshot.data;
                  if (position != null) {
                    lat = position.latitude;
                    long = position.longitude;
                  }
                }

                return GoogleMap(
                  initialCameraPosition: _cameraPosition ??
                      CameraPosition(
                        target: LatLng(lat, long),
                        zoom: 14.4746,
                      ),
                  markers: Set<Marker>.of(_mapMarkerList),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

///{@template _EstablishmentCard}
/// Custom widget that display the establishment card.
///{@endtemplate}
class _EstablishmentCard extends StatefulWidget {
  ///{@macro _EstablishmentCard}
  const _EstablishmentCard({
    required EstablishmentModel establishment,
  }) : _establishment = establishment;

  final EstablishmentModel _establishment;

  @override
  State<_EstablishmentCard> createState() => _EstablishmentCardState();
}

class _EstablishmentCardState extends State<_EstablishmentCard> {
  late ProfileGetCubit _profileCubit;
  final _itineraryCubit = EstablishmentItineraryCubit();

  final _loading = ValueNotifier<bool>(false);

  EstablishmentModel get _establishment => widget._establishment;

  /// Getter for the profile model.
  ///
  ProfileModel? get _profile {
    final profileState = _profileCubit.state;

    if (profileState is CubitStateSuccess<ProfileModel>) {
      return profileState.value;
    }

    return null;
  }

  /// Getter for the itinerary.
  ///
  bool get _itinerary {
    final itineraryList = _profile?.estaItinerary ?? [];

    return itineraryList.where((itinerary) {
      return itinerary.establishmentId == _establishment.id;
    }).isNotEmpty;
  }

  /// Getter for the ratings.
  ///
  String? get _ratings {
    final rating = _establishment.rating;

    if(rating != null){
      return rating.toStringAsFixed(1);
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    _profileCubit = BlocProvider.of<ProfileGetCubit>(context);
  }

  /// Method to handle the add itinerary pressed.
  ///
  void _onAddItineraryPressed() {
    if (_loading.value == true) return;

    final itineraryList = _profile?.estaItinerary ?? [];

    if (itineraryList.isNotEmpty) {
      final itineraryExist = itineraryList
          .where((itinerary) => itinerary.establishmentId == _establishment.id)
          .isNotEmpty;

      if (itineraryExist) {
        return;
      }
    }

    //  Add the itinerary to the profile.
    final newItinerary = EstablishmentItineraryModel.add(
      establishmentId: _establishment.id,
    );

    _itineraryCubit.run(
      itinerary: newItinerary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _itineraryCubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<EstablishmentItineraryCubit, CubitState>(
            listener: (context, itineraryState) {
              if (itineraryState is CubitStateLoading) {
                _loading.value = true;
              }

              if (itineraryState is CubitStateFailed) {
                _loading.value = false;

                final failure = itineraryState.failure;
                AppSnackBar.error(context, toast: true).show(failure.message);
              }

              if (itineraryState is CubitStateSuccess) {
                _profileCubit.run();
              }
            },
          ),
          BlocListener<ProfileGetCubit, CubitState>(
            listener: (context, profileState) {
              if (profileState is CubitStateFailed) {
                _loading.value = false;

                final failure = profileState.failure;
                AppSnackBar.error(context, toast: true).show(failure.message);
              }

              if (profileState is CubitStateSuccess<ProfileModel>) {
                _loading.value = false;

                final profile = profileState.value;
                final estaItinerary = profile.estaItinerary ?? [];

                final isItinerary = estaItinerary.where((itinerary) {
                  return itinerary.establishmentId == _establishment.id;
                }).isNotEmpty;

                if (isItinerary) {
                  setState(() {});
                }
              }
            },
            child: Container(),
          ),
        ],
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  if (_establishment.thumbnail != null) ...[
                    InkWell(
                      onTap: () {
                        context.push(
                          EstablishmentImageScreen.route,
                          extra: _establishment.thumbnail,
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: _establishment.thumbnail!,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 150,
                      ),
                    ),
                    const Gap(16),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _establishment.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyle16w600,
                                  ),
                                  if (_ratings != null) ...[
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: color1363DF,
                                        ),
                                        Text(
                                          _ratings ?? '',
                                          style: textStyle12w400,
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const Gap(8),
                            EstablishmentLikeButton(
                              establishment: _establishment,
                            ),
                          ],
                        ),
                        Text(
                          widget._establishment.address,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle12w400,
                        ),
                        if (widget._establishment.description != null) ...[
                          const Gap(16),
                          Text(
                            widget._establishment.description ?? '',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle12w400,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: RoundedButton(
                      onPressed: () {
                        //  Navigate to establishment details screen
                        context.push(
                          EstablishmentDetailsScreen.route,
                          extra: _establishment,
                        );
                      },
                      label: 'View Details',
                    ),
                  ),
                  if (_itinerary == false) ...[
                    const Gap(8),
                    Expanded(
                      child: RoundedButton(
                        onPressed: _onAddItineraryPressed,
                        label: 'Add Itinerary',
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
