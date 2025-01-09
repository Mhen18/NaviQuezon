import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/province_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/region_model.dart';

part 'address_model.freezed.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String country,
    required RegionModel? region,
    required ProvinceModel? province,
    required MunicipalityModel? municipality,
  }) = _AddressModel;
}
