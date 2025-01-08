import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/blocs/municipality_list_get_cubit.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/extensions/num_extensions.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/core/widgets/app_bars/default_app_bar.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/containers/box_label_container.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/municipality_dropdown.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/admin/accounts/presentation/screens/account_manage_screen.dart';
import 'package:naviquezon/src/features/admin/report/presentation/widgets/admin_drawer.dart';
import 'package:naviquezon/src/features/admin/verification/presentation/verification_screen.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';
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

  void _onConfirmPressed(DateTime date, String municipality) {
    setState(() {
      _filterDateTime = date;
      _municipality = municipality;
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _estaCubit,
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: AdminDrawer(
          isSuperAdmin: _role == AppRoleEnum.superAdmin,
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
        body: Column(
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

                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tourism Attraction Visitor Record',
                            style: textStyle16w700,
                          ),
                          const Gap(8),
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
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Name of the Municipality: ',
                                ),
                                TextSpan(
                                  text: _municipality,
                                  style: textStyle16w600,
                                ),
                              ],
                            ),
                          ),
                          const Gap(16),
                          _ReportVisitorRecord(
                            establishmentList: filteredList,
                            dateTime: _filterDateTime,
                          ),
                        ],
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
    );
  }
}

///{@template ReportVisitorRecord}
/// Widget to display the visitor record in the report screen
///{@endtemplate}
class _ReportVisitorRecord extends StatelessWidget {
  ///{@macro ReportVisitorRecord}
  const _ReportVisitorRecord({
    required List<EstablishmentModel> establishmentList,
    required DateTime dateTime,
  })  : _establishmentList = establishmentList,
        _dateTime = dateTime;

  final List<EstablishmentModel> _establishmentList;
  final DateTime _dateTime;

  List<EstablishmentReportModel> _reportList(
    EstablishmentModel establishment,
  ) {
    final reportList = <EstablishmentReportModel>[];

    final reports = establishment.report ?? [];
    if (reports.isNotEmpty) {
      for (final report in reports) {
        final reportDate = report.date.toUnixTime(isSeconds: true);
        final reportMonth = reportDate.month;

        if (_dateTime.month == reportMonth) {
          reportList.add(report);
        }
      }
    }

    return reportList;
  }

  @override
  Widget build(BuildContext context) {
    if (_establishmentList.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'No establishment record found in this municipality',
            style: textStyle16w400,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
        ),
        child: Column(
          children: [
            const _RecordLabelContainer(),
            Column(
              children: _establishmentList.map((establishment) {
                return _RecordContainer(
                  reportList: _reportList(establishment),
                  name: establishment.name,
                  municipality: establishment.municipality ?? 'Sariaya',
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

///{@template _RecordLabelContainer}
/// Widget to display the record label container
///{@endtemplate}
class _RecordLabelContainer extends StatelessWidget {
  ///{@macro _RecordLabelContainer}
  const _RecordLabelContainer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BoxLabelContainer(
          name: 'Name',
          height: 35 * 2,
          width: MediaQuery.of(context).size.width * 0.5,
          textAlign: TextAlign.center,
          style: textStyle14w600,
          backgroundColor: Colors.yellow,
        ),
        const _RecordCountWidget.label(
          'This Municipality',
        ),
        const _RecordCountWidget.label(
          'Other Municipalities',
        ),
        const _RecordCountWidget.label(
          'Other Province',
        ),
        const _RecordCountWidget.label(
          'Foreign Country Residence',
        ),
        const _RecordCountWidget.label(
          'Total Number of Visitors',
        ),
      ],
    );
  }
}

///{@template _RecordContainer}
/// Widget to display the record container
///{@endtemplate}
class _RecordContainer extends StatelessWidget {
  ///{@macro _RecordContainer}
  const _RecordContainer({
    required List<EstablishmentReportModel> reportList,
    required String name,
    required String municipality,
  })  : _reportList = reportList,
        _name = name,
        _municipality = municipality;

  final List<EstablishmentReportModel> _reportList;
  final String _name;
  final String _municipality;

  /// Getter for the total number of visitors from this municipality.
  ///
  (num, num, num) get _thisMunicipality {
    num total = 0;
    num female = 0;
    num male = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        final reportMunicipality = report.municipality;

        if (reportMunicipality == _municipality) {
          total += report.total;
          female += report.female;
          male += report.male;
        }
      }
    }

    return (total, female, male);
  }

  (num, num, num) get _othersMunicipality {
    num total = 0;
    num female = 0;
    num male = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        if (report.country == sPhilippines) {
          if (report.province == sQuezonProvince) {
            if (report.municipality != _municipality) {
              total += report.total;
              female += report.female;
              male += report.male;
            }
          }
        }
      }
    }

    return (total, female, male);
  }

  (num, num, num) get _othersProvinces {
    num total = 0;
    num female = 0;
    num male = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        if (report.country == sPhilippines) {
          if (report.province != sQuezonProvince) {
            total += report.total;
            female += report.female;
            male += report.male;
          }
        }
      }
    }

