import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/containers/profile_image_container.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_update_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template ProfileEditScreen}
/// Screen for editing the profile.
///{@endtemplate}
class ProfileEditScreen extends StatefulWidget {
  ///{@macro ProfileEditScreen}
  const ProfileEditScreen({super.key});

  static const route = rProfileEdit;

  @override
  State<ProfileEditScreen> createState() => _ScreenState();
}

class _ScreenState extends State<ProfileEditScreen> {
  final _updateCubit = ProfileUpdateCubit();

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String? _imagePath;
  String? _imageUrl;

  /// Getter to check if the form is valid.
  ///
  bool get _valid {
    if (_profile != null) {
      final fName = fNameController.text;
      final lName = lNameController.text;
      final email = emailController.text;
      final phone = phoneController.text;

      final fieldIsNotEmpty = fName.isNotEmpty &&
          lName.isNotEmpty &&
          email.isNotEmpty &&
          phone.isNotEmpty;

      final fieldIsChanged = _profile?.firstName != fName ||
          _profile?.lastName != lName ||
          _profile?.email != email ||
          _profile?.phone != phone ||
          _profile?.image != _imagePath;

      return fieldIsNotEmpty && fieldIsChanged;
    }

    return false;
  }

  /// Getter for the image placeholder.
  ///
  String get _imagePlaceholder {
    final roleState = context.read<AppRoleCubit>().state;

    switch (roleState) {
      case AppRoleEnum.superAdmin:
      case AppRoleEnum.admin:
        return Assets.images.icons.icAdmin.keyName;
      case AppRoleEnum.owner:
        return Assets.images.icons.icOwner.keyName;
      case AppRoleEnum.user:
        return Assets.images.icons.icUser.keyName;
    }
  }

  /// Getter for the profile model.
  ///
  ProfileModel? get _profile {
    final profileState = context.read<ProfileGetCubit>().state;

    if (profileState is CubitStateSuccess<ProfileModel>) {
      return profileState.value;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    _initProfile();
  }

  /// Method to initialize the profile.
  ///
  void _initProfile() {
    if (_profile != null) {
      fNameController.text = _profile?.firstName ?? '';
      lNameController.text = _profile?.lastName ?? '';
      emailController.text = _profile?.email ?? '';
      phoneController.text = _profile?.phone ?? '';
      _imageUrl = _profile?.image;
    }
  }

  /// Handle the image picker button pressed.
  ///
  void _pickImage(ImageSource source) {
    ImagePicker().pickImage(source: source, imageQuality: 80).then((value) {
      if (value != null) {
        setState(() {
          _imagePath = value.path;
          _imageUrl = null;
        });
      }
    });
  }

  /// Method to handle the camera button pressed.
  ///
  void _onCameraPressed() {
    showModalBottomSheet<_ProfilePickerBottomSheet>(
      context: context,
      builder: (context) {
        return _ProfilePickerBottomSheet(
          onCameraSelected: () => _pickImage(ImageSource.camera),
          onGallerySelected: () => _pickImage(ImageSource.gallery),
        );
      },
    );
  }

  /// Method to handle the save button pressed.
  ///
  void _onSavePressed() {
    final profile = _profile;

    if (profile != null) {
      final fName = fNameController.text.isNotEmpty
          ? fNameController.text
          : profile.firstName;

      final lName = lNameController.text.isNotEmpty
          ? lNameController.text
          : profile.lastName;

      final email = emailController.text.isNotEmpty
          ? emailController.text
          : profile.email;

      final phone = phoneController.text.isNotEmpty
          ? phoneController.text
          : profile.phone;

      final image = _imagePath ?? profile.image;

      final newProfile = profile.copyWith(
        firstName: fName,
        lastName: lName,
        email: email,
        phone: phone,
        image: image,
      );

      _updateCubit.run(newProfile);
    }
  }

  /// Method to handle the field changed.
  ///
  void _onFieldChanged(String value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _updateCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          actions: [
            TextButton(
              onPressed: _valid ? _onSavePressed : null,
              child: const Text('Save'),
            ),
          ],
        ),
        body: BlocListener<ProfileUpdateCubit, CubitState>(
          listener: (context, updateState) {
            if (updateState is CubitStateLoading) {
              //  Show loading indicator
              LoadingDialog.show(context);
            }

            if (updateState is CubitStateFailed) {
              //  Show error dialog
              LoadingDialog.hide(context);

              //  Show error message
              final failure = updateState.failure;
              AppSnackBar.error(context).show(failure.message);
            }

            if (updateState is CubitStateSuccess<ProfileModel>) {
              //  Show success dialog
              LoadingDialog.hide(context);

              //  Update the profile
              final profile = updateState.value;
              context.read<ProfileGetCubit>().emitProfile(profile);

              //  Show success message
              AppSnackBar.success(context).show('Profile updated');

              //  Pop the screen
              context.pop();
            }
          },
          child: BlocConsumer<ProfileGetCubit, CubitState>(
            listener: (context, profileState) {
              if (profileState is CubitStateSuccess<ProfileModel>) {
                final profile = profileState.value;

                if (profile.image != null) {
                  setState(() {
                    _imageUrl = profile.image;
                  });
                }
              }
            },
            builder: (context, profileState) {
              if (profileState is CubitStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (profileState is CubitStateFailed) {}

              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ProfileImageContainer(
                              imagePlaceHolder: _imagePlaceholder,
                              imagePath: _imagePath,
                              imageUrl: _imageUrl,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: _ProfileImageButton(
                                onCameraPressed: _onCameraPressed,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      RoundedTextField(
                        controller: fNameController,
                        label: 'First Name',
                        onChanged: _onFieldChanged,
                      ),
                      const Gap(8),
                      RoundedTextField(
                        controller: lNameController,
                        label: 'Last Name',
                        onChanged: _onFieldChanged,
                      ),
                      const Gap(8),
                      RoundedTextField(
                        controller: emailController,
                        label: 'Email',
                        onChanged: _onFieldChanged,
                      ),
                      const Gap(8),
                      RoundedTextField(
                        controller: phoneController,
                        label: 'Phone Number',
                        onChanged: _onFieldChanged,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

///{@template _ProfilePickerBottomSheet}
/// Bottom sheet for the image picker.
///{@endtemplate}
class _ProfilePickerBottomSheet extends StatelessWidget {
  ///{@macro _ProfilePickerBottomSheet}
  const _ProfilePickerBottomSheet({
    required void Function() onGallerySelected,
    void Function()? onCameraSelected,
  })  : _onCameraSelected = onCameraSelected,
        _onGallerySelected = onGallerySelected;

  final void Function() _onGallerySelected;
  final void Function()? _onCameraSelected;

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
          const Text('Select Source'),
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
        ],
      ),
    );
  }
}

///{@template _ProfileImageButton}
/// Custom button for the profile image.
///{@endtemplate}
class _ProfileImageButton extends StatelessWidget {
  ///{@macro _ProfileImageButton}
  const _ProfileImageButton({
    required void Function() onCameraPressed,
  }) : _onCameraPressed = onCameraPressed;

  final void Function() _onCameraPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onCameraPressed,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            border: Border(),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.camera_alt_outlined,
            size: 16,
          ),
        ),
      ),
    );
  }
}
