import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/path_enum.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_setup_cubit.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_video_setup_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:video_player/video_player.dart';

///{@template EstablishmentSetupAssetsScreen}
/// Screen for setup the list of establishment's assets.
///{@endtemplate}
class EstablishmentSetupAssetsScreen extends StatefulWidget {
  const EstablishmentSetupAssetsScreen({
    required EstablishmentModel establishment,
    super.key,
  }) : _establishment = establishment;

  final EstablishmentModel _establishment;

  static const route = rEstablishmentSetupAssets;

  @override
  State<EstablishmentSetupAssetsScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentSetupAssetsScreen> {
  final _establishmentCubit = EstablishmentSetupCubit();
  final _videoCubit = EstablishmentVideoSetupCubit();

  final _pathImages = <String>[];
  String? _pathThumbnail;
  String? _pathVideo;

  /// Getter for the establishment
  ///
  EstablishmentModel get _establishment => widget._establishment;

  /// Getter for the validity to enable the save button.
  ///
  bool get _valid {
    final hasThumbnail = _pathThumbnail != null;
    final hasVideo = _pathVideo != null;
    final hasImages = _pathImages.isNotEmpty;

    //  Return the validity of the assets.
    return hasThumbnail || hasVideo || hasImages;
  }

  /// Getter for the video from the server.
  ///
  String? get _estaVideo => _establishment.video;

  @override
  void initState() {
    super.initState();

    if (_establishment.images != null) {
      if (_establishment.images!.isNotEmpty) {
        _pathImages.addAll(_establishment.images!);
      }
    }

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  void _initBlocs() {
    if (_establishment.video != null) {
      //  Run the video cubit to get the video from the server.
      _videoCubit.run(_establishment.video!, PathEnum.network);
    }
  }

  /// Method to run when the save button is pressed.
  ///
  void _onSavePressed() {
    final thumbnail = _pathThumbnail ?? _establishment.thumbnail;
    final video = _pathVideo ?? _establishment.video;
    final images = _pathImages.isEmpty ? _establishment.images : _pathImages;

    //  Create a new establishment with the new paths.
    final establishment = _establishment.copyWith(
      thumbnail: thumbnail,
      video: video,
      images: images,
    );

    //  Run the cubit to save the establishment.
    _establishmentCubit.run(establishment: establishment);
  }

  /// Method to run when the add thumbnail button is pressed.
  ///
  void _onAddThumbnailPressed() {
    showModalBottomSheet<_AssetPickerBottomSheet>(
      context: context,
      builder: (context) {
        return _AssetPickerBottomSheet(
          onCameraSelected: () {
            ImagePicker()
                .pickImage(source: ImageSource.camera, imageQuality: 80)
                .then((value) {
              if (value != null) {
                setState(() {
                  _pathThumbnail = value.path;
                });
              }
            });
          },
          onGallerySelected: () {
            ImagePicker()
                .pickImage(source: ImageSource.gallery, imageQuality: 80)
                .then((value) {
              if (value != null) {
                setState(() {
                  _pathThumbnail = value.path;
                });
              }
            });
          },
        );
      },
    );
  }

  /// Method to run when the add video button is pressed.
  ///
  void _onAddVideoPressed() {
    const maxFileSize = 50 * 1024 * 1024; // 50MB in bytes

    showModalBottomSheet<_AssetPickerBottomSheet>(
      context: context,
      builder: (_) {
        return _AssetPickerBottomSheet(
          onGallerySelected: () {
            ImagePicker().pickVideo(source: ImageSource.gallery).then((value) {
              if (value != null) {
                final file = File(value.path);
                final fileSize = file.lengthSync();

                if (fileSize > maxFileSize) {
                  if (mounted) {
                    AppSnackBar.error(context).show(
                      'Video file size exceeds 20MB.',
                    );
                  }
                } else {
                  _videoCubit.run(value.path, PathEnum.file);
                }
              }
            });
          },
        );
      },
    );
  }

  /// Method to run when the add image button is pressed.
  ///
  void _onAddImageListPressed({int? index}) {
    showModalBottomSheet<_AssetPickerBottomSheet>(
      context: context,
      builder: (context) {
        return _AssetPickerBottomSheet(
          onDeletedSelected: index != null
              ? () {
                  setState(() {
                    _pathImages.removeAt(index);
                  });
                }
              : null,
          onCameraSelected: () {
            ImagePicker()
                .pickImage(source: ImageSource.camera, imageQuality: 80)
                .then((value) {
              if (value != null) {
                if (index != null) {
                  setState(() {
                    _pathImages[index] = value.path;
                  });
                } else if (_pathImages.length < 4) {
                  setState(() {
                    _pathImages.add(value.path);
                  });
                }
              }
            });
          },
          onGallerySelected: () {
            ImagePicker()
                .pickImage(source: ImageSource.gallery, imageQuality: 80)
                .then((value) {
              if (value != null) {
                if (index != null) {
                  setState(() {
                    _pathImages[index] = value.path;
                  });
                } else if (_pathImages.length < 4) {
                  setState(() {
                    _pathImages.add(value.path);
                  });
                }
              }
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _establishmentCubit,
        ),
        BlocProvider(
          create: (context) => _videoCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Images/Videos'),
        ),
        body: BlocListener<EstablishmentSetupCubit, CubitState>(
          listener: (context, setupState) {
            if (setupState is CubitStateLoading) {
              LoadingDialog.show(context);
            } else if (setupState is CubitStateFailed) {
              LoadingDialog.hide(context);
              AppSnackBar.error(context).show(setupState.failure.message);
            } else if (setupState is CubitStateSuccess) {
              LoadingDialog.hide(context);
              AppSnackBar.success(context).show('Media added successfully.');
              context.pop(true);
            }
          },
          child: Scrollbar(
            thumbVisibility: true,
            thickness: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_pathThumbnail == null) ...[
                            _AssetThumbnailWidget.url(
                              onAddPressed: _onAddThumbnailPressed,
                              url: _establishment.thumbnail,
                            ),
                          ] else ...[
                            _AssetThumbnailWidget(
                              onAddPressed: _onAddThumbnailPressed,
                              path: _pathThumbnail,
                            ),
                          ],
                          const Gap(16),
                          _SetupAssetLabel(
                            label: 'Video',
                            onPressed: _pathVideo != null || _estaVideo != null
                                ? _onAddVideoPressed
                                : null,
                          ),
                          BlocBuilder<EstablishmentVideoSetupCubit, CubitState>(
                            builder: (context, videoState) {
                              if (videoState is CubitStateLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (videoState is CubitStateSuccess) {
                                final value = videoState.value;
                                final video = value as (String, PathEnum);

                                if (video.$2 == PathEnum.file) {
                                  return _AssetVideoWidget(
                                    key: ValueKey(video.$1),
                                    onAddPressed: _onAddVideoPressed,
                                    path: video.$1,
                                  );
                                } else if (video.$2 == PathEnum.network) {
                                  return _AssetVideoWidget.url(
                                    key: ValueKey(video.$1),
                                    onAddPressed: _onAddVideoPressed,
                                    url: video.$1,
                                  );
                                } else {
                                  return Center(
                                    child: _AssetCircularButton(
                                      onPressed: _onAddVideoPressed,
                                    ),
                                  );
                                }
                              }

                              return Center(
                                child: _AssetCircularButton(
                                  onPressed: _onAddVideoPressed,
                                ),
                              );
                            },
                          ),
                          const Gap(16),
                          _AssetImageListWidget(
                            onAddPressed: _onAddImageListPressed,
                            onEditPressed: (i) =>
                                _onAddImageListPressed(index: i),
                            pathList: _pathImages,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: RoundedButton(
                      onPressed: _valid ? _onSavePressed : null,
                      label: 'Save',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///{@template _AssetThumbnailWidget}
/// Widget for the thumbnail asset.
///{@endtemplate}
class _AssetThumbnailWidget extends StatelessWidget {
  ///{@macro _AssetThumbnailWidget}
  const _AssetThumbnailWidget({
    required void Function() onAddPressed,
    String? path,
  })  : _onAddPressed = onAddPressed,
        _path = path,
        _url = null;

  ///{@macro _AssetThumbnailWidget}
  const _AssetThumbnailWidget.url({
    required void Function() onAddPressed,
    String? url,
  })  : _onAddPressed = onAddPressed,
        _path = null,
        _url = url;

  final void Function() _onAddPressed;
  final String? _path;
  final String? _url;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SetupAssetLabel(
          label: 'Thumbnail',
          onPressed: _path != null || _url != null ? _onAddPressed : null,
        ),
        Builder(
          builder: (context) {
            if (_path != null) {
              return Image.file(
                File(_path),
                height: 200,
                width: 400,
                fit: BoxFit.cover,
              );
            }

            if (_url != null) {
              return CachedNetworkImage(
                imageUrl: _url,
                height: 200,
                width: 400,
                fit: BoxFit.cover,
              );
            }

            return Center(
              child: _AssetCircularButton(
                onPressed: _onAddPressed,
              ),
            );
          },
        ),
      ],
    );
  }
}

///{@template _AssetImageListWidget}
/// Widget for the list of image assets.
///{@endtemplate}
class _AssetImageListWidget extends StatelessWidget {
  ///{@macro _AssetImageListWidget}
  const _AssetImageListWidget({
    required void Function() onAddPressed,
    required void Function(int) onEditPressed,
    required List<String> pathList,
  })  : _onAddPressed = onAddPressed,
        _onEditPressed = onEditPressed,
        _pathList = pathList;

  final void Function() _onAddPressed;
  final void Function(int) _onEditPressed;
  final List<String> _pathList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SetupAssetLabel(
          label: 'Images',
          subLabel: ' (max 4)',
        ),
        if (_pathList.isNotEmpty) ...[
          GridView.builder(
            shrinkWrap: true,
            itemCount: _pathList.length < 4 ? _pathList.length + 1 : 4,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              if (_pathList.length < 4) {
                if (index == _pathList.length) {
                  return Center(
                    child: _AssetCircularButton(
                      onPressed: _onAddPressed,
                    ),
                  );
                }
              }

              final path = _pathList[index];
              final isNetwork = Uri.tryParse(path)?.host.isNotEmpty ?? false;

              if (isNetwork == true) {
                return InkWell(
                  onTap: () => _onEditPressed(index),
                  child: CachedNetworkImage(
                    imageUrl: path,
                    height: 200,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return InkWell(
                  onTap: () => _onEditPressed(index),
                  child: Image.file(
                    File(path),
                    height: 200,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                );
              }
            },
          ),
        ] else ...[
          Center(
            child: _AssetCircularButton(
              onPressed: _onAddPressed,
            ),
          ),
        ],
      ],
    );
  }
}

///{@template _AssetVideoWidget}
/// Widget for the video asset.
///{@endtemplate}
class _AssetVideoWidget extends StatefulWidget {
  ///{@macro _AssetVideoWidget}
  const _AssetVideoWidget({
    required void Function() onAddPressed,
    super.key,
    String? path,
  })  : _onAddPressed = onAddPressed,
        _path = path,
        _url = null;

  ///{@macro _AssetVideoWidget.url}
  const _AssetVideoWidget.url({
    required void Function() onAddPressed,
    super.key,
    String? url,
  })  : _onAddPressed = onAddPressed,
        _path = null,
        _url = url;

  final void Function() _onAddPressed;
  final String? _path;
  final String? _url;

  @override
  State<_AssetVideoWidget> createState() => _AssetVideoWidgetState();
}

class _AssetVideoWidgetState extends State<_AssetVideoWidget> {
  late ChewieController _chewieController;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    if (widget._url != null) {
      final uri = Uri.parse(widget._url!);
      _controller = VideoPlayerController.networkUrl(
        uri,
      );
      _chewieController = ChewieController(
        videoPlayerController: _controller,
      );
    } else if (widget._path != null) {
      _controller = VideoPlayerController.file(
        File(widget._path!),
      );
      _chewieController = ChewieController(
        videoPlayerController: _controller,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget._path != null || widget._url != null) ...[
          InkWell(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            },
            child: Container(
              color: Colors.white,
              height: 200,
              width: 400,
              child: Chewie(
                controller: _chewieController,
              ),
              // child: VideoPlayer(_controller),
            ),
          ),
        ] else ...[
          Center(
            child: _AssetCircularButton(
              onPressed: widget._onAddPressed,
            ),
          ),
        ],
      ],
    );
  }
}

///{@template _AssetCircularButton}
/// Custom button with circular shape for the assets.
///{@endtemplate}
class _AssetCircularButton extends StatelessWidget {
  const _AssetCircularButton({
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black87,
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}

///{@template _ValidationImagePickerBottomSheet}
/// Bottom sheet for the image picker.
///{@endtemplate}
class _AssetPickerBottomSheet extends StatelessWidget {
  ///{@macro _ValidationImagePickerBottomSheet}
  const _AssetPickerBottomSheet({
    required void Function() onGallerySelected,
    void Function()? onCameraSelected,
    void Function()? onDeletedSelected,
  })  : _onCameraSelected = onCameraSelected,
        _onGallerySelected = onGallerySelected,
        _onDeletedSelected = onDeletedSelected;

  final void Function() _onGallerySelected;
  final void Function()? _onCameraSelected;
  final void Function()? _onDeletedSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_onDeletedSelected != null) ...[
            const Text('Choose Source or Delete'),
          ] else ...[
            const Text('Select Source'),
          ],
          if (_onCameraSelected != null) ...[
            const Gap(16),
            RoundedButton(
              width: double.infinity,
              onPressed: () {
                _onCameraSelected();

                context.pop();
              },
              label: 'Camera',
            ),
          ],
          const Gap(16),
          RoundedButton(
            width: double.infinity,
            onPressed: () {
              _onGallerySelected();

              context.pop();
            },
            label: 'Gallery',
          ),
          if (_onDeletedSelected != null) ...[
            const Gap(16),
            RoundedButton(
              width: double.infinity,
              backgroundColor: Colors.red,
              onPressed: () {
                _onDeletedSelected();

                context.pop();
              },
              label: 'Delete',
            ),
          ],
        ],
      ),
    );
  }
}

///{@template _SetupAssetLabel}
/// Custom label for the setup assets screen.
///{@endtemplate}
class _SetupAssetLabel extends StatelessWidget {
  ///{@macro _SetupAssetLabel}
  const _SetupAssetLabel({
    required String label,
    void Function()? onPressed,
    String? subLabel,
  })  : _subLabel = subLabel,
        _label = label,
        _onPressed = onPressed;

  final String _label;
  final String? _subLabel;
  final void Function()? _onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: _label,
                    ),
                    if (_subLabel != null) ...[
                      TextSpan(
                        text: _subLabel,
                        style: textStyle14w400.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
                style: textStyle16w600,
              ),
            ),
            if (_onPressed != null) ...[
              const Gap(16),
              IconButton(
                onPressed: _onPressed,
                icon: const Icon(Icons.edit),
              ),
            ],
          ],
        ),
        const Gap(4),
      ],
    );
  }
}
