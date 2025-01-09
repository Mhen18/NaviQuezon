import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/blocs/municipality_list_get_cubit.dart';
import 'package:naviquezon/src/core/blocs/province_list_get_cubit.dart';
import 'package:naviquezon/src/core/blocs/region_list_get_cubit.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/constants/enums/gender_enums.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/border_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/country_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/municipality_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/province_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/region_dropdown.dart';
import 'package:naviquezon/src/core/widgets/scaffolds/background_scaffold.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/authentication/login/presentation/screens/login_screen.dart';
import 'package:naviquezon/src/features/authentication/registration/application/blocs/push_registration_cubit.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/province_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/region_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/registration_model.dart';
import 'package:naviquezon/src/features/authentication/registration/presentation/screens/registration_validation_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_discover_screen.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/terms_and_conditions.dart';

///{@template RegistrationScreen}
/// Screen for the registration.
///{@endtemplate}
class RegistrationScreen extends StatefulWidget {
  ///{@macro RegistrationScreen}
  const RegistrationScreen({super.key});

  static const route = rRegistration;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _registrationCubit = PushRegistrationCubit();

  final _regionCubit = RegionListGetCubit();
  final _provinceCubit = ProvinceListGetCubit();
  final _municipalityCubit = MunicipalityListGetCubit();

  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();

  final _role = ValueNotifier<AppRoleEnum>(AppRoleEnum.user);
  final _gender = ValueNotifier<GenderEnums?>(null);
  final _country = ValueNotifier<String?>(null);
  final _region = ValueNotifier<RegionModel?>(null);
  final _province = ValueNotifier<ProvinceModel?>(null);
  final _municipality = ValueNotifier<MunicipalityModel?>(null);

  /// Getter to get the registration model.
  ///
  RegistrationModel get _registration {
    final gender = _gender.value?.value ?? GenderEnums.none.value;
    final country = _country.value ?? sPhilippines;
    final region = _region.value?.name ?? '';
    final province = _province.value?.name ?? sQuezonProvince;
    final municipality = _municipality.value?.name ?? '';

    //  Create the registration model.
    return RegistrationModel(
      email: _emailController.text,
      password: _passwordController.text,
      phone: _phoneController.text,
      firstName: _fNameController.text,
      lastName: _lNameController.text,
      age: int.parse(_ageController.text),
      gender: gender,
      country: country,
      region: region,
      province: province,
      municipality: municipality,
      role: _role.value.value,
    );
  }

  /// Getter to check if the form is valid.
  ///
  bool get _valid {
    final validProfile = _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _fNameController.text.isNotEmpty &&
        _lNameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _gender.value != null;

    //  Check if the role is owner.
    if (_role.value == AppRoleEnum.user) {
      //  Check if the country is the Philippines.
      if (_country.value == sPhilippines) {
        return validProfile &&
            _country.value != null &&
            _region.value != null &&
            _municipality.value != null &&
            _province.value != null;
      }

      return validProfile && _country.value != null;
    } else if (_role.value == AppRoleEnum.owner) {
      return validProfile && _municipality.value != null;
    }

    return validProfile && _municipality.value != null;
  }