    return (total, female, male);
  }

  (num, num, num) get _othersCountries {
    num total = 0;
    num female = 0;
    num male = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        if (report.country != null) {
          if (report.country != sPhilippines) {
            total += report.total;
            female += report.female;
            male += report.male;
          }
        }
      }
    }

    return (total, female, male);
  }

  (num, num, num) get _total {
    num total = 0;
    num female = 0;
    num male = 0;

    if (_reportList.isNotEmpty) {
      for (final report in _reportList) {
        if (report.country != null) {
          total += report.total;
          female += report.female;
          male += report.male;
        }
      }
    }

    return (total, female, male);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BoxLabelContainer(
          name: _name,
          width: MediaQuery.of(context).size.width * 0.5,
          style: textStyle14w600,
        ),
        //  This Municipality
        _RecordCountWidget(
          total: _thisMunicipality.$1.toString(),
          female: _thisMunicipality.$2.toString(),
          male: _thisMunicipality.$3.toString(),
        ),
        //  Other Municipalities
        _RecordCountWidget(
          total: _othersMunicipality.$1.toString(),
          female: _othersMunicipality.$2.toString(),
          male: _othersMunicipality.$3.toString(),
        ),
        //  Other Province
        _RecordCountWidget(
          total: _othersProvinces.$1.toString(),
          female: _othersProvinces.$2.toString(),
          male: _othersProvinces.$3.toString(),
        ),
        //  Foreign Country Residence
        _RecordCountWidget(
          total: _othersCountries.$1.toString(),
          female: _othersCountries.$2.toString(),
          male: _othersCountries.$3.toString(),
        ),
        // Total
        _RecordCountWidget(
          total: _total.$1.toString(),
          female: _total.$2.toString(),
          male: _total.$3.toString(),
        ),
      ],
    );
  }
}

class _RecordCountWidget extends StatelessWidget {
  const _RecordCountWidget({
    required String total,
    required String male,
    required String female,
  })  : _total = total,
        _male = male,
        _female = female,
        _label = null;

  const _RecordCountWidget.label(
    String label,
  )   : _total = 'Total',
        _male = 'Male',
        _female = 'Female',
        _label = label;

  final String _total;
  final String _male;
  final String _female;
  final String? _label;

  Color? get _color {
    if (_label == null) {
      return null;
    }

    return Colors.yellow;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_label != null) ...[
          BoxLabelContainer(
            name: _label,
            width: MediaQuery.of(context).size.width * 0.6,
            textAlign: TextAlign.center,
            style: textStyle14w600,
            backgroundColor: _color,
          ),
        ],
        Row(
          children: [
            BoxLabelContainer(
              name: _male,
              width: MediaQuery.of(context).size.width * 0.2,
              textAlign: TextAlign.center,
              backgroundColor: _color,
            ),
            BoxLabelContainer(
              name: _female,
              width: MediaQuery.of(context).size.width * 0.2,
              textAlign: TextAlign.center,
              backgroundColor: _color,
            ),
            BoxLabelContainer(
              name: _total,
              width: MediaQuery.of(context).size.width * 0.2,
              textAlign: TextAlign.center,
              backgroundColor: _color,
            ),
          ],
        ),
      ],
    );
  }
}

///{@template _ReportFilterBottomSheet}
/// Custom widget for the report filter bottom sheet
///{@endtemplate}
class _ReportFilterBottomSheet extends StatefulWidget {
  const _ReportFilterBottomSheet({
    required void Function(DateTime, String) onConfirmPressed,
    required DateTime initialDate,
    required String municipality,
  })  : _onConfirmPressed = onConfirmPressed,
        _municipality = municipality,
        _initialDate = initialDate;

  final void Function(DateTime, String) _onConfirmPressed;
  final DateTime _initialDate;
  final String _municipality;

  @override
  State<_ReportFilterBottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_ReportFilterBottomSheet> {
  final _municipalityCubit = MunicipalityListGetCubit();
  final _dateController = TextEditingController();
  final _municipality = ValueNotifier<MunicipalityModel?>(null);

  /// Getter for the role.
  AppRoleEnum get _role {
    return context.read<AppRoleCubit>().state;
  }

  /// Getter if the form is valid.
  bool get _valid {
    final municipality = _municipality.value?.name;
    final validMunicipality = municipality != widget._municipality;
    final validDate = _dateFormat(widget._initialDate) != _dateController.text;

    return validMunicipality || validDate;
  }

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

    widget._onConfirmPressed(date, municipality);
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
                  if (_role == AppRoleEnum.superAdmin) ...[
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
                    onPressed: _valid ? _onConfirmPressed : null,
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
