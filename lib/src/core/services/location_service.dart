import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/province_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/region_model.dart';
import 'package:naviquezon/src/features/authentication/registration/infrastructures/providers/location_providers.dart';
import 'package:naviquezon/src/features/establishment/domain/failures/location_permission_failure.dart';

///{@template LocationServices}
/// Service to get the location of the user.
///{@endtemplate}
class LocationService {
  final _chopper = ChopperClient(
    interceptors: [
      HttpLoggingInterceptor(),
    ],
    converter: const JsonConverter(),
    errorConverter: const JsonConverter(),
    services: [
      LocationProviders.create(),
    ],
  );

  /// Future method to get the list of regions from the API.
  ///
  Future<Either<Failure, List<RegionModel>>> getRegionList() async {
    try {
      //  Get the final locationProvider
      final locationProvider = _chopper.getService<LocationProviders>();

      //  Get the response from the locationProvider
      final response = await locationProvider.getRegionList();

      if (response.isSuccessful) {
        final regionList = <RegionModel>[];

        //  Get the bodyList from the response
        final bodyList = response.body! as List<dynamic>;

        //  Loop through the bodyList and add the regions to the list
        for (final body in bodyList) {
          //  Get the region from the body
          final region = body as Map<String, dynamic>;

          //  Add the region to the list
          regionList.add(RegionModel.fromJson(region));
        }

        //  Return the regionList
        return Right(regionList);
      } else {
        return const Left(DefaultFailure());
      }
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to get the list of provinces from the API.
  ///
  Future<Either<Failure, List<ProvinceModel>>> getProvinceList({
    required String regionCode,
  }) async {
    try {
      //  Get the final locationProvider
      final locationProvider = _chopper.getService<LocationProviders>();

      //  Get the response from the locationProvider
      final response = await locationProvider.getProvinceList(
        regionCode: regionCode,
      );

      if (response.isSuccessful) {
        final provinceList = <ProvinceModel>[];

        //  Get the bodyList from the response
        final bodyList = response.body! as List<dynamic>;

        //  Loop through the bodyList and add the provinces to the list
        for (final body in bodyList) {
          //  Get the province from the body
          final province = body as Map<String, dynamic>;

          //  Add the province to the list
          provinceList.add(ProvinceModel.fromJson(province));
        }

        //  Return the provinceList
        return Right(provinceList);
      } else {
        return const Left(DefaultFailure());
      }
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to get the list of municipalities from the API.
  ///
  Future<Either<Failure, List<MunicipalityModel>>> getMunicipalityList({
    required String provinceCode,
  }) async {
    try {
      //  Get the final locationProvider
      final locationProvider = _chopper.getService<LocationProviders>();

      //  Get the response from the locationProvider
      final response = await locationProvider.getMunicipalityList(
        provinceCode: provinceCode,
      );

      if (response.isSuccessful) {
        final municipalityList = <MunicipalityModel>[];

        //  Get the bodyList from the response
        final bodyList = response.body! as List<dynamic>;

        //  Loop through the bodyList and add the municipalities to the list
        for (final body in bodyList) {
          //  Get the municipality from the body
          final municipality = body as Map<String, dynamic>;

          //  Add the municipality to the list
          municipalityList.add(MunicipalityModel.fromJson(municipality));
        }

        //  Return the municipalityList
        return Right(municipalityList);
      } else {
        return const Left(DefaultFailure());
      }
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to check the location permission.
  ///
  Future<Either<Failure, void>> getLocationPermission() async {
    try {
      //  Check the location permission.
      final permission = await Geolocator.checkPermission();

      //  Switch for permission status.
      switch (permission) {
        case LocationPermission.always:
        case LocationPermission.whileInUse:
          //  If the permission is granted.
          return const Right(null);
        case LocationPermission.denied:
        case LocationPermission.deniedForever:
        case LocationPermission.unableToDetermine:
          //` If the permission is denied.
          return const Left(LocationPermissionFailure());
      }
    } catch (e, stackTrace) {
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to request the location permission.
  ///
  Future<Either<Failure, void>> requestPermission() async {
    try {
      //  Request the location permission.
      final permission = await Geolocator.requestPermission();

      //  Switch for permission status.
      switch (permission) {
        case LocationPermission.always:
        case LocationPermission.whileInUse:
          //  If the permission is granted.
          return const Right(null);
        case LocationPermission.denied:
        case LocationPermission.deniedForever:
        case LocationPermission.unableToDetermine:
          //` If the permission is denied.
          return const Left(LocationPermissionFailure());
      }
    } catch (e, stackTrace) {
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to get the user's current location.
  ///
  Future<Either<Failure, Position>> getCurrentLocation() async {
    try {
      //  Get the current location.
      final location = await Geolocator.getCurrentPosition();

      return Right(location);
    } catch (e, stackTrace) {
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }
}
