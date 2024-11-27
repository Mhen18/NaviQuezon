// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_providers.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$LocationProviders extends LocationProviders {
  _$LocationProviders([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = LocationProviders;

  @override
  Future<Response<dynamic>> getRegionList() {
    final Uri $url = Uri.parse('${apiLocation}/regions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProvinceList({required String regionCode}) {
    final Uri $url =
        Uri.parse('${apiLocation}/regions/${regionCode}/provinces');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getMunicipalityList(
      {required String provinceCode}) {
    final Uri $url = Uri.parse(
        '${apiLocation}/provinces/${provinceCode}/cities-municipalities');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBarangayList(
      {required String municipalityCode}) {
    final Uri $url = Uri.parse(
        '${apiLocation}/cities-municipalities/${municipalityCode}/barangays');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
