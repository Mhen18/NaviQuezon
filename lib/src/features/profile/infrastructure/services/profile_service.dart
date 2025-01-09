import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/services/shared_pref_service.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/keys/shared_pref_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/infrastructure/repositories/profile_firebase_repository.dart';

///{@template ProfileService}
/// Service for profile module.
///{@endtemplate}
class ProfileService {
  final _sharedPrefService = SharedPrefService();

  /// Future method to get profile information.
  ///
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      //  Get the user id from shared preference.
      final userId = await _sharedPrefService.readStringSharedPref(spUserId);

      //  Check if the user id is available.
      if (userId == null) {
        //  Return default failures if user id is not available.
        return const Left(DefaultFailure());
      }

      //  Get the profile from the repository.
      final profile = await ProfileFirebaseRepository.getProfile(
        userId: userId,
      );

      //  Return the profile.
      return Right(profile);
    } on Exception catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return default failures if any exception occurs.
      return const Left(DefaultFailure());
    }
  }

  /// Future method to update profile information.
  ///
  Future<Either<Failure, ProfileModel>> updateProfile({
    required ProfileModel profile,
  }) async {
    try {
      //  Update the profile from the repository.
      await ProfileFirebaseRepository.patchProfile(
        profile: profile,
      );

      //  Get the updated profile.
      final newProfile = await ProfileFirebaseRepository.getProfile(
        userId: profile.id,
      );

      //  Return the profile.
      return Right(newProfile);
    } on Exception catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return default failures if any exception occurs.
      return const Left(DefaultFailure());
    }
  }

  /// Future method to update password.
  ///
  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      //  Get the user id from shared preference.
      final userId = await _sharedPrefService.readStringSharedPref(spUserId);

      //  Check if the user id is available.
      if (userId == null) {
        //  Return default failures if user id is not available.
        return const Left(DefaultFailure());
      }

      //  Update the profile password from the repository.
      final request = await ProfileFirebaseRepository.patchProfilePassword(
        profileId: userId,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      return request;
    } on Exception catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return default failures if any exception occurs.
      return const Left(DefaultFailure());
    }
  }
}
