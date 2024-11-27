import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';

///{@template EstablishmentInfoEditDialog}
/// Custom dialog for editing establishment information.
///{@endtemplate}
class EstablishmentInfoEditDialog extends StatelessWidget {
  ///{@macro EstablishmentInfoEditDialog}
  const EstablishmentInfoEditDialog({
    required this.onAddRemoveAssetsPressed,
    required this.onAmenitiesPressed,
    required this.onInformationPressed,
    required this.onFilterPressed,
    super.key,
  });

  final void Function() onAddRemoveAssetsPressed;
  final void Function() onAmenitiesPressed;
  final void Function() onInformationPressed;
  final void Function() onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select what you want to edit.',
              textAlign: TextAlign.center,
              style: textStyle16w600,
            ),
            const Gap(16),
            RoundedButton(
              onPressed: onAddRemoveAssetsPressed,
              label: 'Add / remove photo and video',
              width: double.infinity,
            ),
            const Gap(16),
            RoundedButton(
              onPressed: onAmenitiesPressed,
              label: 'Amenities',
              width: double.infinity,
            ),
            const Gap(16),
            RoundedButton(
              onPressed: onInformationPressed,
              label: 'Information',
              width: double.infinity,
            ),
            const Gap(16),
            RoundedButton(
              onPressed: onFilterPressed,
              label: 'Filter reviews',
              width: double.infinity,
            ),
            const Gap(16),
            Assets.images.logo.logoNavi.image(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
