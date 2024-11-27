import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_setup_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_amenity_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';

///{@template EstablishmentSetupAmenityScreen}
/// Screen for displaying the list of establishment's amenities.
///{@endtemplate}
class EstablishmentSetupAmenityScreen extends StatefulWidget {
  ///{@macro EstablishmentSetupAmenityScreen}
  const EstablishmentSetupAmenityScreen({
    required EstablishmentModel establishment,
    super.key,
  }) : _establishment = establishment;

  final EstablishmentModel _establishment;

  static const route = rEstablishmentSetupAmenity;

  @override
  State<EstablishmentSetupAmenityScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentSetupAmenityScreen> {
  final _establishmentCubit = EstablishmentSetupCubit();

  final _selectedAmenities = <EstablishmentAmenityModel>[];

  /// Getter for the establishment
  ///
  EstablishmentModel get _establishment => widget._establishment;

  /// Getter for the validation to enable or disable the save button.
  ///
  bool get _valid {
    return !listEquals(_establishment.amenities, _selectedAmenities);
  }

  @override
  void initState() {
    super.initState();

    _selectedAmenities.addAll(_establishment.amenities ?? []);
  }

  /// Method to handle the add amenity pressed
  ///
  void _onAddAmenityPressed({EstablishmentAmenityModel? amenity}) {
    showModalBottomSheet<_SetupBottomSheet>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _SetupBottomSheet(
          value: amenity?.name,
          onAddPressed: (amenity) {
            setState(() {
              final newAmenity = EstablishmentAmenityModel(
                name: amenity,
              );

              _selectedAmenities.add(newAmenity);

              printSuccess(_selectedAmenities);
            });
          },
        );
      },
    );
  }

  /// Method to handle the save pressed
  ///
  void _onSavePressed() {
    if (!listEquals(_establishment.amenities, _selectedAmenities)) {
      final establishment = _establishment.copyWith(
        amenities: _selectedAmenities,
      );

      _establishmentCubit.run(establishment: establishment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _establishmentCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Amenities'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _onAddAmenityPressed,
            ),
          ],
        ),
        body: BlocListener<EstablishmentSetupCubit, CubitState>(
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
                'Amenities added successfully.',
              );

              //  Pop the screen with success result.
              context.pop(true);
            }
          },
          child: Builder(
            builder: (context) {
              if (_selectedAmenities.isEmpty) {
                return const Center(
                  child: Text('No amenities found'),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: _selectedAmenities.length,
                        separatorBuilder: (context, index) {
                          return const Gap(8);
                        },
                        itemBuilder: (context, index) {
                          final amenity = _selectedAmenities[index];

                          return _AmenityContainer(
                            onEditPressed: () => _onAddAmenityPressed(
                              amenity: amenity,
                            ),
                            onDeletePressed: () {
                              setState(() {
                                _selectedAmenities.removeAt(index);
                              });
                            },
                            onFreeChanged: (onChanged) {
                              setState(() {
                                _selectedAmenities[index] = amenity.copyWith(
                                  isFree: onChanged,
                                );
                              });
                            },
                            onPopularChanged: (onChanged) {
                              setState(() {
                                _selectedAmenities[index] = amenity.copyWith(
                                  isPopular: onChanged,
                                );
                              });
                            },
                            name: amenity.name,
                            isFree: amenity.isFree ?? false,
                            isPopular: amenity.isPopular ?? false,
                          );
                        },
                      ),
                    ),
                    const Gap(16),
                    RoundedButton(
                      onPressed: _valid ? _onSavePressed : null,
                      label: 'Save',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

///{@template _AmenityContainer}
/// Custom container for the amenity.
///{@endtemplate}
class _AmenityContainer extends StatelessWidget {
  ///{@macro _AmenityContainer}
  const _AmenityContainer({
    required void Function() onEditPressed,
    required void Function() onDeletePressed,
    required void Function(bool?) onFreeChanged,
    required void Function(bool?) onPopularChanged,
    required String name,
    required bool isFree,
    required bool isPopular,
  })  : _isPopular = isPopular,
        _isFree = isFree,
        _name = name,
        _onPopularChanged = onPopularChanged,
        _onFreeChanged = onFreeChanged,
        _onDeletePressed = onDeletePressed,
        _onEditPressed = onEditPressed;

  final void Function() _onEditPressed;
  final void Function() _onDeletePressed;
  final ValueChanged<bool?> _onFreeChanged;
  final ValueChanged<bool?> _onPopularChanged;
  final String _name;
  final bool _isFree;
  final bool _isPopular;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: _onEditPressed,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_name),
                  ),
                  const Gap(16),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _SetupCheckbox(
                            onChanged: _onFreeChanged,
                            value: _isFree,
                            label: 'Free',
                          ),
                          const Gap(8),
                          _SetupCheckbox(
                            onChanged: _onPopularChanged,
                            value: _isPopular,
                            label: 'Popular',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const Gap(8),
        IconButton(
          onPressed: _onDeletePressed,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}

class _SetupBottomSheet extends StatefulWidget {
  const _SetupBottomSheet({
    required void Function(String) onAddPressed,
    String? value,
  })  : _onAddPressed = onAddPressed,
        _value = value;

  final void Function(String) _onAddPressed;
  final String? _value;

  @override
  State<_SetupBottomSheet> createState() => _SetupBottomSheetState();
}

class _SetupBottomSheetState extends State<_SetupBottomSheet> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget._value != null) {
      _controller.text = widget._value ?? '';
    }
  }

  /// Getter for the validation to enable or disable the save button.
  ///
  bool get _valid {
    //  Check if the value is not null and the controller text is not empty
    if (widget._value != null && _controller.text.isNotEmpty) {
      //  Return if the controller text is not equal to the existing value
      return _controller.text != widget._value;
    }

    //  Return if the controller text is not empty
    return _controller.text.isNotEmpty;
  }

  /// Getter for the title.
  ///
  String get _title => widget._value == null ? 'Add Amenity' : 'Edit Amenity';

  /// Getter for the button text.
  ///
  String get _buttonText => widget._value == null ? 'Add' : 'Edit';

  /// Method to handle the add pressed.
  ///
  void _onAddPressed() {
    if (_controller.text.isEmpty) return;

    //  Add the amenity
    widget._onAddPressed(_controller.text);

    //  Close the bottom sheet
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(16),
            Text(
              _title,
              style: textStyle16w600,
            ),
            const Gap(16),
            RoundedTextField(
              controller: _controller,
              onChanged: (value) => setState(() {}),
              hint: 'Amenity',
            ),
            const Gap(16),
            RoundedButton(
              label: _buttonText,
              onPressed: _valid ? _onAddPressed : null,
            ),
          ],
        ),
      ),
    );
  }
}

