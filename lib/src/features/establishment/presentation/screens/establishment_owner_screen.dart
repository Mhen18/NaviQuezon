import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/app_bars/default_app_bar.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer_button.dart';
import 'package:naviquezon/src/features/authentication/splash/presentation/screens/splash_screen.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_owner_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_setup_amenity_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_setup_assets_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_setup_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_image.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_info.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/profile_edit_screen.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/profile_password_edit_screen.dart';

///{@template EstablishmentOwnerScreen}
/// Screen for displaying the list of amenities.
///{@endtemplate}
class EstablishmentOwnerScreen extends StatefulWidget {
  ///{@macro EstablishmentOwnerScreen}
  const EstablishmentOwnerScreen({super.key});

  static const route = rEstablishment;

  @override
  State<EstablishmentOwnerScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentOwnerScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _establishmentCubit = EstablishmentOwnerGetCubit();

  ///  Getter for the image height
  ///
  double get _imageHeight => MediaQuery.of(context).size.height * 0.3;

  /// Getter for the establishment
  ///
  EstablishmentModel? get _establishment {
    //  Get the state of the establishment owner get cubit.
    final state = _establishmentCubit.state;

    //  Check if the state is a success state.
    if (state is CubitStateSuccess<EstablishmentModel?>) {
      //  Return the value of the state.
      return state.value;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits
  ///
  void _initBlocs() {
    _establishmentCubit.run();
  }

  /// Method to handle the profile pressed.
  ///
  void _onProfilePressed() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  /// Method to handle the add establishment pressed.
  ///
  void _onAddEstablishmentPressed() {
    //  Navigate to the establishment setup screen and wait for the result.
    context.push(EstablishmentSetupScreen.route).then((isSuccess) {
      //  Check if the isSuccess is null.
      if (isSuccess == null) return;
      //  Check if the isSuccess is not a boolean.
      if (isSuccess is! bool) return;

      if (isSuccess == true) {
        _establishmentCubit.run();
      }
    });
  }

  /// Method to handle the edit pressed.
  ///
  void _onEditPressed() {
    showDialog<_EditDialog>(
      context: context,
      builder: (context) {
        return _EditDialog(
          onAddRemoveAssetsPressed: _onAddRemoveAssetsPressed,
          onAmenitiesPressed: _onAmenitiesPressed,
          onInformationPressed: _onInformationPressed,
        );
      },
    );
  }

  /// Method to handle the add remove assets pressed.
  ///
  void _onAddRemoveAssetsPressed() {
    //  Close the dialog.
    context.pop();

    //  Navigate to the establishment setup screen and wait for the result.
    context
        .push(EstablishmentSetupAssetsScreen.route, extra: _establishment)
        .then((isSuccess) {
      //  Check if the isSuccess is null.
      if (isSuccess == null) return;
      //  Check if the isSuccess is not a boolean.
      if (isSuccess is! bool) return;

      if (isSuccess == true) {
        _establishmentCubit.run();
      }
    });
  }

  /// Method to handle the amenities pressed.
  ///
  void _onAmenitiesPressed() {
    //  Close the dialog.
    context.pop();

    //  Check if the establishment is null.
    if (_establishment == null) return;

    //  Navigate to the establishment setup amenity screen and wait for
    //  the result.
    context
        .push(EstablishmentSetupAmenityScreen.route, extra: _establishment)
        .then((isSuccess) {
      //  Check if the isSuccess is null.
      if (isSuccess == null) return;
      //  Check if the isSuccess is not a boolean.
      if (isSuccess is! bool) return;

      if (isSuccess == true) {
        _establishmentCubit.run();
      }
    });
  }

  /// Method to handle the information pressed.
  ///
  void _onInformationPressed() {
    //  Close the dialog.
    context.pop();

    //  Check if the establishment is null.
    if (_establishment == null) return;

    //  Navigate to the establishment setup screen and wait for the result.
    context
        .push(EstablishmentSetupScreen.route, extra: _establishment)
        .then((isSuccess) {
      //  Check if the isSuccess is null.
      if (isSuccess == null) return;
      //  Check if the isSuccess is not a boolean.
      if (isSuccess is! bool) return;

      if (isSuccess == true) {
        _establishmentCubit.run();
      }
    });
  }

  /// Method to handle the edit profile pressed.
  ///
  void _onEditProfilePressed() {
    context.push(ProfileEditScreen.route);
  }

  /// Method to handle the edit password pressed.
  ///
  void _onEditPasswordPressed() {
    context.push(ProfilePasswordEditScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _establishmentCubit,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<EstablishmentOwnerGetCubit, CubitState>(
            builder: (context, estaState) {
              if (estaState is CubitStateSuccess<EstablishmentModel?>) {
                final establishment = estaState.value;

                if (establishment == null) {
                  return DefaultAppBar(onProfilePressed: _onProfilePressed);
                }
              }

              return const SizedBox();
            },
          ),
        ),
        key: _scaffoldKey,
        endDrawer: _OwnerDrawer(
          onEditProfilePressed: _onEditProfilePressed,
          onEditPasswordPressed: _onEditPasswordPressed,
          onLogoutPressed: () {
            context.go(SplashScreen.route);
          },
        ),
        body: BlocBuilder<EstablishmentOwnerGetCubit, CubitState>(
          builder: (context, establishmentState) {
            if (establishmentState is CubitStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (establishmentState is CubitStateFailed) {
              final failure = establishmentState.failure;

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(failure.message),
                    const Gap(16),
                    RoundedButton(
                      onPressed: _establishmentCubit.run,
                      label: 'Retry',
                    ),
                  ],
                ),
              );
            }

            if (establishmentState is CubitStateSuccess<EstablishmentModel?>) {
              final establishment = establishmentState.value;

              if (establishment == null) {
                return Center(
                  child: RoundedButton(
                    onPressed: _onAddEstablishmentPressed,
                    label: 'Add Establishment',
                  ),
                );
              }

              return Stack(
                children: [
                  DetailsImage(
                    imageHeight: _imageHeight,
                    images: establishment.images ?? [],
                    video: establishment.video ?? '',
                  ),
                  EstablishmentDetailsInfo.owner(
                    onEditInfoPressed: _onEditPressed,
                    establishment: establishment,
                    imageHeight: _imageHeight,
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

///{@template _EditDialog}
/// Custom dialog for editing the establishment information.
///{@endtemplate}
class _EditDialog extends StatelessWidget {
  ///{@macro _EditDialog}
  const _EditDialog({
    required void Function() onAddRemoveAssetsPressed,
    required void Function() onAmenitiesPressed,
    required void Function() onInformationPressed,
  })  : _onInformationPressed = onInformationPressed,
        _onAmenitiesPressed = onAmenitiesPressed,
        _onAddRemoveAssetsPressed = onAddRemoveAssetsPressed;

  final void Function() _onAddRemoveAssetsPressed;
  final void Function() _onAmenitiesPressed;
  final void Function() _onInformationPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select what you want to edit.',
              style: textStyle14w600,
            ),
            const Gap(30),
            RoundedButton(
              onPressed: _onAddRemoveAssetsPressed,
              width: double.infinity,
              label: 'Add / remove photo and video',
              labelAlign: TextAlign.center,
            ),
            const Gap(16),
            RoundedButton(
              onPressed: _onAmenitiesPressed,
              width: double.infinity,
              label: 'Amenities',
              labelAlign: TextAlign.center,
            ),
            const Gap(16),
            RoundedButton(
              onPressed: _onInformationPressed,
              width: double.infinity,
              label: 'Information',
              labelAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

///{@template _OwnerDrawer}
/// Custom drawer for the owner.
///{@endtemplate}
class _OwnerDrawer extends StatelessWidget {
  ///{@macro _OwnerDrawer}
  const _OwnerDrawer({
    required void Function() onEditProfilePressed,
    required void Function() onEditPasswordPressed,
    required void Function() onLogoutPressed,
  })  : _onEditProfilePressed = onEditProfilePressed,
        _onEditPasswordPressed = onEditPasswordPressed,
        _onLogoutPressed = onLogoutPressed;

  final void Function() _onEditProfilePressed;
  final void Function() _onEditPasswordPressed;
  final void Function() _onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultDrawer(
      buttonList: [
        DefaultDrawerButton(
          onPressed: _onEditProfilePressed,
          icon: Icons.account_circle,
          text: 'Edit Profile',
        ),
        DefaultDrawerButton(
          onPressed: _onEditPasswordPressed,
          icon: Icons.password,
          text: 'Edit Password',
        ),
        DefaultDrawerButton(
          onPressed: _onLogoutPressed,
          icon: Icons.logout,
          text: 'Logout',
        ),
      ],
    );
  }
}
