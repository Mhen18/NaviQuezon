import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';
import 'package:naviquezon/src/features/authentication/splash/presentation/screens/splash_screen.dart';

///{@template VerificationDialog}
/// Custom dialog that used to show verification message dialog.
///{@endtemplate}
class VerificationDialog extends StatelessWidget {
  ///{@macro VerificationDialog}
  const VerificationDialog({super.key});

  /// Method to show the verification dialog.
  ///
  static void show(BuildContext context) {
    showDialog<VerificationDialog>(
      context: context,
      builder: (context) {
        return const VerificationDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.icons.icAdmin.image(
            height: 60,
            width: 60,
          ),
          const Gap(8),
          const Text(
            'Please wait for the confirmation from admin',
          ),
          const Gap(8),
          TextButton(
            onPressed: () => context.go(SplashScreen.route),
            child: Text(
              'Continue',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
