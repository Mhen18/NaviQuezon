import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/municipality_list_get_cubit.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/border_dropdown.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';

///{@template MunicipalityDropdown}
/// Custom dropdown for selecting a municipality.
///{@endtemplate}
class MunicipalityDropdown extends StatelessWidget {
  ///{@macro MunicipalityDropdown}
  const MunicipalityDropdown({
    required void Function(MunicipalityModel?) onChanged,
    required MunicipalityModel? value,
    required MunicipalityListGetCubit bloc,
    bool? isFiltered,
    super.key,
  })  : _value = value,
        _bloc = bloc,
        _onChanged = onChanged,
        _isFiltered = isFiltered ?? true;

  final void Function(MunicipalityModel?) _onChanged;
  final MunicipalityListGetCubit _bloc;
  final MunicipalityModel? _value;
  final bool _isFiltered;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MunicipalityListGetCubit, CubitState>(
      bloc: _bloc,
      builder: (context, municipalityState) {
        if (municipalityState is CubitStateSuccess<List<MunicipalityModel>>) {
          var municipalityList = municipalityState.value;

          if (_isFiltered) {
            //  Filter the municipality list.
            final newMunicipalityList = <MunicipalityModel>[];

            //  Loop through the municipality list.
            for (final municipality in municipalityState.value) {
              //  Loop through the selected municipality.
              for (final sMunicipality in sMunicipalityList) {
                final municipalityName = municipality.name.toLowerCase();
                final sMunicipalityName = sMunicipality.toLowerCase();

                //  Check if the municipality name is the same.
                if (municipalityName == sMunicipalityName) {
                  newMunicipalityList.add(municipality);
                }
              }
            }

            municipalityList = newMunicipalityList;
          }

          return BorderDropdown<MunicipalityModel>(
            onChanged: _onChanged,
            value: _value,
            items: municipalityList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e.name,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            label: 'Municipality',
            hint: 'Select Municipality',
          );
        }

        return BorderDropdown<MunicipalityModel>(
          hint: 'Select Municipality',
          onChanged: _onChanged,
          label: 'Municipality',
        );
      },
    );
  }
}
