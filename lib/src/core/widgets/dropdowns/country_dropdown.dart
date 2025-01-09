import 'package:country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/border_dropdown.dart';

///{@template CountryDropdown}
/// Custom dropdown for selecting a country.
///{@endtemplate}
class CountryDropdown extends StatelessWidget {
  ///{@macro CountryDropdown}
  const CountryDropdown({
    required String? country,
    required void Function(String?) onCountryChanged,
    super.key,
  })  : _country = country,
        _onCountryChanged = onCountryChanged;

  final String? _country;
  final void Function(String?) _onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return BorderDropdown<String>(
      value: _country,
      items: Countries.list.map((country) {
        return DropdownMenuItem(
          value: country.name,
          child: Text(country.name),
        );
      }).toList(),
      hint: 'Select Country',
      onChanged: _onCountryChanged,
      label: 'Country',
    );
  }
}
