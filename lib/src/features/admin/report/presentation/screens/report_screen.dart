import 'package:country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/blocs/municipality_list_get_cubit.dart';
import 'package:naviquezon/src/core/blocs/province_list_get_cubit.dart';
import 'package:naviquezon/src/core/blocs/region_list_get_cubit.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/constants/enums/tourist_type.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/core/widgets/app_bars/default_app_bar.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/containers/box_label_container.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/municipality_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/province_dropdown.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/region_dropdown.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/admin/accounts/presentation/screens/account_manage_screen.dart';
import 'package:naviquezon/src/features/admin/report/application/blocs/report_download_cubit.dart';
import 'package:naviquezon/src/features/admin/report/presentation/widgets/admin_drawer.dart';
import 'package:naviquezon/src/features/admin/verification/presentation/verification_screen.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/province_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/region_model.dart';
import 'package:naviquezon/src/features/authentication/splash/presentation/screens/splash_screen.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_list_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_report_model.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/profile_edit_screen.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/profile_password_edit_screen.dart';
import 'package:naviquezon/src/features/user/faq/presentation/screens/faq_setup_screen.dart';

///{@template ReportScreen}
/// Screen for the admin to see the report of the app
///{@endtemplate}
class ReportScreen extends StatefulWidget {
  ///{@macro ReportScreen}
  const ReportScreen({super.key});

  static const route = rReport;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _estaCubit = EstablishmentListGetCubit();
  final _reportCubit = ReportDownloadCubit();

  final _regionCubit = RegionListGetCubit();
  final _provinceCubit = ProvinceListGetCubit();
  final _municipalityCubit = MunicipalityListGetCubit();

  RegionModel? _filterRegion;
  ProvinceModel? _filterProvince;

  TouristType _tourist = TouristType.local;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime _filterDateTime = DateTime.now();
  String _municipality = 'Sariaya';

  String get _monthYear {
    return DateFormat('MMMM yyyy').format(_filterDateTime);
  }

  AppRoleEnum get _role {
    return context.read<AppRoleCubit>().state;
  }

