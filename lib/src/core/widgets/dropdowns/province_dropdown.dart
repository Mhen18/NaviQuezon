import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/province_list_get_cubit.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/border_dropdown.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/province_model.dart';

///{@template ProvinceDropdown}
/// Dropdown for the list of regions.
///{@endtemplate}
class ProvinceDropdown extends StatelessWidget {
  ///{@macro ProvinceDropdown}
  const ProvinceDropdown({
    required ProvinceListGetCubit bloc,
    required void Function(ProvinceModel?) onChanged,
    required ProvinceModel? value,
    super.key,
  })  : _value = value,
        _onChanged = onChanged,
        _bloc = bloc;

  final ProvinceListGetCubit _bloc;
  final void Function(ProvinceModel?) _onChanged;
  final ProvinceModel? _value;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProvinceListGetCubit, CubitState>(
      bloc: _bloc,
      builder: (context, provinceState) {
        if (provinceState is CubitStateSuccess<List<ProvinceModel>>) {
          final provinceList = provinceState.value;

          return BorderDropdown<ProvinceModel>(
            onChanged: _onChanged,
            value: _value,
            items: provinceList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e.name,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            label: 'Province',
            hint: 'Select Province',
          );
        }

        return BorderDropdown<ProvinceModel>(
          hint: 'Select Province',
          onChanged: _onChanged,
          label: 'Province',
        );
      },
    );
  }
}
