import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/services/shared_pref_service.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/keys/shared_pref_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/registration_model.dart';
import 'package:naviquezon/src/features/authentication/registration/infrastructures/repositories/registration_firebase_repository.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/infrastructure/services/profile_service.dart';

///{@template RegistrationService}
/// Service for registration authentication module.
///{@endtemplate}
class RegistrationService {
  final _profileService = ProfileService();
  final _sharedPrefService = SharedPrefService();

  /// Future method to post the registration for user role.
  ///
  Future<Either<Failure, ProfileModel?>> postRegistration({
    required RegistrationModel registration,
  }) async {
    try {
      final validation = registration.validation;
      if (validation != null) {
        //  Check the validation.
        //  Check if the front ID is empty.
        if (validation.idFront.isEmpty) {
          return const Left(DefaultFailure(message: 'Front ID is required'));
        }

        //  Check if the back ID is empty.
        if (validation.idBack.isEmpty) {
          return const Left(DefaultFailure(message: 'Back ID is required'));
        }

        //  Check if the front business permit is empty.
        if (validation.permitFront.isEmpty) {
          return const Left(
            DefaultFailure(message: 'Front Business Permit is required'),
          );
        }

        //  Check if the back business permit is empty.
        if (validation.permitBack.isEmpty) {
          return const Left(
            DefaultFailure(message: 'Back Business Permit is required'),
          );
        }

        //  Check if the formal picture is empty.
        if (validation.formalPicture.isEmpty) {
          return const Left(
            DefaultFailure(message: 'Formal Picture is required'),
          );
        }
      }

      //  Push the registration user.
      final repo = await RegistrationFirebaseRepository.pushRegistration(
        registration: registration,
      );

      //  Fold the result.
      return repo.fold(
        Left.new,
        (r) async {
          //  Get the profile key as the account id
          final profileId = r;

          //  Check if the profile id is available.
          if (profileId != null) {
            //  Set the user id in shared preference.
            await _sharedPrefService.setStringSharedPref(spUserId, profileId);

            //  Get the profile.
            final profile = await _profileService.getProfile();

            //  Return the profile result.
            return profile;
          } else {
            return const Right(null);
          }
        },
      );
    } on Exception catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return a default failures if the exception occurs.
      return const Left(DefaultFailure());
    }
  }

// /// Future method to post the verification of the user's or owner's
// /// registration.
// Future<Either<Failure, void>> postRegistrationVerification({
//   required String profileId,
// }) async {
//   try {
//     //  Push the registration user.
//     final repo = await RegistrationFirebaseRepository.pushRegistration(
//       registration: registration,
//     );
//
//     //  Fold the result.
//     return repo.fold(
//       Left.new,
//       Right.new,
//     );
//   } catch (e, stackTrace) {
//     printError(e);
//     printError(stackTrace);
//
//     //  Return a default failures if the exception occurs.
//     return const Left(DefaultFailure());
//   }
// }
}
