import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/keys/database_keys.dart';
import 'package:naviquezon/src/features/admin/accounts/domain/models/admin_add_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/failures/email_already_exist_failure.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/infrastructure/repositories/profile_firebase_repository.dart';

///{@template AccountFirebaseRepository}
/// Repository for account that use firebase as the data source.
///{@endtemplate}
class AccountFirebaseRepository {
  static String _generatePassword() {
    const chars =
        r'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:,.<>?/~`';
    final random = Random.secure();
    return List.generate(
      10,
      (index) => chars[random.nextInt(chars.length)],
    ).join();
  }

  /// Future method to get the admin account list.
  ///
  static Future<List<ProfileModel>> getAdminAccountList() async {
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
          final profile = ProfileModel.fromJson(
            valueMap.cast<String, dynamic>(),
          );

          //  Get the profile role
          final profileRole = AppRoleEnum.fromString(profile.role);

          //  Check if the profile role is owner
          if (profileRole == AppRoleEnum.admin) {
            //  Add the profile to the profile list
            profileList.add(profile);
          }
        }
      }

      //  Return the profile list
      return profileList;
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to post an admin account to the database.
  ///
  static Future<Either<Failure, String>> postAccountAdmin({
    required AdminAddModel admin,
  }) async {
    try {
      //  Get the admin account list
      final profileList = await ProfileFirebaseRepository.getProfileList();

      //  Loop through the profile list to check if the email is already exist
      for (final profile in profileList) {
        if (profile.email == admin.email) {
          return Left(EmailAlreadyExistFailure());
        } else if (profile.phone == admin.phone) {
          return const Left(
            DefaultFailure(message: 'Phone already exist.'),
          );
        }
      }

      //  Get the reference of the profile.
      final profileRef = FirebaseDatabase.instance.ref(tProfile);

      //  Push the profile key
      final profileKey = profileRef.push();

      //  Get the reference of the profile key
      final profileKeyRef = profileRef.child('/${profileKey.key}');

      //  Set the profile key
      await profileKeyRef.set(admin.toJson());

      final password = _generatePassword();

      //  Update the profile with the id, role, created date, and
      //  updated date
      await profileKeyRef.update({
        'id': profileKey.key,
        'password': password,
        'role': AppRoleEnum.admin.value,
        'created_date': ServerValue.timestamp,
        'updated_date': ServerValue.timestamp,
      });

      return Right(password);
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to delete an admin account from the database.
  ///
  static Future<void> deleteAccountAdmin(String id) async {
    try {
      //  Get the reference of the profile.
      final profileRef = FirebaseDatabase.instance.ref(tProfile);

      //  Remove the profile with the id
      await profileRef.child(id).remove();
    } catch (e) {
      rethrow;
    }
  }
}
