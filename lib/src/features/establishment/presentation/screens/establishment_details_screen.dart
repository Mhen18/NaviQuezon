import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/extensions/datetime_extensions.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_details_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_survey_add_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_survey_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_image.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_info.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:url_launcher/url_launcher.dart';

///{@template EstablishmentDetailsScreen}
/// Screen for displaying the details of amenities.
///{@endtemplate}
class EstablishmentDetailsScreen extends StatefulWidget {
  ///{@macro EstablishmentDetailsScreen}
  const EstablishmentDetailsScreen({
    required EstablishmentModel establishment,
    super.key,
  }) : _establishment = establishment;

  final EstablishmentModel _establishment;

  static const route = rEstablishmentDetails;

  @override
  State<EstablishmentDetailsScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentDetailsScreen> {
  final _estaDetails = EstablishmentDetailsGetCubit();
  final _surveyCubit = EstablishmentSurveyAddCubit();

  bool _isInitial = true;

  /// Getter for the profile model
  ///
  ProfileModel? get _profile {
    final profileState = BlocProvider.of<ProfileGetCubit>(context).state;

    if (profileState is CubitStateSuccess<ProfileModel>) {
      return profileState.value;
    }

    return null;
  }

  /// Getter for the image height
  ///
  double get _imageHeight => MediaQuery.of(context).size.height * 0.3;

  /// Method to build the app bar button.
  Container _buildAppBarButton({
    required String tooltip,
    required IconData icon,
    required void Function() onPressed,
  }) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        tooltip: tooltip,
        icon: Icon(
          icon,
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _initBloc();
  }

  /// Method to initialize the blocs/cubits.
  void _initBloc() {
    _estaDetails.run(widget._establishment.id);
  }

  /// Method to handle the navigate button.
  ///
  void _onNavigatePressed(EstablishmentModel establishment) {
    _DetailsNavigateDialog.show(
      context,
      () => _onStartPressed(establishment),
    );
  }

  /// Future method to open navigation apps.
  ///
  Future<void> _onStartPressed(
    EstablishmentModel establishment,
  ) async {
    final latitude = establishment.latitude;
    final longitude = establishment.longitude;

    //  Create the uri for the navigation
    final uri = Uri.parse('geo:$latitude,$longitude?q=$latitude,$longitude');
    //  Create the fallback uri for the navigation
    final fallbackUri = Uri(
      scheme: 'https',
      host: 'maps.google.com',
      queryParameters: {'q': '$latitude, $longitude'},
    );

    //  Pop the dialog
    context.pop();

    try {
      //  Check if the url can be launched
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        await launchUrl(fallbackUri);
      }
    } on Exception catch (e) {
      //  Catch the error and print it
      await launchUrl(fallbackUri);
      printError(e.toString());
    }
  }

  /// Method to handle the survey button.
  void _onSurveyPressed() {
    _QuestionPopUpDialog.show(
      context,
      onBeenHereBefore: _showSurveyBottomSheet,
      onHereRightNow: () => _showSurveyBottomSheet(isToday: true),
      onNotBeenHereYet: () {
        context.pop();

        AppSnackBar.info(context).show('Hope you can visit soon!');
      },
    );
  }