  @override
  void initState() {
    super.initState();

    _initMunicipality();
    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  ///
  void _initBlocs() {
    _estaCubit.run();
    _regionCubit.run();
  }

  /// Method to initialize the municipality.
  ///
  void _initMunicipality() {
    //  Check if the role is admin.
    if (_role == AppRoleEnum.admin) {
      //  Get the profile state.
      final profileState = context.read<ProfileGetCubit>().state;

      //  Check if the profile state is success.
      if (profileState is CubitStateSuccess<ProfileModel>) {
        //  Get the profile from the value.
        final profile = profileState.value;

        //  Set the municipality to the profile municipality.
        _municipality = profile.municipality ?? 'Sariaya';
      }
    }
  }

  /// Method to handle the profile pressed.
  ///
  void _onProfilePressed() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  void _onConfirmPressed(
    DateTime date,
    String municipality,
    TouristType tourist,
  ) {
    setState(() {
      _filterDateTime = date;
      _municipality = municipality;
      _tourist = tourist;
    });
  }

  /// Method to handle the edit pressed.
  ///
  void _onEditPressed() {
    context.pop();

    showModalBottomSheet<_ReportFilterBottomSheet>(
      context: context,
      builder: (context) {
        return _ReportFilterBottomSheet(
          onConfirmPressed: _onConfirmPressed,
          initialDate: _filterDateTime,
          municipality: _municipality,
          tourist: _tourist,
        );
      },
    );
  }

  /// Method to handle the verify account pressed.
  ///
  void _onVerifyPressed() {
    context.push(VerificationScreen.route);
  }

  /// Method to handle the FAQ setup pressed.
  ///
  void _onFaqSetupPressed() {
    context.push(FaqSetupScreen.route);
  }

  /// Method to handle the manage pressed.
  ///
  void _onManagePressed() {
    context.push(AccountManageScreen.route);
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

  /// Method to handle the logout pressed.
  ///
  void _onLogoutPressed() {
    context.go(SplashScreen.route);
  }

  /// Method to handle the download pressed.
  ///
  void _onDownloadPressed(List<EstablishmentModel> establishmentList) {
    final reportDownload = ReportDownloadParams(
      establishmentList: establishmentList,
      dateTime: _filterDateTime,
      municipality: _municipality,
    );

    _reportCubit.run(
      params: reportDownload,
    );
  }

  /// Method to handle the region changed.
  ///
  void _onRegionChanged(RegionModel? region) {
    setState(() {
      _filterRegion = region;
      _filterProvince = null;
    });

    _provinceCubit.run(region?.code ?? '');
  }

  /// Method to handle the province changed.
  ///
  void _onProvinceChanged(ProvinceModel? province) {
    setState(() {
      _filterProvince = province;
    });

    _municipalityCubit.run(province?.code ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _estaCubit,
        ),
        BlocProvider(
          create: (context) => _reportCubit,
        ),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: AdminDrawer(
          role: _role,
          onEditPressed: _onEditPressed,
          onVerifyPressed: _onVerifyPressed,
          onFaqSetupPressed: _onFaqSetupPressed,
          onManagePressed: _onManagePressed,
          onEditProfilePressed: _onEditProfilePressed,
          onEditPasswordPressed: _onEditPasswordPressed,
          onLogoutPressed: _onLogoutPressed,
        ),
        appBar: DefaultAppBar(
          onProfilePressed: _onProfilePressed,
        ),
        body: BlocListener<ReportDownloadCubit, CubitState>(
          listener: (context, reportState) {
            if (reportState is CubitStateLoading) {
              //  Show the loading dialog.
              LoadingDialog.show(context);
            }

            if (reportState is CubitStateFailed) {
              //  Hide the loading dialog.
              LoadingDialog.hide(context);

              //  Get the failure message.
              final message = reportState.failure.message;

              //  Show the error snackBar.
              AppSnackBar.error(context).show(message);
            }

            if (reportState is CubitStateSuccess) {
              //  Hide the loading dialog.
              LoadingDialog.hide(context);

              //  Show the success snackBar.
              AppSnackBar.success(context).show(
                'Report generated as excel downloaded successfully',
              );
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Expanded(
                child: BlocBuilder<EstablishmentListGetCubit, CubitState>(
                  builder: (context, estaState) {
                    if (estaState is CubitStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (estaState is CubitStateFailed) {
                      final failure = estaState.failure;
                      return ErrorStateContainer(
                        message: failure.message,
                        onPressed: _estaCubit.run,
                      );
                    }

                    if (estaState is CubitStateSuccess) {
                      final value = estaState.value;
                      final list = value as List<EstablishmentModel>;
                      final filteredList = list.where((element) {
                        return element.municipality == _municipality;
                      }).toList();
                      final length = filteredList.length;

                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_tourist == TouristType.local) ...[
                                Column(
                                  spacing: 8,
                                  children: [
                                    RegionDropdown(
                                      bloc: _regionCubit,
                                      onChanged: _onRegionChanged,
                                      value: _filterRegion,
                                    ),
                                    ProvinceDropdown(
                                      bloc: _provinceCubit,
                                      onChanged: _onProvinceChanged,
                                      value: _filterProvince,
                                    ),
                                  ],
                                ),
                              ],
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Tourism Attraction Visitor Record',
                                      style: textStyle16w700,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => _onDownloadPressed(
                                      filteredList,
                                    ),
                                    icon: const Icon(
                                      Icons.download,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(8),
                              if (_role == AppRoleEnum.superAdmin) ...[
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: 'Municipality: '),
                                      TextSpan(
                                        text: _municipality,
                                        style: textStyle16w600,
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(8),
                              ],
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: 'Month/Year: '),
                                    TextSpan(
                                      text: _monthYear,
                                      style: textStyle16w600,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(16),
                              if (_tourist == TouristType.local) ...[
                                if (_filterRegion == null) ...[
                                  const Gap(24),
                                  Center(
                                    child: Text(
                                      'Select a Region',
                                      style: textStyle16w400,
                                    ),
                                  ),
                                ] else if (_filterProvince == null) ...[
                                  const Gap(24),
                                  Center(
                                    child: Text(
                                      'Select a Province',
                                      style: textStyle16w400,
                                    ),
                                  ),
                                ] else ...[
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      spacing: 16,
                                      children: List.generate(length, (index) {
                                        final esta = filteredList[index];

                                        return _ReportMunicipalityForm(
                                          cubit: _municipalityCubit,
                                          esta: esta,
                                          reportList: esta.report ?? [],
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ],
                              if (_tourist == TouristType.foreign) ...[
                                // SizedBox(
                                //   width: MediaQuery.of(context).size.width,
                                //   child: SingleChildScrollView(
                                //     scrollDirection: Axis.horizontal,
                                //     child: SizedBox(
                                //       width: MediaQuery.of(context).size.width,
                                //       child: ListView.builder(
                                //         physics: const NeverScrollableScrollPhysics(), // Disable ListView's scrolling
                                //         shrinkWrap: true,
                                //         itemCount: length,
                                //         itemBuilder: (context, index) {
                                //           final esta = filteredList[index];
                                //           return _ReportForeignForm(
                                //             esta: esta,
                                //             reportList: esta.report ?? [],
                                //           );
                                //         },
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    spacing: 16,
                                    children: List.generate(length, (index) {
                                      final esta = filteredList[index];

                                      return RepaintBoundary(
                                        child: _ReportForeignForm(
                                          esta: esta,
                                          reportList: esta.report ?? [],
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///{@template _ReportFilterBottomSheet}
/// Custom widget for the report filter bottom sheet
///{@endtemplate}
class _ReportFilterBottomSheet extends StatefulWidget {
  const _ReportFilterBottomSheet({
    required void Function(DateTime, String, TouristType) onConfirmPressed,
    required DateTime initialDate,
    required String municipality,
    required TouristType tourist,
  })  : _onConfirmPressed = onConfirmPressed,
        _municipality = municipality,
        _initialDate = initialDate,
        _tourist = tourist;

  final void Function(DateTime, String, TouristType) _onConfirmPressed;
  final DateTime _initialDate;
  final String _municipality;
  final TouristType _tourist;

  @override
  State<_ReportFilterBottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_ReportFilterBottomSheet> {
  final _municipalityCubit = MunicipalityListGetCubit();
  final _dateController = TextEditingController();
  final _municipality = ValueNotifier<MunicipalityModel?>(null);

  late TouristType _tourist;

  /// Getter for the role.
  AppRoleEnum get _role {
    return context.read<AppRoleCubit>().state;
  }

  // /// Getter if the form is valid.
  // bool get _valid {
  //   final municipality = _municipality.value?.name;
  //   final validMunicipality = municipality != widget._municipality;
  //   final validDate = _dateFormat(widget._initialDate) != _dateController.text;
  //
  //   return validMunicipality || validDate;
  // }

  /// String method for the date format.
  ///
  String _dateFormat(DateTime dateTime) {
    return DateFormat('MMMM yyyy').format(dateTime);
  }

  @override
  void initState() {
    super.initState();

    _municipalityCubit.run(sQuezonProvinceCode);
    _dateController.text = _dateFormat(widget._initialDate);
    _tourist = widget._tourist;
  }

  /// Method to handle the select date pressed.
  ///
  void _onSelectDatePressed() {
    showMonthPicker(
      context: context,
      initialDate: widget._initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((dateTime) {
      if (dateTime != null) {
        setState(() {
          final dateFormat = _dateFormat(dateTime);
          _dateController.text = dateFormat;
        });
      }
    });
  }

  void _onConfirmPressed() {
    final date = DateFormat('MMMM yyyy').parse(_dateController.text);
    final municipality = _municipality.value?.name ?? widget._municipality;

    widget._onConfirmPressed(date, municipality, _tourist);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _municipalityCubit,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<MunicipalityListGetCubit, CubitState>(
          listener: (context, municipalityState) {
            if (municipalityState is CubitStateSuccess) {
              final value = municipalityState.value;
              final list = value as List<MunicipalityModel>;

              final municipality = list.firstWhere(
                (element) => element.name == widget._municipality,
                orElse: () => list.first,
              );

              setState(() {
                _municipality.value = municipality;
              });
            }
          },
          builder: (context, municipalityState) {
            if (municipalityState is CubitStateLoading) {
              return const Wrap(
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }

            if (municipalityState is CubitStateFailed) {
              return ErrorStateContainer(
                message: municipalityState.failure.message,
                onPressed: () => _municipalityCubit.run(
                  sQuezonProvinceCode,
                ),
              );
            }

            if (municipalityState is CubitStateSuccess) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoundedButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.black,
                    labelColor: Colors.black,
                    onPressed: () {
                      setState(() {
                        _tourist = _tourist == TouristType.local
                            ? TouristType.foreign
                            : TouristType.local;
                      });
                    },
                    label: _tourist == TouristType.local
                        ? 'Foreign Country Residence'
                        : 'Local Residence',
                  ),
                  if (_role == AppRoleEnum.superAdmin) ...[
                    const Gap(16),
                    MunicipalityDropdown(
                      onChanged: (value) {
                        setState(() {
                          _municipality.value = value;
                        });
                      },
                      value: _municipality.value,
                      bloc: _municipalityCubit,
                    ),
                    const Gap(16),
                  ],
                  RoundedTextField(
                    controller: _dateController,
                    label: 'Month/Year',
                    suffixIcon: IconButton(
                      onPressed: _onSelectDatePressed,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ),
                  const Gap(16),
                  RoundedButton(
                    onPressed: _onConfirmPressed,
                    label: 'Confirm',
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

///{@template _ReportMunicipalityForm}
/// Custom widget for the report municipality form
///{@endtemplate}
class _ReportMunicipalityForm extends StatelessWidget {
  ///{@macro _ReportMunicipalityForm}
  const _ReportMunicipalityForm({
    required EstablishmentModel esta,
    required List<EstablishmentReportModel> reportList,
    required MunicipalityListGetCubit cubit,
  })  : _esta = esta,
        _reportList = reportList,
        _cubit = cubit;

  final EstablishmentModel _esta;
  final List<EstablishmentReportModel> _reportList;
  final MunicipalityListGetCubit _cubit;

  /// Getter for the box height.
  ///
  double get _boxHeight {
    return 40;
  }

  /// Num method to get the total female tourist.
  ///
  num _female(MunicipalityModel municipality) {
    num total = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        if (report.municipality == municipality.name) {
          total = total + report.female;
        }
      }
    }

    return total;
  }

  /// Num method to get the total male tourist.
  ///
  num _male(MunicipalityModel municipality) {
    num total = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        if (report.municipality == municipality.name) {
          total = total + report.male;
        }
      }
    }

    return total;
  }

  /// Num method to get the total tourist.
  ///
  num _total(MunicipalityModel municipality) {
    num total = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        if (report.municipality == municipality.name) {
          total = total + report.total;
        }
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final municipalityWidth = MediaQuery.sizeOf(context).width * 0.5;

    return BlocBuilder<MunicipalityListGetCubit, CubitState>(
      bloc: _cubit,
      builder: (context, municipalityState) {
        if (municipalityState is CubitStateSuccess<List<MunicipalityModel>>) {
          final municipalityList = municipalityState.value;
          return Row(
            children: [
              BoxLabelContainer(
                name: _esta.name,
                width: municipalityWidth,
                textAlign: TextAlign.center,
                backgroundColor: color1363DF,
                height: _boxHeight * (municipalityList.length + 2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxLabelContainer(
                    name: 'Local',
                    width: municipalityWidth,
                    textAlign: TextAlign.center,
                    backgroundColor: color1363DF,
                    height: _boxHeight,
                  ),
                  BoxLabelContainer(
                    name: 'Municipality',
                    width: municipalityWidth,
                    textAlign: TextAlign.center,
                    backgroundColor: color1363DF,
                    height: _boxHeight,
                  ),
                  ...municipalityList.map((municipality) {
                    return BoxLabelContainer(
                      name: municipality.name,
                      width: municipalityWidth,
                      textAlign: TextAlign.center,
                      height: _boxHeight,
                    );
                  }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxLabelContainer(
                    name: 'Tourist Arrival',
                    width: municipalityWidth,
                    textAlign: TextAlign.center,
                    backgroundColor: color1363DF,
                    height: _boxHeight,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BoxLabelContainer(
                        name: 'F',
                        width: municipalityWidth / 3,
                        textAlign: TextAlign.center,
                        backgroundColor: color1363DF,
                        height: _boxHeight,
                      ),
                      BoxLabelContainer(
                        name: 'M',
                        width: municipalityWidth / 3,
                        textAlign: TextAlign.center,
                        backgroundColor: color1363DF,
                        height: _boxHeight,
                      ),
                      BoxLabelContainer(
                        name: 'Total',
                        width: municipalityWidth / 3,
                        textAlign: TextAlign.center,
                        backgroundColor: color1363DF,
                        height: _boxHeight,
                      ),
                    ],
                  ),
                  ...municipalityList.map((municipality) {
                    final female = _female(municipality);
                    final male = _male(municipality);
                    final total = _total(municipality);

                    return Row(
                      children: [
                        BoxLabelContainer(
                          name: female.toString(),
                          width: municipalityWidth / 3,
                          textAlign: TextAlign.center,
                          height: _boxHeight,
                        ),
                        BoxLabelContainer(
                          name: male.toString(),
                          width: municipalityWidth / 3,
                          textAlign: TextAlign.center,
                          height: _boxHeight,
                        ),
                        BoxLabelContainer(
                          name: total.toString(),
                          width: municipalityWidth / 3,
                          textAlign: TextAlign.center,
                          height: _boxHeight,
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}

///{@template _ReportForeignForm}
/// Custom widget for the report foreign form
///{@endtemplate}
class _ReportForeignForm extends StatelessWidget {
  ///{@macro _ReportForeignForm}
  const _ReportForeignForm({
    required EstablishmentModel esta,
    required List<EstablishmentReportModel> reportList,
  })  : _esta = esta,
        _reportList = reportList;

  final EstablishmentModel _esta;
  final List<EstablishmentReportModel> _reportList;

  /// Getter for the box height.
  ///
  double get _boxHeight {
    return 40;
  }

  /// Num method to get the total female tourist.
  ///
  num _female(Country country) {
    num total = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        final reportCountry = report.country ?? sPhilippines;

        if (reportCountry == country.name) {
          total = total + report.female;
        }
      }
    }

    return total;
  }

  /// Num method to get the total male tourist.
  ///
  num _male(Country country) {
    num total = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        final reportCountry = report.country ?? sPhilippines;

        if (reportCountry == country.name) {
          total = total + report.male;
        }
      }
    }

    return total;
  }

  /// Num method to get the total tourist.
  ///
  num _total(Country country) {
    num total = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        final reportCountry = report.country ?? sPhilippines;

        if (reportCountry == country.name) {
          total = total + report.total;
        }
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final municipalityWidth = MediaQuery.sizeOf(context).width * 0.5;

    return Row(
      children: [
        BoxLabelContainer(
          name: _esta.name,
          width: municipalityWidth,
          textAlign: TextAlign.center,
          backgroundColor: color1363DF,
          height: _boxHeight * (Countries.list.length + 2),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoxLabelContainer(
              name: 'Foreign',
              width: municipalityWidth,
              textAlign: TextAlign.center,
              backgroundColor: color1363DF,
              height: _boxHeight,
            ),
            BoxLabelContainer(
              name: 'Country',
              width: municipalityWidth,
              textAlign: TextAlign.center,
              backgroundColor: color1363DF,
              height: _boxHeight,
            ),
            ...Countries.list.map((country) {
              return BoxLabelContainer(
                name: country.name,
                width: municipalityWidth,
                textAlign: TextAlign.center,
                height: _boxHeight,
              );
            }),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoxLabelContainer(
              name: 'Tourist Arrival',
              width: municipalityWidth,
              textAlign: TextAlign.center,
              backgroundColor: color1363DF,
              height: _boxHeight,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BoxLabelContainer(
                  name: 'F',
                  width: municipalityWidth / 3,
                  textAlign: TextAlign.center,
                  backgroundColor: color1363DF,
                  height: _boxHeight,
                ),
                BoxLabelContainer(
                  name: 'M',
                  width: municipalityWidth / 3,
                  textAlign: TextAlign.center,
                  backgroundColor: color1363DF,
                  height: _boxHeight,
                ),
                BoxLabelContainer(
                  name: 'Total',
                  width: municipalityWidth / 3,
                  textAlign: TextAlign.center,
                  backgroundColor: color1363DF,
                  height: _boxHeight,
                ),
              ],
            ),
            ...Countries.list.map((country) {
              final female = _female(country);
              final male = _male(country);
              final total = _total(country);

              return Row(
                children: [
                  BoxLabelContainer(
                    name: female.toString(),
                    width: municipalityWidth / 3,
                    textAlign: TextAlign.center,
                    height: _boxHeight,
                  ),
                  BoxLabelContainer(
                    name: male.toString(),
                    width: municipalityWidth / 3,
                    textAlign: TextAlign.center,
                    height: _boxHeight,
                  ),
                  BoxLabelContainer(
                    name: total.toString(),
                    width: municipalityWidth / 3,
                    textAlign: TextAlign.center,
                    height: _boxHeight,
                  ),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }
}
