import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/municipality_list_get_cubit.dart';
import 'package:naviquezon/src/core/blocs/province_list_get_cubit.dart';
import 'package:naviquezon/src/core/blocs/region_list_get_cubit.dart';
import 'package:naviquezon/src/core/models/address_model.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/extensions/datetime_extensions.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/core/widgets/app_bars/default_app_bar.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer_button.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/country_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/municipality_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/province_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/region_dropdown.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/province_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/region_model.dart';
import 'package:naviquezon/src/features/authentication/splash/presentation/screens/splash_screen.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_owner_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_survey_add_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_survey_model.dart';
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
  final _surveyCubit = EstablishmentSurveyAddCubit();

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

  /// Method to handle the survey button and show the bottom sheet.
  ///
  void _onSurveyPressed() {
    showModalBottomSheet<_SurveyBottomSheet>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      builder: (context) {
        return _SurveyBottomSheet(
          onSubmitPressed: _onSubmitSurveyPressed,
        );
      },
    );
  }

  /// Method to handle the submit survey button.
  ///
  void _onSubmitSurveyPressed(
    EstablishmentSurveyModel survey,
    AddressModel address,
  ) {
    _surveyCubit.run(
      survey: survey,
      address: address,
      establishmentId: _establishment?.id ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _establishmentCubit,
        ),
        BlocProvider(
          create: (context) => _surveyCubit,
        ),
      ],
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
        body: BlocListener<EstablishmentSurveyAddCubit, CubitState>(
          listener: (context, surveyState) {
            if (surveyState is CubitStateLoading) {
              //  Show the dialog.
              LoadingDialog.show(context);
            }

            if (surveyState is CubitStateFailed) {
              //  Close the dialog.
              LoadingDialog.hide(context);

              //  Show the error message.
              final failure = surveyState.failure;
              AppSnackBar.error(context).show(failure.message);
            }

            if (surveyState is CubitStateSuccess) {
              //  Close the dialog.
              LoadingDialog.hide(context);

              //  Show the success message.
              AppSnackBar.success(context).show(
                'Survey submitted successfully',
              );
            }
          },
          child: BlocBuilder<EstablishmentOwnerGetCubit, CubitState>(
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

              if (establishmentState
                  is CubitStateSuccess<EstablishmentModel?>) {
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
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: kToolbarHeight / 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              tooltip: 'Survey',
                              icon: const Icon(Icons.edit_note_sharp),
                              onPressed: _onSurveyPressed,
                            ),
                            IconButton(
                              tooltip: 'Profile',
                              icon: const Icon(Icons.account_circle),
                              onPressed: (){
                                Scaffold.of(context).openEndDrawer();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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

///{@template _SurveyBottomSheet}
/// Custom bottom sheet for the survey.
///{@endtemplate}
class _SurveyBottomSheet extends StatefulWidget {
  ///{@macro _SurveyBottomSheet}
  const _SurveyBottomSheet({
    required void Function(
      EstablishmentSurveyModel,
      AddressModel,
    ) onSubmitPressed,
  }) : _onSubmitPressed = onSubmitPressed;

  final void Function(EstablishmentSurveyModel, AddressModel) _onSubmitPressed;

  @override
  State<_SurveyBottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_SurveyBottomSheet> {
  final _dateController = TextEditingController();
  final _totalController = TextEditingController();
  final _femaleController = TextEditingController();
  final _maleController = TextEditingController();

  final _regionCubit = RegionListGetCubit();
  final _provinceCubit = ProvinceListGetCubit();
  final _municipalityCubit = MunicipalityListGetCubit();

  RegionModel? _region;
  ProvinceModel? _province;
  MunicipalityModel? _municipality;

  String? _totalErrorText;

  DateTime _dateTime = DateTime.now();

  String? _country;

  /// Getter for the validity of the form.
  ///
  bool get _valid {
    var isValidAddress = false;

    final hasCountry = _country != null;

    if (hasCountry) {
      if (_country == sPhilippines) {
        final hasRegion = _region != null;
        final hasProvince = _province != null;
        final hasMunicipality = _municipality != null;

        isValidAddress = hasRegion && hasProvince && hasMunicipality;
      } else {
        isValidAddress = true;
      }
    }

    return isValidAddress && _isValidTotal;
  }

  /// Getter for the validity of the total.
  ///
  bool get _isValidTotal {
    final hasTotal = _totalController.text.isNotEmpty;
    final hasFemale = _femaleController.text.isNotEmpty;
    final hasMale = _maleController.text.isNotEmpty;

    if (hasTotal && hasFemale && hasMale) {
      final total = int.parse(_totalController.text);
      final female = int.parse(_femaleController.text);
      final male = int.parse(_maleController.text);

      return (male + female) == total;
    }

    return false;
  }

  @override
  void initState() {
    super.initState();

    _dateController.text = _dateTime.formatDate();
  }

  Future<void> _showDatePicker() async {
    final datePicker = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      context: context,
    );

    if (datePicker != null) {
      setState(() {
        _dateController.text = datePicker.formatDate();
        _dateTime = datePicker;
      });
    }
  }

  void _onFemaleChanged(String value) {
    final male = _maleController.text;

    setState(() {
      if (value.isNotEmpty && male.isNotEmpty) {
        if (_isValidTotal) {
          _totalErrorText = null;
        } else {
          _totalErrorText = 'The value of female and male must be equal to '
              'the total visitors';
        }
      }
    });
  }

  void _onMaleChanged(String value) {
    final female = _femaleController.text;
    setState(() {
      if (value.isNotEmpty && female.isNotEmpty) {
        if (_isValidTotal) {
          _totalErrorText = null;
        } else {
          _totalErrorText = 'The value of female and male must be equal to '
              'the total visitors';
        }
      }
    });
  }

  void _onSubmitPressed() {
    if (_valid) {
      final dateText = _dateController.text;
      final dateFormat = DateFormat('MMM dd, yyyy').parse(dateText);
      final date = dateFormat.secondsSinceEpoch();

      final survey = EstablishmentSurveyModel.add(
        date: date,
        total: num.parse(_totalController.text),
        female: num.parse(_femaleController.text),
        male: num.parse(_maleController.text),
        country: _country ?? 'N/A',
        region: _region?.name,
        province: _province?.name,
        municipality: _municipality?.name,
      );

      final address = AddressModel(
        country: _country ?? 'N/A',
        region: _region,
        province: _province,
        municipality: _municipality,
      );

      context.pop();
      widget._onSubmitPressed(survey, address);
    }
  }

  /// Method to handle the country changed.
  ///
  void _onCountryChanged(String? country) {
    //  Set the country value.
    setState(() {
      _country = country;
    });

    //  Check if the country is Philippines.
    if (country == sPhilippines) {
      //  Run the region cubit.
      _regionCubit.run();
    }
  }

  /// Method to handle the region changed.
  ///
  void _onRegionChanged(RegionModel? province) {
    //  Set the region value.
    setState(() {
      _region = province;
    });

    //  Check if the province is not null.
    if (province != null) {
      //  Run the province cubit.
      _provinceCubit.run(province.code);
    }
  }

  /// Method to handle the province changed.
  ///
  void _onProvinceChanged(ProvinceModel? province) {
    //  Set the province value.
    setState(() {
      _province = province;
    });

    //  Check if the value is not null.
    if (province != null) {
      //
      _municipalityCubit.run(province.code);
    }
  }

  /// Method to handle the municipality changed.
  void _onMunicipalityChanged(MunicipalityModel? municipality) {
    setState(() {
      _municipality = municipality;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _regionCubit,
        ),
        BlocProvider(
          create: (context) => _provinceCubit,
        ),
        BlocProvider(
          create: (context) => _municipalityCubit,
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                RoundedTextField(
                  controller: _dateController,
                  label: 'When did they visit?',
                  readOnly: true,
                  suffixIcon: IconButton(
                    onPressed: _showDatePicker,
                    icon: const Icon(Icons.calendar_today),
                  ),
                ),
                RoundedTextField(
                  controller: _totalController,
                  label: 'Total Visitors',
                  errorText: _totalErrorText,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: RoundedTextField(
                        controller: _femaleController,
                        onChanged: _onFemaleChanged,
                        label: 'Female',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: RoundedTextField(
                        controller: _maleController,
                        onChanged: _onMaleChanged,
                        label: 'Male',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                CountryDropdown(
                  country: _country,
                  onCountryChanged: _onCountryChanged,
                ),
                if (_country == sPhilippines) ...[
                  RegionDropdown(
                    bloc: _regionCubit,
                    onChanged: _onRegionChanged,
                    value: _region,
                  ),
                  ProvinceDropdown(
                    bloc: _provinceCubit,
                    onChanged: _onProvinceChanged,
                    value: _province,
                  ),
                  MunicipalityDropdown(
                    bloc: _municipalityCubit,
                    onChanged: _onMunicipalityChanged,
                    value: _municipality,
                    isFiltered: false,
                  ),
                ],
                RoundedButton(
                  onPressed: _valid ? _onSubmitPressed : null,
                  label: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