  @override
  void initState() {
    super.initState();

    //  Initialize the blocs.
    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  ///
  void _initBlocs() {
    _regionCubit.run();
  }

  /// Method to show the terms and condition dialog.
  ///
  void _showTermsAndConditionDialog() {
    showDialog<_RegistrationTermsAndConditionDialog>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _RegistrationTermsAndConditionDialog(
          onAcceptPressed: () {
            //  Close the dialog.
            Navigator.pop(context);

            //  Run the registration cubit.
            _registrationCubit.run(registration: _registration);
          },
        );
      },
    );
  }

  /// Method to handle the next button.
  ///
  void _onNextPressed() {
    //  Remove the focus from the text fields.
    FocusScope.of(context).unfocus();

    //  Show the terms and condition dialog.
    _showTermsAndConditionDialog();
  }

  /// Method to handle the role dropdown changed.
  ///
  void _onRoleChanged(AppRoleEnum? role) {
    if (role == _role.value) return;

    _role.value = role ?? AppRoleEnum.user;

    _municipalityCubit.reset();
    _provinceCubit.reset();

    setState(() {
      _region.value = null;
      _province.value = null;
      _municipality.value = null;

      //  Reset the address dropdowns.
      if (_role.value == AppRoleEnum.owner) {
        _country.value = sPhilippines;
        _municipalityCubit.run('045600000');
      } else {
        _country.value = null;
      }
    });
  }

  /// Method to handle the gender dropdown changed.
  ///
  void _onGenderChanged(GenderEnums? gender) {
    _gender.value = gender ?? GenderEnums.none;
    setState(() {});
  }

  /// Method to handle the country dropdown changed.
  ///
  void _onCountryChanged(String? country) {
    setState(() {
      _country.value = country ?? sPhilippines;
    });

    if (_country.value != sPhilippines) {
      _region.value = null;
      _province.value = null;
      _provinceCubit.reset();
      _municipality.value = null;
      _municipalityCubit.reset();
    }
  }

  /// Method to handle the region dropdown changed.
  ///
  void _onRegionChanged(RegionModel? region) {
    //  Check if the current region is not the same.
    if (_region.value != region) {
      _region.value = region;

      //  Reset the province and municipality.
      _province.value = null;
      _municipality.value = null;

      //  Reset the municipality cubit state.
      _municipalityCubit.reset();

      //  Run province cubit.
      _provinceCubit.run(region?.code ?? '');
    }
    setState(() {});
  }

  /// Method to handle the province dropdown changed.
  ///
  void _onProvinceChanged(ProvinceModel? province) {
    //  Check if the current province is not the same.
    if (_province.value != province) {
      _province.value = province;

      //  Reset the municipality.
      _municipality.value = null;

      //  Run the municipality cubit.
      _municipalityCubit.run(province?.code ?? '');
    }
    setState(() {});
  }

  /// Method to handle the municipality dropdown changed.
  ///
  void _onMunicipalityChanged(MunicipalityModel? municipality) {
    //  Check if the current municipality is not the same.
    if (_municipality.value != municipality) {
      _municipality.value = municipality;
    }

    setState(() {});
  }

  /// Method to handle the text changed.
  ///
  void _onTextChanged(String value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _registrationCubit,
        ),
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
      child: BlocListener<PushRegistrationCubit, CubitState>(
        listener: (context, registrationState) {
          if (registrationState is CubitStateLoading) {
            //  Show the loading dialog.
            LoadingDialog.show(context);
          }

          if (registrationState is CubitStateFailed) {
            final failure = registrationState.failure;

            //  Close the dialog.
            LoadingDialog.hide(context);

            //  Show the error message.
            AppSnackBar.error(context).show(failure.message);
          }

          if (registrationState is CubitStateSuccess<ProfileModel?>) {
            //  Close the dialog.
            LoadingDialog.hide(context);

            //  Get the role from the registration.
            final role = AppRoleEnum.fromString(_registration.role);

            //  Check if the role is owner.
            if (role == AppRoleEnum.owner) {
              //  Navigate to the registration validation screen.
              context.push(
                RegistrationValidationScreen.route,
                extra: RegistrationValidationScreenParams(
                  registration: _registration,
                ),
              );
            } else {
              //  Show the success message.
              AppSnackBar.success(context).show('Registration successful.');

              //  Get the profile from the state.
              final profile = registrationState.value;

              if (profile != null) {
                final profileRole = AppRoleEnum.fromString(profile.role);

                //  Emit the role.
                context.read<AppRoleCubit>().emitRole(profileRole);

                //  Emit the profile
                context.read<ProfileGetCubit>().emitProfile(profile);

                //  Check the role.
                switch (profileRole) {
                  case AppRoleEnum.user:
                    //  Navigate to the dashboard screen.
                    context.go(EstablishmentDiscoverScreen.route);
                  case AppRoleEnum.superAdmin:
                  case AppRoleEnum.admin:
                  case AppRoleEnum.owner:
                    //  Navigate to the login screen.
                    context.go(LoginScreen.route);
                }
              }
            }
          }
        },
        child: BackgroundScaffold.keyboard(
          builder: (context, visible, role) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: visible
                          ? 0.0
                          : MediaQuery.of(context).size.height - kToolbarHeight,
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
                              _RoleDropdown(
                                onChanged: _onRoleChanged,
                                value: _role.value,
                              ),
                              const Gap(8),
                              RoundedTextField(
                                onChanged: _onTextChanged,
                                controller: _emailController,
                                label: 'Email',
                                hint: 'Email',
                              ),
                              const Gap(8),
                              RoundedTextField(
                                onChanged: _onTextChanged,
                                controller: _passwordController,
                                label: 'Password',
                                hint: 'Password',
                                obscureText: true,
                              ),
                              const Gap(8),
                              RoundedTextField(
                                onChanged: _onTextChanged,
                                controller: _phoneController,
                                label: 'Phone Number',
                                hint: 'Phone Number',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(11),
                                ],
                              ),
                              const Gap(8),
                              RoundedTextField(
                                onChanged: _onTextChanged,
                                controller: _fNameController,
                                label: 'First Name',
                                hint: 'First Name',
                              ),
                              const Gap(8),
                              RoundedTextField(
                                onChanged: _onTextChanged,
                                controller: _lNameController,
                                label: 'Last Name',
                                hint: 'Last Name',
                              ),
                              const Gap(8),
                              Row(
                                children: [
                                  Expanded(
                                    child: RoundedTextField(
                                      onChanged: _onTextChanged,
                                      controller: _ageController,
                                      label: 'Age',
                                      hint: 'Age',
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                    ),
                                  ),
                                  const Gap(12),
                                  Expanded(
                                    child: _GenderDropdown(
                                      onChanged: _onGenderChanged,
                                      value: _gender.value,
                                    ),
                                  ),
                                ],
                              ),
                              _AddressDropdown(
                                role: _role.value,
                                country: _country.value,
                                onCountryChanged: _onCountryChanged,
                                regionCubit: _regionCubit,
                                region: _region.value,
                                onRegionChanged: _onRegionChanged,
                                provinceCubit: _provinceCubit,
                                province: _province.value,
                                onProvinceChanged: _onProvinceChanged,
                                municipality: _municipality.value,
                                municipalityCubit: _municipalityCubit,
                                onMunicipalityChanged: _onMunicipalityChanged,
                              ),
                            ],
                          ),
                        ),
                        const Gap(12),
                        RoundedButton(
                          onPressed: _valid ? _onNextPressed : null,
                          label: 'Next',
                        ),
                      ],
                    ),
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

