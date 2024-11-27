import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';

///{@template LoadingDialog}
/// Custom dialog that used to show loading state.
///{@endtemplate}
class LoadingDialog extends StatelessWidget {
  ///{@macro LoadingDialog}
  const LoadingDialog({super.key});

  static bool _isShowing = false;

  /// Method to show the loading dialog.
  static void show(BuildContext context, {bool dismissible = false}) {
    showDialog<LoadingDialog>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return const LoadingDialog();
      },
    );

    _isShowing = true;
  }

  static void hide(BuildContext context) {
    if (_isShowing) {
      _isShowing = false;

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Gap(16),
          Text('Loading...'),
        ],
      ),
    );
  }
}
