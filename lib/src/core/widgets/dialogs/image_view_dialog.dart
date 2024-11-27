import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';

///{@template ImageViewDialog}
/// Custom dialog that displays an image.
///{@endtemplate}
class ImageViewDialog extends StatelessWidget {
  ///{@macro ImageViewDialog}
  const ImageViewDialog({
    required String path,
    super.key,
  })  : _path = path,
        _isFile = false;

  const ImageViewDialog.file({
    required String path,
    super.key,
  })  : _path = path,
        _isFile = true;

  final String _path;
  final bool _isFile;

  /// Method to show the image dialog.
  ///
  static void show(BuildContext context, String path) {
    showDialog<Widget>(
      context: context,
      builder: (context) => ImageViewDialog(
        path: path,
      ),
    );
  }

  /// Method to show the image dialog.
  ///
  static void showFile(BuildContext context, String filePath) {
    showDialog<Widget>(
      context: context,
      builder: (context) => ImageViewDialog.file(
        path: filePath,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ),
            const Gap(16),
            Flexible(
              child: Builder(
                builder: (context) {
                  if (_isFile) {
                    return InteractiveViewer(
                      child: Image.file(
                        File(_path),
                        fit: BoxFit.cover,
                        frameBuilder: (context, child, frame, wasLoaded) {
                          if (wasLoaded) {
                            return child;
                          }

                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeOut,
                            child: child,
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    );
                  }

                  return InteractiveViewer(
                    child: CachedNetworkImage(
                      imageUrl: _path,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, download) {
                        return CircularProgressIndicator(
                          value: download.progress,
                        );
                      },
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
