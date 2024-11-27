import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/features/admin/verification/application/blocs/put_verification_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template VerificationDetailsParams}
/// Parameters for the [VerificationDetailsScreen].
///{@endtemplate}
class VerificationDetailsParams {
  ///{@macro VerificationDetailsParams}
  VerificationDetailsParams({
    required this.profile,
  });

  final ProfileModel profile;
}

///{@template VerificationDetailsScreen}
/// Screen for the admin to see the details of the account to be verified.
///{@endtemplate}
class VerificationDetailsScreen extends StatefulWidget {
  ///{@macro VerificationDetailsScreen}
  const VerificationDetailsScreen({
    required this.params,
    super.key,
  });

  final VerificationDetailsParams params;

  static const route = rVerificationDetails;

  @override
  State<VerificationDetailsScreen> createState() => _ScreenState();
}

class _ScreenState extends State<VerificationDetailsScreen> {
  final _verifyCubit = PutVerificationCubit();

  /// Getter for the parameters.
  ///
  ProfileModel get _profile => widget.params.profile;

  /// Getter for the role.
  ///
  AppRoleEnum get _role => AppRoleEnum.fromString(_profile.role);

  /// Method handle the approve button pressed.
  ///
  void _onApprovePressed() {
    final profileId = _profile.id;

    //  Call the cubit to approve the account
    _verifyCubit.run(profileId: profileId, isApproved: true);
  }

  /// Method handle the reject button pressed.
  ///
  void _onRejectPressed() {
    final profileId = _profile.id;

    //  Call the cubit to reject the account
    _verifyCubit.run(profileId: profileId, isApproved: false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _verifyCubit,
      child: BlocListener<PutVerificationCubit, CubitState>(
        listener: (context, verifyState) {
          if (verifyState is CubitStateLoading) {
            //  Show the loading dialog
            LoadingDialog.show(context);
          }

          if (verifyState is CubitStateFailed) {
            //  Hide the loading dialog
            LoadingDialog.hide(context);

            //  Get the state failures
            final failure = verifyState.failure;

            //  Show the error message
            AppSnackBar.error(context).show(failure.message);
          }

          if (verifyState is CubitStateSuccess<bool>) {
            //  Hide the loading dialog
            LoadingDialog.hide(context);

            //  Get the verification result
            final isApproved = verifyState.value;

            //  Check if the account is approved or not and show the message
            if (isApproved) {
              AppSnackBar.success(context).show('Account has been verified');
            } else {
              AppSnackBar.success(context).show('Account has been rejected');
            }

            //  Pop the screen with the result
            context.pop(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Details'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _DetailsTitle(title: 'Profile'),
                  const Gap(8),
                  _DetailsCard(
                    label: 'First Name',
                    value: _profile.firstName,
                  ),
                  const Gap(8),
                  _DetailsCard(
                    label: 'Last Name',
                    value: _profile.lastName,
                  ),
                  const Gap(8),
                  _DetailsCard(
                    label: 'Email',
                    value: _profile.email,
                  ),
                  const Gap(8),
                  _DetailsCard(
                    label: 'Phone',
                    value: _profile.phone,
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      if (_profile.age != null) ...[
                        Expanded(
                          child: _DetailsCard(
                            label: 'Age',
                            value: _profile.age.toString(),
                          ),
                        ),
                        const Gap(8),
                      ],
                      if (_profile.gender != null) ...[
                        Expanded(
                          child: _DetailsCard(
                            label: 'Gender',
                            value: _profile.gender!,
                          ),
                        ),
                      ],
                    ],
                  ),
                  //  Show address details if the role is user.
                  if (_role == AppRoleEnum.user) ...[
                    const Gap(16),
                    const _DetailsTitle(title: 'Address'),
                    const Gap(8),
                    _DetailsCard(
                      label: 'Country',
                      value: _profile.country ?? 'N/A',
                    ),
                    const Gap(8),
                    _DetailsCard(
                      label: 'Region',
                      value: _profile.region ?? 'N/A',
                    ),
                    const Gap(8),
                    _DetailsCard(
                      label: 'Province',
                      value: _profile.province ?? 'N/A',
                    ),
                    const Gap(8),
                    _DetailsCard(
                      label: 'Municipality',
                      value: _profile.municipality ?? 'N/A',
                    ),
                  ],
                  //  Show business details if the role is owner.
                  if (_role == AppRoleEnum.owner) ...[
                    const Gap(16),
                    const _DetailsTitle(title: 'Business'),
                    const Gap(8),
                    if (_profile.validation == null) ...[
                      Center(
                        child: Text(
                          'No validation details',
                          style: textStyle12w600,
                        ),
                      ),
                    ] else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _DetailsValidationCard(
                            label: 'Front ID',
                            path: _profile.validation?.idFront ?? '',
                          ),
                          _DetailsValidationCard(
                            label: 'Back ID',
                            path: _profile.validation?.idBack ?? '',
                          ),
                        ],
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _DetailsValidationCard(
                            label: 'Front Permit',
                            path: _profile.validation?.permitFront ?? '',
                          ),
                          _DetailsValidationCard(
                            label: 'Back Permit',
                            path: _profile.validation?.permitBack ?? '',
                          ),
                        ],
                      ),
                      const Gap(8),
                      Center(
                        child: _DetailsValidationCard(
                          label: 'Formal Picture',
                          path: _profile.validation?.formalPicture ?? '',
                        ),
                      ),
                    ],
                  ],
                  const Gap(32),
                  Row(
                    children: [
                      Expanded(
                        child: RoundedButton(
                          onPressed: _onApprovePressed,
                          label: 'Approve',
                        ),
                      ),
                      const Gap(8),
                      Expanded(
                        child: RoundedButton(
                          onPressed: _onRejectPressed,
                          backgroundColor: colorError500,
                          label: 'Reject',
                        ),
                      ),
                    ],
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

///{@template _DetailsTitle}
/// Title for the details of the account to be verified.
///{@endtemplate}
class _DetailsTitle extends StatelessWidget {
  ///{@macro _DetailsTitle}
  const _DetailsTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle10w600,
    );
  }
}

///{@template VerificationDetailsCard}
/// Card for the details of the account to be verified.
///{@endtemplate}
class _DetailsCard extends StatelessWidget {
  ///{@macro _DetailsCard}
  const _DetailsCard({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textStyle12w600,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

///{@template _DetailsBusinessCard}
/// Card for the business image details of the account to be verified.
///{@endtemplate}
class _DetailsValidationCard extends StatelessWidget {
  ///{@macro _DetailsBusinessCard}
  const _DetailsValidationCard({
    required this.label,
    required this.path,
  });

  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: textStyle12w600,
        ),
        GestureDetector(
          onTap: () => _DetailsImageDialog.show(context, path),
          child: Container(
            height: 90,
            width: 140,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                path,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///{@template _DetailsImageDialog}
/// Dialog to show the image in full screen.
///{@endtemplate}
class _DetailsImageDialog extends StatelessWidget {
  ///{@macro _DetailsImageDialog}
  const _DetailsImageDialog({
    required this.path,
  });

  final String path;

  /// Method to show the image dialog.
  ///
  static void show(BuildContext context, String path) {
    showDialog<Widget>(
      context: context,
      builder: (context) => _DetailsImageDialog(
        path: path,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
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
              child: CachedNetworkImage(
                imageUrl: path,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return CircularProgressIndicator(
                    value: downloadProgress.progress,
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