///{@template _AddressDropdown}
/// List of dropdowns for the address registration.
///{@endtemplate}
class _AddressDropdown extends StatelessWidget {
  ///{@macro _AddressDropdown}
  const _AddressDropdown({
    required AppRoleEnum role,
    required String? country,
    required void Function(String?) onCountryChanged,
    required RegionListGetCubit regionCubit,
    required RegionModel? region,
    required void Function(RegionModel?) onRegionChanged,
    required ProvinceListGetCubit provinceCubit,
    required ProvinceModel? province,
    required void Function(ProvinceModel?) onProvinceChanged,
    required MunicipalityListGetCubit municipalityCubit,
    required MunicipalityModel? municipality,
    required void Function(MunicipalityModel?) onMunicipalityChanged,
  })  : _role = role,
        _onMunicipalityChanged = onMunicipalityChanged,
        _municipality = municipality,
        _municipalityCubit = municipalityCubit,
        _provinceCubit = provinceCubit,
        _onProvinceChanged = onProvinceChanged,
        _province = province,
        _regionCubit = regionCubit,
        _onRegionChanged = onRegionChanged,
        _region = region,
        _onCountryChanged = onCountryChanged,
        _country = country;

  final AppRoleEnum _role;
  final String? _country;
  final void Function(String?) _onCountryChanged;
  final RegionListGetCubit _regionCubit;
  final RegionModel? _region;
  final void Function(RegionModel?) _onRegionChanged;
  final ProvinceListGetCubit _provinceCubit;
  final ProvinceModel? _province;
  final void Function(ProvinceModel?) _onProvinceChanged;
  final MunicipalityListGetCubit _municipalityCubit;
  final MunicipalityModel? _municipality;
  final void Function(MunicipalityModel?) _onMunicipalityChanged;

