import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/region_list_get_cubit.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/border_dropdown.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/region_model.dart';

///{@template RegionDropdown}
/// Dropdown for the list of regions.
///{@endtemplate}
class RegionDropdown extends StatelessWidget {
  ///{@macro RegionDropdown}
  const RegionDropdown({
    required RegionListGetCubit bloc,
    required void Function(RegionModel?) onChanged,
    required RegionModel? value,
    super.key,
  })  : _bloc = bloc,
        _onChanged = onChanged,
        _value = value;

  final RegionListGetCubit _bloc;
  final void Function(RegionModel?) _onChanged;
  final RegionModel? _value;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionListGetCubit, CubitState>(
      bloc: _bloc,
      builder: (context, regionState) {
        if (regionState is CubitStateSuccess<List<RegionModel>>) {
          final regionList = regionState.value;

          return BorderDropdown<RegionModel>(
            onChanged: _onChanged,
            value: _value,
            items: regionList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e.name,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            label: 'Region',
            hint: 'Select Region',
          );
        }

        return BorderDropdown<RegionModel>(
          hint: 'Select Region',
          onChanged: _onChanged,
          label: 'Region',
        );
      },
    );
  }
}
