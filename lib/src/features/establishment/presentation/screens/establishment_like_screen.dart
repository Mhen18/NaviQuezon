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
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_card_widget.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template EstablishmentLikeScreen}
/// Custom widget that display the list of establishment that user like.
///{@endtemplate}
class EstablishmentLikeScreen extends StatefulWidget {
  ///{@macro EstablishmentLikeScreen}
  const EstablishmentLikeScreen({super.key});

  static const route = rEstablishmentLike;

  @override
  State<EstablishmentLikeScreen> createState() => _ScreenState();
}

class _ScreenState extends State<EstablishmentLikeScreen> {
  final _establishmentCubit = EstablishmentListGetCubit();
  final _searchController = TextEditingController();

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

    _establishmentCubit.run();
  }

  /// Method that handle the onChanged event of the search field.
  ///
  void _onSearchChanged(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        _establishmentCubit.run(query: value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _establishmentCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorD6E7FF,
        ),
        body: BlocListener<ProfileGetCubit, CubitState>(
          listener: (context, profileState) {
            if (profileState is CubitStateSuccess) {
              setState(() {});
              _establishmentCubit.run();
            }
          },
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      radius: 20,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    const Gap(16),
                    Text(
                      'My Likes',
                      style: textStyle20w700,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(20),
                  ],
                ),
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
                      final value = estaState.value;
                      final list = value as List<EstablishmentModel>;
                      final estaList = <EstablishmentModel>[];
                      for (final esta in list) {
                        final profileLike = _profile?.estaLike ?? [];

                        for (final like in profileLike) {
                          if (like == esta.id) {
                            if (!estaList.contains(esta)) {
                              estaList.add(esta);
                            }
                          }
                        }
                      }

                      if (estaList.isEmpty) {
                        return const ErrorStateContainer(
                          message: 'No like establishment found',
                        );
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(16),
                        itemCount: estaList.length,
                        separatorBuilder: (context, index) {
                          return const Gap(18);
                        },
                        itemBuilder: (context, index) {
                          final establishment = estaList[index];

                          return EstablishmentCardWidget(
                            establishment: establishment,
                          );
                        },
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
