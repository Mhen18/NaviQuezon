import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_itinerary_navigate_cubit.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_list_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/enums/itinerary_tab_enum.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_itinerary_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_card_widget.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final _estaNavCubit = EstablishmentItineraryNavigationCubit();

  final _searchController = TextEditingController();

  ItineraryTabEnum _currentTab = ItineraryTabEnum.created;

  bool _isAscending = true; // State variable to track sorting order

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
  void _onHistoryPressed() {
    if (_currentTab == ItineraryTabEnum.history) return;

    setState(() {
      _currentTab = ItineraryTabEnum.history;
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

  /// Method to toggle the sorting order
  void _toggleSortOrder() {
    setState(() {
      _isAscending = !_isAscending;
    });
  }

  /// Method to filter the itinerary list
  ///
  List<EstablishmentModel> _filteredItineraryList(
    List<EstablishmentModel> estaList,
  ) {
    final establishmentList = <EstablishmentModel>[];

    final itineraryList = <EstablishmentItineraryModel>[];
    final profileItinerary = _profile?.estaItinerary ?? [];

    if (profileItinerary.isNotEmpty) {
      itineraryList
        ..addAll(profileItinerary)
        ..sort((a, b) {
          final planDateA = a.planDate ?? '';
          final planDateB = b.planDate ?? '';

          return planDateA.compareTo(planDateB);
        });
    }

    for (final itinerary in itineraryList) {
      if (estaList.isNotEmpty) {
        for (final esta in estaList) {
          if (itinerary.establishmentId == esta.id) {
            final planDate = itinerary.planDate;

            if (planDate != null) {
              final datePlan = DateFormat('MMMM d, yyyy').parse(planDate);
              final dateNow = DateTime.now();
              final dateDiff = datePlan.difference(dateNow);

              if (!dateDiff.isNegative) {
                establishmentList.add(esta);
              }
            }
          }
        }
      }
    }

    return establishmentList;
  }

  /// Method to filter the itinerary list
  ///
  List<EstablishmentModel> _filteredHistoryList(
    List<EstablishmentModel> estaList,
  ) {
    final establishmentList = <EstablishmentModel>[];

    final itineraryList = <EstablishmentItineraryModel>[];
    final profileItinerary = _profile?.estaItinerary ?? [];

    if (profileItinerary.isNotEmpty) {
      itineraryList
        ..addAll(profileItinerary)
        ..sort((a, b) {
          final planDateA = a.planDate ?? '';
          final planDateB = b.planDate ?? '';

          return planDateA.compareTo(planDateB);
        });
    }

    for (final itinerary in itineraryList) {
      if (estaList.isNotEmpty) {
        for (final esta in estaList) {
          if (itinerary.establishmentId == esta.id) {
            final planDate = itinerary.planDate;

            if (planDate != null) {
              final datePlan = DateFormat('MMMM d, yyyy').parse(planDate);
              final dateNow = DateTime.now();
              final dateDiff = datePlan.difference(dateNow);

              if (dateDiff.isNegative) {
                establishmentList.add(esta);
              }
            }
          }
        }
      }
    }

    return establishmentList;
  }

  Map<String, List<EstablishmentModel>> _groupEstablishment(
    List<EstablishmentModel> establishmentList,
  ) {
    final groupedEstablishments = <String, List<EstablishmentModel>>{};

    for (final establishment in establishmentList) {
      var planDate = '';
      if (_profile != null) {
        final establishmentItinerary =
            _profile!.estaItinerary?.firstWhere((element) {
          return element.establishmentId == establishment.id;
        });

        planDate = establishmentItinerary?.planDate ??
            DateFormat('MMM dd, yyyy').format(
              DateTime.now(),
            );
      }

      if (groupedEstablishments.containsKey(planDate)) {
        groupedEstablishments[planDate]!.add(establishment);
      } else {
        groupedEstablishments[planDate] = [establishment];
      }
    }

    return groupedEstablishments;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _establishmentCubit,
        ),
        BlocProvider(
          create: (context) => _estaNavCubit,
        ),
      ],
      child: Scaffold(
        body: BlocListener<EstablishmentItineraryNavigationCubit, CubitState>(
          listener: (_, navState) {
            if (navState is CubitStateLoading) {}
            if (navState is CubitStateFailed) {
              //  Show error message
              final message = navState.failure.message;
              AppSnackBar.error(context).show(message);
            }
            if (navState is CubitStateSuccess<String>) {
              final url = navState.value;
              final uri = Uri.parse(url);
              canLaunchUrl(uri).then((value) {
                if (value) {
                  launchUrl(uri);
                } else {
                  if (context.mounted) {
                    AppSnackBar.error(context).show(
                      'Failed to launch the url',
                    );
                  }
                }
              });
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                _ItineraryTabWidget(
                  controller: _searchController,
                  onSearchChanged: _onSearchPressed,
                  onHistoryPressed: _onHistoryPressed,
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
                        final list =
                            estaState.value as List<EstablishmentModel>;

                        switch (_currentTab) {
                          case ItineraryTabEnum.history:
                            //  Sort the list based on the rating
                            list.sort((a, b) {
                              final aRating = a.rating ?? 0;
                              final bRating = b.rating ?? 0;

                              return bRating.compareTo(aRating);
                            });

                            //  Filter the list if the establishment is
                            //  already visited
                            final historyList = _filteredHistoryList(list);

                            //  Check if the list is empty
                            if (historyList.isEmpty) {
                              return const Center(
                                child: Text('No travel history yet.'),
                              );
                            }

                            //  Display the list of establishments
                            return ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemCount: historyList.length,
                              itemBuilder: (context, index) {
                                final establishment = historyList[index];

                                return EstablishmentCardWidget(
                                  establishment: establishment,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Gap(18);
                              },
                            );
                          case ItineraryTabEnum.created:
                            final estaList = _filteredItineraryList(list);

                            //  Check if the list is empty
                            if (estaList.isEmpty) {
                              return const Center(
                                child: Text('No created list yet.'),
                              );
                            }

                            final groupedEstablishments = _groupEstablishment(
                              estaList,
                            );

                            final group =
                                groupedEstablishments.entries.toList();
                            // Sort the grouped establishments based on the
                            // selected order
                            group.sort((a, b) {
                              final dateA =
                                  DateFormat('MMMM dd, yyyy').parse(a.key);
                              final dateB =
                                  DateFormat('MMMM dd, yyyy').parse(b.key);
                              return _isAscending
                                  ? dateA.compareTo(dateB)
                                  : dateB.compareTo(dateA);
                            });

                            return Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: _toggleSortOrder,
                                    child: Row(
                                      spacing: 8,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('Sort'),
                                        Icon(
                                          _isAscending
                                              ? Icons.arrow_upward
                                              : Icons.arrow_downward,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    padding: const EdgeInsets.all(16),
                                    children: group.expand((entry) {
                                      final date = entry.key;
                                      final establishments = entry.value;

                                      return [
                                        Center(
                                          child: Text(date),
                                        ),
                                        const Gap(8),
                                        ...establishments.map((establishment) {
                                          return EstablishmentCardWidget.create(
                                            establishment: establishment,
                                          );
                                        }),
                                        const Gap(8),
                                        TextButton(
                                          onPressed: () {
                                            _estaNavCubit.run(establishments);
                                          },
                                          child: const Text('Navigate'),
                                        ),
                                      ];
                                    }).toList(),
                                  ),
                                ),
                              ],
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
    required void Function() onHistoryPressed,
    required void Function() onCreatedListPressed,
    required ItineraryTabEnum currentTab,
  })  : _controller = controller,
        _currentTab = currentTab,
        _onCreatedListPressed = onCreatedListPressed,
        _onHistoryPressed = onHistoryPressed,
        _onSearchChanged = onSearchChanged;

  final TextEditingController _controller;
  final void Function(String?) _onSearchChanged;
  final void Function() _onHistoryPressed;
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: VerticalDivider(
                    width: 2,
                    color: Colors.black87,
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: _onHistoryPressed,
                    child: Text(
                      'Travel History',
                      style: _currentTab == ItineraryTabEnum.history
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
