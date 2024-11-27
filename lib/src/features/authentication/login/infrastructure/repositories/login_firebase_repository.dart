import 'package:firebase_database/firebase_database.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/features/authentication/login/domain/failures/login_failure.dart';
import 'package:naviquezon/src/features/authentication/login/domain/failures/login_password_failure.dart';
import 'package:naviquezon/src/features/authentication/login/domain/failures/login_validation_reject_failure.dart';
import 'package:naviquezon/src/features/authentication/login/domain/models/login_model.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/infrastructure/repositories/profile_firebase_repository.dart';

///{@template LoginFirebaseRepositories}
/// Repository for the login with firebase.
///{@endtemplate}
class LoginFirebaseRepositories {
  /// Future method to post the login.
  ///
  static Future<Either<Failure, ProfileModel>> postLogin({
    required LoginModel login,
  }) async {
    try {
      //  Get the reference to the database
      final reference = FirebaseDatabase.instance.ref('profile');

      //  Get the snapshot of the profile
      final profileSnapshot = await reference.get();

      //  Check if the password is correct
      var correctPassword = false;

      //  Check if the profile snapshot is not null
      if (profileSnapshot.value != null) {
        final profileMap = profileSnapshot.value! as Map<dynamic, dynamic>;

        for (final value in profileMap.values) {
          final valueMap = value as Map<Object?, Object?>;

          //  Get the profile role
          final roleValue = valueMap['role'] ?? 'user';
          final role = AppRoleEnum.fromString(
            roleValue.toString(),
          );

          //  Get the email and phone
          final email = valueMap['email'];
          final phone = valueMap['phone'];

          if (email == login.emailOrPhone || phone == login.emailOrPhone) {
            final password = valueMap['password'];
            //  Check if the password is the same as the login password
            if (password == login.password) {
              correctPassword = true;

              //  Check if the role is owner for approval validation.
              if (role == AppRoleEnum.owner) {
                // Check if the value map has the is_valid key
                final hasApproved = valueMap.containsKey('is_approved');

                if (hasApproved) {
                  final isApproved = valueMap['is_approved'];
                  //  Check if the account has been approved
                  if (isApproved == false) {
                    //  Return the login validation reject failures
                    return const Left(LoginValidationRejectFailure());
                  }
                }else{
                  //  Return the login validation reject failures
                  return const Left(LoginValidationRejectFailure());
                }
              }

              //  Convert the value map to profile model and replace
              //  the validation
              final profile = await ProfileFirebaseRepository.getProfile(
                userId: valueMap['id'].toString(),
              );

              //  Return the profile model.
              return Right(profile);
            } else {
              correctPassword = false;
            }
          }
        }
      }

      if (correctPassword == false) {
        //  Return the login failures
        return const Left(LoginPasswordFailure());
      } else {
        //  Return the login failures
        return const Left(LoginFailure());
      }
    } catch (e) {
      //  Rethrow the exception
      rethrow;
    }
  }
}
