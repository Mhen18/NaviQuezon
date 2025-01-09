import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_list_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_details_screen.dart';

///{@template EstablishmentDiscoverScreen}
/// A screen that displays the establishment highlights for user to discover.
///{@endtemplate}
class EstablishmentDiscoverScreen extends StatefulWidget {
  ///{@macro EstablishmentDiscoverScreen}
  const EstablishmentDiscoverScreen({super.key});

  static const route = rEstablishmentDiscover;

  @override
  State<EstablishmentDiscoverScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentDiscoverScreen> {
  final _establishmentCubit = EstablishmentListGetCubit();

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  void _initBlocs() {
    _establishmentCubit.run();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _establishmentCubit,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Assets.images.backgrounds.bgDiscover.image(),
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
                          onPressed: _initBlocs,
                        );
                      }

                      if (estaState is CubitStateSuccess) {
                        final value = estaState.value;
                        final estaList = value as List<EstablishmentModel>;

                        return _EstablishmentDiscoverTopListWidget(
                          estaList: estaList,
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///{@template EstablishmentDiscoverTopListWidget}
/// Custom widget that display the top list of establishment
///{@endtemplate}
class _EstablishmentDiscoverTopListWidget extends StatefulWidget {
  ///{@macro EstablishmentDiscoverTopListWidget}
  const _EstablishmentDiscoverTopListWidget({
    required List<EstablishmentModel> estaList,
  }) : _estaList = estaList;

  final List<EstablishmentModel> _estaList;

  @override
  State<_EstablishmentDiscoverTopListWidget> createState() => ListWidgetState();
}

class ListWidgetState extends State<_EstablishmentDiscoverTopListWidget> {
  String? _municipality;

  List<EstablishmentModel> get _estaList {
    //  Check if the estaList is not empty.
    if (_municipality != null) {
      //  Check if the municipality is empty.
      if (_municipality == 'Others') {
        //  Return the estaList where the municipality is empty.
        return widget._estaList
            .where((element) => element.municipality == '')
            .toList();
      }

      //  Return the estaList where the municipality is the same as the
      //  selected municipality.
      return widget._estaList
          .where((element) => element.municipality == _municipality)
          .toList();
    }

    //  Return the estaList.
    return widget._estaList
        .where((element) => _estaMunicipality.first == _municipality)
        .toList();
  }

  /// Getter for the list of municipality from the estaList
  ///
  List<String> get _estaMunicipality {
    final municipalityList = <String>[];

    //  Check if the estaList is not empty.
    if (widget._estaList.isNotEmpty) {
      //  Loop through the estaList.
      for (final esta in widget._estaList) {
        final municipality = esta.municipality;

        //  Check if the municipality is not null.
        if (municipality != null) {
          if (municipality.isEmpty) {
            //  Add 'Others' if the municipality is empty.
            municipalityList.add('Others');
          } else if (!municipalityList.contains(municipality)) {
            //  Add the municipality to the list if it is not already in
            //  the list.
            municipalityList.add(municipality);
          }
        } else {
          //  Add 'Others' if the municipality is null.
          municipalityList.add('Others');
        }
      }
    }

    //  Arrange the list by alphabetical order
    municipalityList.sort();

    //  Check if the list contains 'Others'.
    if (municipalityList.contains('Others')) {
      //  Remove 'Others' from the list and add it at the end.
      municipalityList
        ..remove('Others')
        ..add('Others');
    }

    //  Convert the list to a set to remove duplicates.
    municipalityList.toSet();

    //  Return the list.
    return municipalityList;
  }

  @override
  void initState() {
    super.initState();

    _municipality = _estaMunicipality.first;
  }

  /// Method to handle the onPressed event of the municipality button.
  ///
  void _onMunicipalityPressed(String municipality) {
    setState(() {
      _municipality = municipality;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  Check if the estaMunicipality is empty.
    if (_estaMunicipality.isEmpty) {
      return Center(
        child: Text(
          'No establishment found',
          style: textStyle16w400,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Top List',
            style: textStyle24w400,
          ),
          const Gap(8),
          _EstablishmentDiscoverMunicipalityButton(
            onPressed: _onMunicipalityPressed,
            currentMunicipality: _municipality,
            estaMunicipality: _estaMunicipality,
          ),
          const Gap(8),
          _EstablishmentDiscoverList(
            estaList: _estaList,
          ),
        ],
      ),
    );
  }
}

///{@template EstablishmentDiscoverMunicipalityButton}
/// Custom widget that display the municipality button
///{@endtemplate}
class _EstablishmentDiscoverMunicipalityButton extends StatelessWidget {
  ///{@macro EstablishmentDiscoverMunicipalityButton}
  const _EstablishmentDiscoverMunicipalityButton({
    required void Function(String) onPressed,
    required String? currentMunicipality,
    required List<String> estaMunicipality,
  })  : _onPressed = onPressed,
        _currentMunicipality = currentMunicipality,
        _estaMunicipality = estaMunicipality;

  final void Function(String) _onPressed;
  final String? _currentMunicipality;
  final List<String> _estaMunicipality;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _estaMunicipality.map((municipality) {
          //  Get the index of the municipality
          final index = _estaMunicipality.indexOf(municipality);
          //  Check if the municipality is the last in the list.
          final isLast = index == _estaMunicipality.length - 1;
          var padding = 16.0;

          //  Set the padding to 0 if the municipality is the last index.
          if (isLast) {
            padding = 0.0;
          }

          return Padding(
            padding: EdgeInsets.only(right: padding),
            child: TextButton(
              onPressed: () => _onPressed(municipality),
              child: Text(
                municipality,
                style: textStyle14w700.copyWith(
                  color: _currentMunicipality == municipality
                      ? color1363DF
                      : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

///{@template EstablishmentDiscoverList}
/// Custom widget that display the list of establishment
///{@endtemplate}
class _EstablishmentDiscoverList extends StatelessWidget {
  ///{@macro EstablishmentDiscoverList}
  const _EstablishmentDiscoverList({
    required List<EstablishmentModel> estaList,
  }) : _estaList = estaList;

  final List<EstablishmentModel> _estaList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _estaList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const Gap(16),
        itemBuilder: (context, index) {
          final esta = _estaList[index];
          final width = MediaQuery.of(context).size.width * 0.8;

          return InkWell(
            onTap: () {
              context.push(
                EstablishmentDetailsScreen.route,
                extra: esta,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: width,
                        child: CachedNetworkImage(
                          imageUrl: esta.thumbnail ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      color: Colors.grey.withValues(alpha: 0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _estaList[index].name,
                            style: textStyle16w600,
                          ),
                          const Gap(2),
                          Text(
                            _estaList[index].address,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle12w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