  /// Getter for the address notes.
  ///
  String get _addressNotes {
    if (_role == AppRoleEnum.owner) {
      return 'Please specify which municipality of Quezon Province you '
          'came from.';
    }

    if (_country == sPhilippines) {
      return 'Please specify which municipality, region, and province you '
          'came from.';
    }

    return 'Please specify which country you came from.';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        const Divider(),
        Text(
          _addressNotes,
          textAlign: TextAlign.center,
        ),
        const Gap(10),
        if (_role == AppRoleEnum.user) ...[
          Row(
            children: [
              Expanded(
                child: CountryDropdown(
                  country: _country,
                  onCountryChanged: _onCountryChanged,
                ),
                // child: BorderDropdown<String>(
                //   value: _country,
                //   items: Countries.list.map((country) {
                //     return DropdownMenuItem(
                //       value: country.name,
                //       child: Text(country.name),
                //     );
                //   }).toList(),
                //   hint: 'Select Country',
                //   onChanged: _onCountryChanged,
                //   label: 'Country',
                // ),
              ),
              if (_country == sPhilippines) ...[
                const Gap(12),
                Expanded(
                  child: RegionDropdown(
                    bloc: _regionCubit,
                    onChanged: _onRegionChanged,
                    value: _region,
                  ),
                ),
              ],
            ],
          ),
          if (_country == sPhilippines) ...[
            const Gap(8),
          ],
        ],
        if (_country == sPhilippines) ...[
          Row(
            children: [
              if (_role == AppRoleEnum.user) ...[
                Expanded(
                  child: ProvinceDropdown(
                    bloc: _provinceCubit,
                    onChanged: _onProvinceChanged,
                    value: _province,
                  ),
                ),
                const Gap(12),
              ],
              Expanded(
                child: MunicipalityDropdown(
                  bloc: _municipalityCubit,
                  onChanged: _onMunicipalityChanged,
                  value: _municipality,
                  isFiltered: _role == AppRoleEnum.owner,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

///{@template _RoleDropdown}
/// Dropdown for the list of roles.
///{@endtemplate}
class _RoleDropdown extends StatelessWidget {
  ///{@macro _RoleDropdown}
  const _RoleDropdown({
    required this.onChanged,
    required this.value,
  });

  final void Function(AppRoleEnum?) onChanged;
  final AppRoleEnum? value;

  @override
  Widget build(BuildContext context) {
    return BorderDropdown<AppRoleEnum>(
      value: value,
      items: const [
        DropdownMenuItem(
          value: AppRoleEnum.owner,
          child: Text(
            'Owner',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DropdownMenuItem(
          value: AppRoleEnum.user,
          child: Text(
            'User',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      hint: 'Select Role',
      onChanged: onChanged,
      label: 'Role',
    );
  }
}

///{@template _GenderDropdown}
/// Dropdown for the list of genders.
///{@endtemplate}
class _GenderDropdown extends StatelessWidget {
  ///{@macro _GenderDropdown}
  const _GenderDropdown({
    required this.onChanged,
    required this.value,
  });

  final void Function(GenderEnums?) onChanged;
  final GenderEnums? value;

  @override
  Widget build(BuildContext context) {
    return BorderDropdown<GenderEnums>(
      value: value,
      items: GenderEnums.values.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(
            e.value,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      hint: 'Select Gender',
      onChanged: onChanged,
      label: 'Gender',
    );
  }
}
//
// ///{@template _RegionDropdown}
// /// Dropdown for the list of regions.
// ///{@endtemplate}
// class _RegionDropdown extends StatelessWidget {
//   ///{@macro _RegionDropdown}
//   const _RegionDropdown({
//     required this.onChanged,
//     required this.value,
//   });
//
//   final void Function(RegionModel?) onChanged;
//   final RegionModel? value;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchRegionListCubit, CubitState>(
//       builder: (context, regionState) {
//         if (regionState is CubitStateSuccess<List<RegionModel>>) {
//           final regionList = regionState.value;
//
//           return BorderDropdown<RegionModel>(
//             onChanged: onChanged,
//             value: value,
//             items: regionList.map((e) {
//               return DropdownMenuItem(
//                 value: e,
//                 child: Text(
//                   e.name,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               );
//             }).toList(),
//             label: 'Region',
//             hint: 'Select Region',
//           );
//         }
//
//         return BorderDropdown<RegionModel>(
//           hint: 'Select Region',
//           onChanged: onChanged,
//           label: 'Region',
//         );
//       },
//     );
//   }
// }
//
// ///{@template _ProvinceDropdown}
// /// Dropdown for the list of regions.
// ///{@endtemplate}
// class _ProvinceDropdown extends StatelessWidget {
//   ///{@macro _ProvinceDropdown}
//   const _ProvinceDropdown({
//     required this.onChanged,
//     required this.value,
//   });
//
//   final void Function(ProvinceModel?) onChanged;
//   final ProvinceModel? value;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchProvinceListCubit, CubitState>(
//       builder: (context, provinceState) {
//         if (provinceState is CubitStateSuccess<List<ProvinceModel>>) {
//           final provinceList = provinceState.value;
//
//           return BorderDropdown<ProvinceModel>(
//             onChanged: onChanged,
//             value: value,
//             items: provinceList.map((e) {
//               return DropdownMenuItem(
//                 value: e,
//                 child: Text(
//                   e.name,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               );
//             }).toList(),
//             label: 'Province',
//             hint: 'Select Province',
//           );
//         }
//
//         return BorderDropdown<ProvinceModel>(
//           hint: 'Select Province',
//           onChanged: onChanged,
//           label: 'Province',
//         );
//       },
//     );
//   }
// }

///{@template _RegistrationTermsAndConditionDialog}
/// Custom dialog for the terms and condition.
///{@endtemplate}
class _RegistrationTermsAndConditionDialog extends StatelessWidget {
  ///{@macro _RegistrationTermsAndConditionDialog}
  const _RegistrationTermsAndConditionDialog({
    required void Function() onAcceptPressed,
  }) : _onAcceptPressed = onAcceptPressed;

  final void Function() _onAcceptPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.blue,
            ),
            const Gap(8),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'By clicking "Accept", you agree to our ',
                  ),
                  TextSpan(
                    text: 'terms and conditions',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push(
                          TermsAndConditionsScreen.route,
                        );
                      },
                  ),
                ],
              ),
              style: const TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            RoundedButton(
              onPressed: _onAcceptPressed,
              label: 'Accept',
            ),
          ],
        ),
      ),
    );
  }
}
