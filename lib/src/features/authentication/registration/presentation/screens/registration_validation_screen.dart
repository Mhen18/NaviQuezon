import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/image_picker_cubit.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/utils/constants/enums/image_picker_enums.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/dialogs/verification_dialog.dart';
import 'package:naviquezon/src/core/widgets/scaffolds/background_scaffold.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/features/authentication/registration/application/blocs/push_registration_cubit.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/registration_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/registration_validation_model.dart';

///{@template RegistrationValidationScreenParams}
/// Params for the [RegistrationValidationScreen].
///{@endtemplate}
class RegistrationValidationScreenParams {
  ///{@macro RegistrationValidationScreenParams}
  RegistrationValidationScreenParams({
    required this.registration,
  });

  final RegistrationModel registration;
}

///{@template RegistrationValidationScreen}
/// Screen that display the validation of the owner account.
///{@endtemplate}
class RegistrationValidationScreen extends StatefulWidget {
  ///{@macro RegistrationValidationScreen}
  const RegistrationValidationScreen({
    required this.params,
    super.key,
  });

  final RegistrationValidationScreenParams params;

  static const route = rValidation;

  @override
  State<RegistrationValidationScreen> createState() => _ScreenState();
}

class _ScreenState extends State<RegistrationValidationScreen> {
  final _registrationCubit = PushRegistrationCubit();

  String? _frontIdPath;
  String? _backIdPath;
  String? _frontPermitPath;
  String? _backPermitPath;
  String? _picturePath;

  /// Getter for the registration model params.
  ///
  RegistrationModel get _registration => widget.params.registration;

  /// Getter for the validation.
  ///
  bool get _valid {
    return _frontIdPath != null &&
        _backIdPath != null &&
        _frontPermitPath != null &&
        _backPermitPath != null &&
        _picturePath != null;
  }

  /// Method to handle the next button.
  ///
  void _onNextPressed() {
    final validation = RegistrationValidationModel(
      idFront: _frontIdPath ?? '',
      idBack: _backIdPath ?? '',
      permitFront: _frontPermitPath ?? '',
      permitBack: _backPermitPath ?? '',
      formalPicture: _picturePath ?? '',
    );

    _registrationCubit.run(
      registration: _registration.copyWith(
        validation: validation,
      ),
    );
  }

  /// Method to handle the front ID selected.
  ///
  void _onFrontIdSelected(String path) {
    setState(() {
      _frontIdPath = path;
    });
  }

  /// Method to handle the back ID selected.
  ///
  void _onBackIdSelected(String path) {
    setState(() {
      _backIdPath = path;
    });
  }

  /// Method to handle the front business permit selected.
  ///
  void _onFrontPermitSelected(String path) {
    setState(() {
      _frontPermitPath = path;
    });
  }

  /// Method to handle the back business permit selected.
  ///
  void _onBackPermitSelected(String path) {
    setState(() {
      _backPermitPath = path;
    });
  }