  /// Method to handle the survey button and show the bottom sheet.
  ///
  void _showSurveyBottomSheet({bool isToday = false}) {
    context.pop();

    showModalBottomSheet<_SurveyBottomSheet>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      builder: (context) {
        if (isToday) {
          return _SurveyBottomSheet.now(
            onSubmitPressed: _onSubmitSurveyPressed,
          );
        }

        return _SurveyBottomSheet(
          onSubmitPressed: _onSubmitSurveyPressed,
        );
      },
    );
  }

  /// Method to handle the submit survey button.
  ///
  void _onSubmitSurveyPressed(EstablishmentSurveyModel survey) {
    printInfo('SUBMIT');
    printInfo(survey.toString());

    _surveyCubit.run(
      survey: survey,
      establishmentId: widget._establishment.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _estaDetails,
        ),
        BlocProvider(
          create: (context) => _surveyCubit,
        ),
      ],
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<EstablishmentSurveyAddCubit, CubitState>(
              listener: (context, surveyState) {
                if (surveyState is CubitStateLoading) {
                  LoadingDialog.show(context);
                }

                if (surveyState is CubitStateFailed) {
                  LoadingDialog.hide(context);

                  AppSnackBar.error(context).show('Failed to submit survey');
                }

                if (surveyState is CubitStateSuccess) {
                  LoadingDialog.hide(context);

                  AppSnackBar.success(context).show(
                    'Survey submitted successfully',
                  );

                  _estaDetails.run(widget._establishment.id);
                }
              },
            ),
          ],
          child: BlocConsumer<EstablishmentDetailsGetCubit, CubitState>(
            listener: (context, estaState) {
              if (estaState is CubitStateSuccess<EstablishmentModel>) {
                final establishment = estaState.value;
                final surveyList = establishment.survey ?? [];

                if (surveyList.isNotEmpty) {
                  for (final survey in surveyList) {
                    if (survey.userId == _profile?.id) {
                      return;
                    }
                  }
                }

                //  Check if the screen is initial
                if (_isInitial) {
                  //  Show the survey pop up dialog
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    _onSurveyPressed();
                  });

                  //  Set the screen to not initial
                  setState(() {
                    _isInitial = false;
                  });
                }
              }
            },
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
                  onPressed: () => _estaDetails.run(
                    widget._establishment.id,
                  ),
                );
              }

              if (estaState is CubitStateSuccess<EstablishmentModel>) {
                final establishment = estaState.value;
                return Stack(
                  children: [
                    DetailsImage(
                      imageHeight: _imageHeight,
                      images: establishment.images ?? [],
                      video: establishment.video ?? '',
                    ),
                    EstablishmentDetailsInfo(
                      establishment: establishment,
                      imageHeight: _imageHeight,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildAppBarButton(
                              tooltip: 'Back',
                              icon: Icons.arrow_back,
                              onPressed: context.pop,
                            ),
                            Row(
                              children: [
                                _buildAppBarButton(
                                  tooltip: 'Navigate',
                                  icon: Icons.navigation,
                                  onPressed: () => _onNavigatePressed(
                                    establishment,
                                  ),
                                ),
                                const Gap(8),
                                _buildAppBarButton(
                                  tooltip: 'Survey',
                                  icon: Icons.edit_note_sharp,
                                  onPressed: _onSurveyPressed,
                                ),
                              ],
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

///{@template _QuestionPopUpDialog}
/// Custom dialog for the question pop up.
///{@endtemplate}
class _QuestionPopUpDialog extends StatelessWidget {
  ///{@macro _QuestionPopUpDialog}
  const _QuestionPopUpDialog({
    required void Function() onBeenHereBefore,
    required void Function() onHereRightNow,
    required void Function() onNotBeenHereYet,
  })  : _onBeenHereBefore = onBeenHereBefore,
        _onHereRightNow = onHereRightNow,
        _onNotBeenHereYet = onNotBeenHereYet;

  final void Function() _onBeenHereBefore;
  final void Function() _onHereRightNow;
  final void Function() _onNotBeenHereYet;

  static void show(
    BuildContext context, {
    required void Function() onBeenHereBefore,
    required void Function() onHereRightNow,
    required void Function() onNotBeenHereYet,
  }) {
    showDialog<_QuestionPopUpDialog>(
      context: context,
      builder: (context) {
        return _QuestionPopUpDialog(
          onBeenHereBefore: onBeenHereBefore,
          onHereRightNow: onHereRightNow,
          onNotBeenHereYet: onNotBeenHereYet,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      child: Column(
        children: [
          Text(
            'Have you ever been here?',
            style: textStyle14w600,
          ),
          const Gap(16),
          RoundedButton(
            onPressed: _onBeenHereBefore,
            label: "Yes, I've been here before",
            width: double.infinity,
          ),
          const Gap(8),
          RoundedButton(
            onPressed: _onHereRightNow,
            label: "Yes, I'm here right now",
            width: double.infinity,
          ),
          const Gap(8),
          RoundedButton(
            onPressed: _onNotBeenHereYet,
            label: "No, I haven't been here yet",
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

///{@template _DetailsNavigateDialog}
/// Custom dialog for the details navigate dialog.
///{@endtemplate}
class _DetailsNavigateDialog extends StatelessWidget {
  ///{@macro _DetailsNavigateDialog}
  const _DetailsNavigateDialog({
    required void Function() onStartPressed,
  }) : _onStartPressed = onStartPressed;

  final void Function() _onStartPressed;

  /// Static method to show the dialog.
  ///
  static void show(
    BuildContext context,
    void Function() onStartPressed,
  ) {
    showDialog<_DetailsNavigateDialog>(
      context: context,
      builder: (context) {
        return _DetailsNavigateDialog(
          onStartPressed: onStartPressed,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      child: Column(
        children: [
          Assets.images.logo.logoNavigate.image(
            height: 60,
            width: 60,
          ),
          const Gap(24),
          Text(
            "Let's Navigate",
            style: textStyle14w600,
          ),
          const Gap(16),
          RoundedButton(
            onPressed: _onStartPressed,
            width: double.infinity,
            label: 'Start',
          ),
          const Gap(8),
          RoundedButton(
            onPressed: context.pop,
            width: double.infinity,
            backgroundColor: Colors.grey[300],
            label: 'Cancel',
            labelColor: Colors.black87,
          ),
          const Gap(24),
          Assets.images.logo.logoNavi.image(
            height: 20,
          ),
        ],
      ),
    );
  }
}

///{@template _SurveyBottomSheet}
/// Custom bottom sheet for the survey.
///{@endtemplate}
class _SurveyBottomSheet extends StatefulWidget {
  ///{@macro _SurveyBottomSheet}
  const _SurveyBottomSheet({
    required void Function(EstablishmentSurveyModel) onSubmitPressed,
  })  : _onSubmitPressed = onSubmitPressed,
        _isToday = false;

  ///{@macro _SurveyBottomSheet}
  const _SurveyBottomSheet.now({
    required void Function(EstablishmentSurveyModel) onSubmitPressed,
  })  : _onSubmitPressed = onSubmitPressed,
        _isToday = true;

  final void Function(EstablishmentSurveyModel) _onSubmitPressed;
  final bool _isToday;

  @override
  State<_SurveyBottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_SurveyBottomSheet> {
  final _dateController = TextEditingController();
  final _totalController = TextEditingController();
  final _femaleController = TextEditingController();
  final _maleController = TextEditingController();

  String? _totalErrorText;

  DateTime _dateTime = DateTime.now();

  /// Getter for the validity of the form.
  ///
  bool get _valid {
    final hasTotal = _totalController.text.isNotEmpty;
    final hasFemale = _femaleController.text.isNotEmpty;
    final hasMale = _maleController.text.isNotEmpty;

    if (hasTotal && hasFemale && hasMale) {
      final total = int.parse(_totalController.text);
      final female = int.parse(_femaleController.text);
      final male = int.parse(_maleController.text);

      return male + female == total;
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
        if (_valid) {
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
        if (_valid) {
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
      final date = widget._isToday
          ? DateTime.now().secondsSinceEpoch()
          : dateFormat.secondsSinceEpoch();

      final survey = EstablishmentSurveyModel.add(
        date: date,
        total: num.parse(_totalController.text),
        female: num.parse(_femaleController.text),
        male: num.parse(_maleController.text),
      );

      context.pop();
      widget._onSubmitPressed(survey);
    }
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
            if (!widget._isToday) ...[
              const Gap(16),
              RoundedTextField(
                controller: _dateController,
                label: 'When did you visit?',
                readOnly: true,
                suffixIcon: IconButton(
                  onPressed: _showDatePicker,
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
            ],
            const Gap(16),
            RoundedTextField(
              controller: _totalController,
              label: 'Total Visitors',
              errorText: _totalErrorText,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
            ),
            const Gap(16),
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
            const Gap(16),
            RoundedButton(
              onPressed: _valid ? _onSubmitPressed : null,
              label: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
