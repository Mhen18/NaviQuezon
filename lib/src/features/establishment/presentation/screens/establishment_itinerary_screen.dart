import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_list_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/enums/itinerary_tab_enum.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_card_widget.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template EstablishmentItineraryScreen}
/// Screen that display the user's list of itinerary
///{@endtemplate}
class EstablishmentItineraryScreen extends StatefulWidget {
  ///{@macro EstablishmentItineraryScreen}
  const EstablishmentItineraryScreen({super.key});

  static const route = rEstablishmentItinerary;

  @override
  State<EstablishmentItineraryScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentItineraryScreen> {
  final _establishmentCubit = EstablishmentListGetCubit();

  final _searchController = TextEditingController();

  ItineraryTabEnum _currentTab = ItineraryTabEnum.top;

  /// Getter to get the profile model
  ///
  ProfileModel? get _profile {
    final profile = context.read<ProfileGetCubit>().state;

    if (profile is CubitStateSuccess) {
      return profile.value as ProfileModel;
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

  /// Method to handle the top list tab button pressed
  ///
  void _onTopListPressed() {
    if (_currentTab == ItineraryTabEnum.top) return;

    setState(() {
      _currentTab = ItineraryTabEnum.top;
      _searchController.clear();
    });

    _establishmentCubit.run();
    FocusScope.of(context).unfocus();
  }

  /// Method to handle the created list tab button pressed
  ///
  void _onCreatedListPressed() {
    if (_currentTab == ItineraryTabEnum.created) return;

    setState(() {
      _currentTab = ItineraryTabEnum.created;
      _searchController.clear();
    });

    _establishmentCubit.run();
    FocusScope.of(context).unfocus();
  }

  /// Method to handle the search changed
  ///
  void _onSearchPressed(String? query) {
    if (query == null) return;

    _establishmentCubit.run(query: query);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _establishmentCubit,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _ItineraryTabWidget(
                controller: _searchController,
                onSearchChanged: _onSearchPressed,
                onTopListPressed: _onTopListPressed,
                onCreatedListPressed: _onCreatedListPressed,
                currentTab: _currentTab,
              ),
              Expanded(
                child: BlocBuilder<EstablishmentListGetCubit, CubitState>(
                  builder: (context, estaState) {
                    if (estaState is CubitStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (estaState is CubitStateFailed) {
                      return ErrorStateContainer(
                        onPressed: _establishmentCubit.run,
                      );
                    }

                    if (estaState is CubitStateSuccess) {
                      final list = estaState.value as List<EstablishmentModel>;

                      switch (_currentTab) {
                        case ItineraryTabEnum.top:
                          //  Sort the list based on the rating
                          list.sort((a, b) {
                            final aRating = a.rating ?? 0;
                            final bRating = b.rating ?? 0;

                            return bRating.compareTo(aRating);
                          });

                          return ListView.separated(
                            padding: const EdgeInsets.all(16),
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              final establishment = list[index];

                              return EstablishmentCardWidget(
                                establishment: establishment,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Gap(18);
                            },
                          );
                        case ItineraryTabEnum.created:
                          //  Sort the list based on the rating
                          final itineraryList = _profile?.estaItinerary ?? [];
                          final estaList = list.where((element) {
                            return itineraryList.any((itinerary) {
                              return itinerary.establishmentId == element.id;
                            });
                          }).toList();

                          return ListView.separated(
                            padding: const EdgeInsets.all(16),
                            itemCount: itineraryList.length,
                            itemBuilder: (context, index) {
                              final establishment = estaList[index];

                              return EstablishmentCardWidget.create(
                                establishment: establishment,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Gap(18);
                            },
                          );
                      }
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

///{@template _ItineraryTabWidget}
/// Widget to display the tab of the itinerary screen
///{@endtemplate}
class _ItineraryTabWidget extends StatelessWidget {
  const _ItineraryTabWidget({
    required TextEditingController controller,
    required void Function(String?) onSearchChanged,
    required void Function() onTopListPressed,
    required void Function() onCreatedListPressed,
    required ItineraryTabEnum currentTab,
  })  : _controller = controller,
        _currentTab = currentTab,
        _onCreatedListPressed = onCreatedListPressed,
        _onTopListPressed = onTopListPressed,
        _onSearchChanged = onSearchChanged;

  final TextEditingController _controller;
  final void Function(String?) _onSearchChanged;
  final void Function() _onTopListPressed;
  final void Function() _onCreatedListPressed;
  final ItineraryTabEnum _currentTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: colorD6E7FF,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          RoundedTextField(
            controller: _controller,
            onChanged: _onSearchChanged,
            radius: 20,
            prefixIcon: const Icon(Icons.search),
          ),
          const Gap(16),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _onTopListPressed,
                    child: Text(
                      'Top List',
                      style: _currentTab == ItineraryTabEnum.top
                          ? textStyle20w700
                          : textStyle20w400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: VerticalDivider(
                    width: 2,
                    color: Colors.black87,
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: _onCreatedListPressed,
                    child: Text(
                      'Created List',
                      style: _currentTab == ItineraryTabEnum.created
                          ? textStyle20w700
                          : textStyle20w400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
