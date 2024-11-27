import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';
import 'package:video_player/video_player.dart';

///{@template VideoViewDialog}
/// Custom dialog that displays a video.
///{@endtemplate}
class VideoViewDialog extends StatefulWidget {
  ///{@macro VideoViewDialog}
  const VideoViewDialog({
    required String path,
    super.key,
  }) : _path = path;

  final String _path;

  /// Method to show the video dialog.
  ///
  static void show(BuildContext context, String path) {
    showDialog<Widget>(
      context: context,
      builder: (context) => VideoViewDialog(
        path: path,
      ),
    );
  }

  @override
  State<VideoViewDialog> createState() => _VideoViewDialogState();
}

class _VideoViewDialogState extends State<VideoViewDialog> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    final uri = Uri.parse(widget._path);
    _controller = VideoPlayerController.networkUrl(
      uri,
    );

  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
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
            child: InkWell(
              onTap: () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              },
              child: SizedBox(
                height: 200,
                width: 400,
                child: Chewie(
                  controller: ChewieController(
                    videoPlayerController: _controller,
                    errorBuilder: (context, error) {
                      printError(widget._path);
                      printError(error);

                      return const Center(
                        child: Text('Error loading video'),
                      );
                    },
                  ),
                ),
                // child: VideoPlayer(_controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
