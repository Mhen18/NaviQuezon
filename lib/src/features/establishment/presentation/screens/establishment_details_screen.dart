import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/core/widgets/dialogs/default_dialog.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_details_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_survey_add_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_image.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_info.dart';
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
          child: BlocBuilder<EstablishmentDetailsGetCubit, CubitState>(
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
                            _buildAppBarButton(
                              tooltip: 'Navigate',
                              icon: Icons.navigation,
                              onPressed: () => _onNavigatePressed(
                                establishment,
                              ),
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