  /// Method to handle the back picture selected.
  ///
  void _onPictureSelected(String path) {
    setState(() {
      _picturePath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registrationCubit,
      child: BlocListener<PushRegistrationCubit, CubitState>(
        listener: (context, registrationState) {
          if (registrationState is CubitStateLoading) {
            //  Show the loading dialog.
            LoadingDialog.show(context);
          }

          if (registrationState is CubitStateFailed) {
            //  Close the dialog.
            LoadingDialog.hide(context);

            final failure = registrationState.failure;

            //  Show the error message.
            AppSnackBar.error(context).show(failure.message);
          }

          if (registrationState is CubitStateSuccess) {
            //  Close the dialog.
            LoadingDialog.hide(context);

            //  Show the success message.
            AppSnackBar.success(context).show('Registration successful.');

            //  Show the splash screen.
            VerificationDialog.show(context);
          }
        },
        child: BackgroundScaffold(
          body: (role) {
            return SingleChildScrollView(
              child: SafeArea(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context).size.height - kToolbarHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.icons.icOwner.image(
                        height: 80,
                        width: 80,
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text('Upload the following'),
                            const Gap(16),
                            const Text('Valid ID'),
                            const Gap(6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _ValidationImageCard(
                                  onImageSelected: _onFrontIdSelected,
                                  label: 'Front',
                                ),
                                const Gap(16),
                                _ValidationImageCard(
                                  onImageSelected: _onBackIdSelected,
                                  label: 'Back',
                                ),
                              ],
                            ),
                            const Gap(16),
                            const Divider(),
                            const Text('Business Permit'),
                            const Gap(6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _ValidationImageCard(
                                  onImageSelected: _onFrontPermitSelected,
                                  label: 'Front',
                                ),
                                const Gap(16),
                                _ValidationImageCard(
                                  onImageSelected: _onBackPermitSelected,
                                  label: 'Back',
                                ),
                              ],
                            ),
                            const Gap(16),
                            const Divider(),
                            const Text('Formal Picture'),
                            const Gap(6),
                            _ValidationImageCard(
                              onImageSelected: _onPictureSelected,
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
                      RoundedButton(
                        onPressed: _valid ? _onNextPressed : null,
                        label: 'Next',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

///{@template _ValidationImageCard}
/// Card for the uploading image.
///{@endtemplate}
class _ValidationImageCard extends StatefulWidget {
  ///{@macro _ValidationImageCard}
  const _ValidationImageCard({
    required this.onImageSelected,
    this.label,
  });

  final void Function(String) onImageSelected;
  final String? label;

  @override
  State<_ValidationImageCard> createState() => _ValidationImageCardState();
}

class _ValidationImageCardState extends State<_ValidationImageCard> {
  final _imagePickerCubit = ImagePickerCubit();

  /// Getter for the label.
  ///
  String? get _label => widget.label;

  /// Method to show bottom sheet to select image picker source.
  ///
  void _onCardPressed() {
    showBottomSheet(
      context: context,
      builder: (context) {
        return _ValidationImagePickerBottomSheet(
          onSourceSelected: _onSourceSelected,
        );
      },
    );
  }

  /// Method to handle the source selected.
  ///
  void _onSourceSelected(ImagePickerEnums source) {
    //  Close the bottom sheet.
    Navigator.pop(context);

    //  Run the image picker cubit.
    _imagePickerCubit.run(source);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _imagePickerCubit,
      child: GestureDetector(
        onTap: _onCardPressed,
        child: Container(
          height: 90,
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlocConsumer<ImagePickerCubit, CubitState>(
            listener: (context, pickerState) {
              if (pickerState is CubitStateSuccess<String>) {
                final path = pickerState.value;

                widget.onImageSelected(path);
              }

              if (pickerState is CubitStateFailed) {
                final failure = pickerState.failure;

                AppSnackBar.error(context).show(failure.message);
              }
            },
            builder: (context, pickerState) {
              if (pickerState is CubitStateSuccess<String>) {
                final path = File(pickerState.value);

                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    path,
                    fit: BoxFit.cover,
                  ),
                );
              }

              //  Show the label if available.
              if (_label != null) {
                return Center(
                  child: Text(
                    _label!,
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

///{@template _ValidationImagePickerBottomSheet}
/// Bottom sheet for the image picker.
///{@endtemplate}
class _ValidationImagePickerBottomSheet extends StatelessWidget {
  ///{@macro _ValidationImagePickerBottomSheet}
  const _ValidationImagePickerBottomSheet({
    required this.onSourceSelected,
  });

  final void Function(ImagePickerEnums) onSourceSelected;

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
          const Text('Select Image Source'),
          const Gap(16),
          RoundedButton(
            width: double.infinity,
            onPressed: () => onSourceSelected(ImagePickerEnums.camera),
            label: 'Camera',
          ),
          const Gap(16),
          RoundedButton(
            width: double.infinity,
            onPressed: () => onSourceSelected(ImagePickerEnums.gallery),
            label: 'Gallery',
          ),
        ],
      ),
    );
  }
}
