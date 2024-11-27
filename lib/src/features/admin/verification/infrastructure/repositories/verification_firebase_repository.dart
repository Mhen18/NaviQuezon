import 'package:firebase_database/firebase_database.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/keys/database_keys.dart';
import 'package:naviquezon/src/features/admin/verification/domain/verification_sort_enum.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_validation_model.dart';

///{@template VerificationFirebaseRepository}
/// Repository for verification that use firebase as the data source.
///{@endtemplate}
class VerificationFirebaseRepository {
  /// Future method to get the verification list.
  ///
  static Future<List<ProfileModel>> getVerificationList({
    VerificationSortEnum? sort,
  }) async {
    try {
      //  Get the reference of the profile.
      final profileRef = FirebaseDatabase.instance.ref(tProfile);

      //  Get the snapshot of the profile.
      final profileSnapshot = await profileRef.get();

      //  Create a list of profile model.
      final profileList = <ProfileModel>[];

      //  Check if the profile snapshot is not null
      if (profileSnapshot.value != null) {
        final profileMap = profileSnapshot.value! as Map<dynamic, dynamic>;

        for (final value in profileMap.values) {
          final valueMap = value as Map<Object?, Object?>;

          //  Convert the value map to profile model
          var profile = ProfileModel.fromJson(
            valueMap.cast<String, dynamic>(),
          );

          //  Get the profile role
          final profileRole = AppRoleEnum.fromString(profile.role);

          //  Check if the profile role is owner
          if (profileRole == AppRoleEnum.owner) {
            //  Get the profile validation
            final profileValidation = await _getProfileValidation(
              profileId: profile.id,
            );

            //  Check if the profile validation is not null
            if (profileValidation != null) {
              //  Add the profile validation to the profile
              profile = profile.copyWith(validation: profileValidation);
            }
          }

          //  Check if the profile is not yet verified
          if (profile.isApproved == null) {
            //  Check if the profile role is not admin
            if (profileRole == AppRoleEnum.owner) {
              //  Add the profile to the profile list
              profileList.add(profile);
            }
          }
        }
      }

      if (sort != null) {
        switch (sort) {
          case VerificationSortEnum.email:
            profileList.sort((a, b) => a.email.compareTo(b.email));
          case VerificationSortEnum.createdDate:
            profileList.sort((a, b) => a.createdDate.compareTo(b.createdDate));
          case VerificationSortEnum.updatedDate:
          case VerificationSortEnum.name:
          case VerificationSortEnum.none:
        }
      }

      //  Return the profile list
      return profileList;
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to put the verification if approved or declined.
  ///
  static Future<Either<Failure, bool>> putVerification({
    required String profileId,
    required bool isApproved,
  }) async {
    try {
      //  Get the reference of the profile.
      final profileRef = FirebaseDatabase.instance.ref(
        '$tProfile/$profileId',
      );

      //  Update the profile with the isApproved value
      await profileRef.update({
        'is_approved': isApproved,
      });

      //  Return the success
      return Right(isApproved);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ProfileValidationModel?> _getProfileValidation({
    required String profileId,
  }) async {
    //  Get the reference of the profile validation.
    final validation = FirebaseDatabase.instance.ref(
      tOwnerValidation,
    );

    //  Get the snapshot of the validation.
    final validationSnapshot = await validation.get();

    //  Check if the validation snapshot is not null
    if (validationSnapshot.value != null) {
      //  Convert the validation snapshot to validation model
      final validationMap = validationSnapshot.value! as Map<dynamic, dynamic>;

      //  Loop through the validation map
      for (final value in validationMap.values) {
        //  Convert the value to value map
        final valueMap = value as Map<Object?, Object?>;

        //  Check if the value map contains the owner id
        if (valueMap.containsKey('owner_id')) {
          final ownerId = valueMap['owner_id']!;

          //  Check if the owner id is equal to the profile id
          if (ownerId == profileId) {
            //  Convert the value map to validation model
            final validationModel = ProfileValidationModel.fromJson(
              value.cast<String, dynamic>(),
            );

            //  Return the validation model
            return validationModel;
          }
        }
      }
    }

    //  Return null if the validation snapshot is null
    return null;
  }
}