///{@template _AmenityDropdown}
/// Custom dropdown for the amenity.
///{@endtemplate}
class _AmenityTextField extends StatefulWidget {
  ///{@macro _AmenityDropdown}
  const _AmenityTextField({
    required void Function(String) onChanged,
    String? value,
  })  : _onChanged = onChanged,
        _value = value;

  final void Function(String) _onChanged;
  final String? _value;

  @override
  State<_AmenityTextField> createState() => _DropdownState();
}

class _DropdownState extends State<_AmenityTextField> {
  final _controller = TextEditingController();

  /// Getter for the title.
  ///
  String get _title => widget._value == null ? 'Add Amenity' : 'Edit Amenity';

  @override
  void initState() {
    super.initState();

    if (widget._value != null) {
      _controller.text = widget._value ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(16),
        Text(
          _title,
          style: textStyle16w600,
        ),
        const Gap(16),
        RoundedTextField(
          controller: _controller,
          onChanged: widget._onChanged,
          hint: 'Amenity',
        ),
      ],
    );
  }
}

class _SetupCheckbox extends StatelessWidget {
  const _SetupCheckbox({
    required ValueChanged<bool?> onChanged,
    required bool value,
    required String label,
  })  : _onChanged = onChanged,
        _value = value,
        _label = label;

  final ValueChanged<bool?> _onChanged;
  final bool _value;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onChanged(!_value),
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                value: _value,
                onChanged: _onChanged,
              ),
            ),
            const Gap(4),
            Text(_label),
          ],
        ),
      ),
    );
  }
}
