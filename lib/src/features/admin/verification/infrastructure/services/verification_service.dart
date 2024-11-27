import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/admin/verification/domain/verification_sort_enum.dart';
import 'package:naviquezon/src/features/admin/verification/infrastructure/repositories/verification_firebase_repository.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template VerificationService}
/// Service for the admin verification module.
///{@endtemplate}
class VerificationService {
  /// Future method to get the list of account that needs verification.
  ///
  Future<Either<Failure, List<ProfileModel>>> getVerificationList({
    required VerificationSortEnum sort,
  }) async {
    try {
      //  Get the verification list from the firebase repository
      final list = await VerificationFirebaseRepository.getVerificationList(
        sort: sort,
      );

      //  Return the profile list
      return Right(list);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return the default failures
      return const Left(DefaultFailure());
    }
  }

  /// Method to put the verification.
  ///
  Future<Either<Failure, bool>> putVerification({
    required String profileId,
    required bool isApproved,
  }) async {
    try {
      //  Put the verification to the firebase repository
      await VerificationFirebaseRepository.putVerification(
        profileId: profileId,
        isApproved: isApproved,
      );

      //  Return the success
      return Right(isApproved);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return the default failures
      return const Left(DefaultFailure());
    }
  }
}
