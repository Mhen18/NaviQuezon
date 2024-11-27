import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:naviquezon/src/core/utils/keys/api_keys.dart';

part 'location_providers.chopper.dart';

///{@template LocationProviders}
/// Providers for getting the location API.
///{@endtemplate}
@ChopperApi(baseUrl: apiLocation)
abstract class LocationProviders extends ChopperService {
  /// A helper method that helps instantiating the service.
  ///
  static LocationProviders create([ChopperClient? client]) =>
      _$LocationProviders(client);

  /// Get request for getting the list of regions from the API.
  ///
  @Get(path: endpointRegion)
  Future<Response<dynamic>> getRegionList();

  /// Get request for getting the list of region's province from the API.
  ///
  @Get(path: endpointProvince)
  Future<Response<dynamic>> getProvinceList({
    @Path('region_code') required String regionCode,
  });

  /// Get request for getting the list of province's municipalities
  /// from the API.
  ///
  @Get(path: endpointMunicipality)
  Future<Response<dynamic>> getMunicipalityList({
    @Path('province_code') required String provinceCode,
  });

  /// Get request for getting the list of municipality's barangays from the API.
  ///
  @Get(path: endpointBarangay)
  Future<Response<dynamic>> getBarangayList({
    @Path('city_municipality_code') required String municipalityCode,
  });
}
