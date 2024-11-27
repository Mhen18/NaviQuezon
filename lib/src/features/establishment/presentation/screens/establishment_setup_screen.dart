import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_setup_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_add_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';

///{@template EstablishmentSetupScreen}
/// Screen to setup an establishment.
///{@endtemplate}
class EstablishmentSetupScreen extends StatefulWidget {
  ///{@macro EstablishmentSetupScreen}
  const EstablishmentSetupScreen({
    super.key,
  }) : _establishment = null;

  ///{@macro EstablishmentSetupScreen.edit}
  const EstablishmentSetupScreen.edit({
    required EstablishmentModel establishment,
    super.key,
  }) : _establishment = establishment;

  final EstablishmentModel? _establishment;

  static const route = rEstablishmentSetup;

  @override
  State<EstablishmentSetupScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentSetupScreen> {
  final _establishmentCubit = EstablishmentSetupCubit();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _categoryController = TextEditingController();

  LatLng? latLng;

  EstablishmentModel? get _establishment => widget._establishment;

  @override
  void initState() {
    super.initState();

    //  Check if the establishment is not null.
    if (_establishment != null) {
      final lat = _establishment?.latitude.toDouble() ?? 0.0;
      final long = _establishment?.longitude.toDouble() ?? 0.0;

      //  Set the values of the establishment.
      _nameController.text = _establishment?.name ?? '';
      _addressController.text = _establishment?.address ?? '';
      _descriptionController.text = _establishment?.description ?? '';
      _phoneNumberController.text = _establishment?.contactNumber ?? '';
      _categoryController.text = _establishment?.categories.join(', ') ?? '';
      latLng = LatLng(lat, long);
    }
  }

  /// Method to check if the establishment is valid.
  bool get _valid {
    return _nameController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _categoryController.text.isNotEmpty &&
        latLng != null;
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      this.latLng = latLng;
    });
  }

  /// Method to handle the save pressed.
  void _onSavePressed() {
    final categories =
        _categoryController.text.split(',').map((e) => e.trim()).toList();

    //  Create the establishment model.
    final establishment = EstablishmentAddModel(
      name: _nameController.text,
      ownerId: _establishment?.ownerId,
      description: _descriptionController.text,
      address: _addressController.text,
      contactNumber: _phoneNumberController.text,
      categories: categories,
      latitude: latLng?.latitude ?? 0,
      longitude: latLng?.longitude ?? 0,
    );

    //  Check if the establishment is null.
    if (_establishment == null) {
      //  Run the establishment cubit to add the establishment.
      _establishmentCubit.run(
        establishmentAdd: establishment,
      );
    } else {
      //  Run the establishment cubit to edit the establishment.
      _establishmentCubit.run(
        establishment: _establishment?.copyWith(
          name: _nameController.text,
          description: _descriptionController.text,
          address: _addressController.text,
          contactNumber: _phoneNumberController.text,
          categories: categories,
          latitude: latLng?.latitude ?? 0,
          longitude: latLng?.longitude ?? 0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _establishmentCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Establishment Setup'),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<EstablishmentSetupCubit, CubitState>(
              listener: (context, setupState) {
                if (setupState is CubitStateLoading) {
                  //  Show the loading dialog.
                  LoadingDialog.show(context);
                }

                if (setupState is CubitStateFailed) {
                  //  Show the error dialog.
                  LoadingDialog.hide(context);

                  //  Show the error message.
                  final failure = setupState.failure;
                  AppSnackBar.error(context).show(failure.message);
                }

                if (setupState is CubitStateSuccess) {
                  //  Show the error dialog.
                  LoadingDialog.hide(context);

                  //  Show the success message.
                  AppSnackBar.success(context).show(
                    'Establishment added successfully.',
                  );

                  //  Pop the screen with success result.
                  context.pop(true);
                }
              },
            ),
          ],
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        RoundedTextField(
                          controller: _nameController,
                          label: 'Name',
                          hint: 'Name',
                        ),
                        const Gap(8),
                        RoundedTextField(
                          controller: _descriptionController,
                          label: 'Description',
                          hint: 'Description',
                        ),
                        const Gap(8),
                        RoundedTextField(
                          controller: _phoneNumberController,
                          label: 'Phone Number',
                          hint: 'Phone Number',
                          keyboardType: TextInputType.phone,
                        ),
                        const Gap(8),
                        RoundedTextField(
                          controller: _categoryController,
                          label: 'Category',
                          hint: 'Category',
                          subLabel: '(eg. Hotel, Restaurant, Resort)',
                        ),
                        const Gap(8),
                        RoundedTextField(
                          controller: _addressController,
                          label: 'Address',
                          hint: 'Address',
                        ),
                        const Gap(16),
                        _SetupMapWidget(
                          onMapTapped: _onMapTapped,
                          latLng: latLng,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: RoundedButton(
                  onPressed: _valid ? _onSavePressed : null,
                  label: 'Save Establishment',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///{@template _SetupMapWidget}
/// Custom widget for the place picker.
///{@endtemplate}
class _SetupMapWidget extends StatefulWidget {
  ///{@macro _SetupMapWidget}
  const _SetupMapWidget({
    required void Function(LatLng) onMapTapped,
    LatLng? latLng,
  })  : _onMapTapped = onMapTapped,
        _latLng = latLng;

  final void Function(LatLng) _onMapTapped;
  final LatLng? _latLng;

  @override
  State<_SetupMapWidget> createState() => _SetupMapWidgetState();
}

class _SetupMapWidgetState extends State<_SetupMapWidget> {
  Marker? _marker;

  @override
  void initState() {
    super.initState();

    if (widget._latLng != null) {
      _marker = Marker(
        markerId: const MarkerId('1'),
        position: widget._latLng!,
      );
    }
  }

  /// Method to handle the map tapped.
  ///
  void _onMapTapped(LatLng latLng) {
    setState(() {
      _marker = Marker(
        markerId: const MarkerId('1'),
        position: latLng,
      );
    });

    //  Call the on map tapped callback.
    widget._onMapTapped(latLng);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pin Location',
          style: textStyle12w600,
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: FutureBuilder(
            future: Geolocator.getCurrentPosition(),
            builder: (context, AsyncSnapshot<Position> snapshot) {
              //  Default latitude and longitude [CSTC]
              var lat = 13.9648961;
              var long = 121.5273711;

              if (snapshot.hasData) {
                final position = snapshot.data;
                if (position != null) {
                  lat = position.latitude;
                  long = position.longitude;
                }
              }

              if (_marker != null) {
                lat = _marker!.position.latitude;
                long = _marker!.position.longitude;
              }

              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    lat,
                    long,
                  ),
                  zoom: 15,
                ),
                tiltGesturesEnabled: false,
                myLocationEnabled: true,
                markers: _marker != null ? {_marker!} : {},
                mapToolbarEnabled: false,
                onTap: _onMapTapped,
              );
            },
          ),
        ),
      ],
    );
  }
}
