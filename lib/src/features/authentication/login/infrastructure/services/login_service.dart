import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/services/shared_pref_service.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/keys/shared_pref_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/authentication/login/domain/models/login_model.dart';
import 'package:naviquezon/src/features/authentication/login/infrastructure/repositories/login_firebase_repository.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template LoginService}
/// Service for the login module.
///{@endtemplate}
class LoginService {
  final _sharedPrefService = SharedPrefService();

  /// Future method to post the login for user role.
  ///
  Future<Either<Failure, ProfileModel>> postLogin({
    required LoginModel login,
  }) async {
    try {
      final loginRepo = await LoginFirebaseRepositories.postLogin(
        login: login,
      );

      //  Check if the response is successful or not.
      return loginRepo.fold(
        Left.new,
        (r) async {
          //  Get the user id from the response.
          final profile = r;

          //  Set the user id in shared preference.
          await _sharedPrefService.setStringSharedPref(spUserId, profile.id);

          //  Return the profile model.
          return Right(profile);
        },
      );
    } on Exception catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);
      return const Left(DefaultFailure());
    }
  }
}
