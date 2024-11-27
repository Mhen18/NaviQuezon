import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/models/email/email_model.dart';
import 'package:naviquezon/src/core/services/email_service.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/features/admin/accounts/domain/failures/account_invite_failure.dart';
import 'package:naviquezon/src/features/admin/accounts/domain/models/admin_add_model.dart';
import 'package:naviquezon/src/features/admin/accounts/domain/models/admin_email_template_model.dart';
import 'package:naviquezon/src/features/admin/accounts/infrastructure/repositories/account_firebase_repository.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template AccountService}
/// Service for the account module.
///{@endtemplate}
class AccountService {
  final _emailService = EmailService();

  /// Future method to get the admin account list.
  ///
  Future<Either<Failure, List<ProfileModel>>> getAdminAccountList() async {
    try {
      //  Call the repository to get the admin account list
      final accountList = await AccountFirebaseRepository.getAdminAccountList();

      //  Return the admin account list
      return Right(accountList);
    } catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }

  /// Future method to add an admin account.
  ///
  Future<Either<Failure, void>> addAdminAccount(
    AdminAddModel admin,
  ) async {
    try {
      //  Call the repository to add the admin account
      final request = await AccountFirebaseRepository.postAccountAdmin(
        admin: admin,
      );

      //  Return the request result.
      return request.fold(
        Left.new,
        (r) async {
          final password = r;

          //  Create the email model.
          final emailModel = EmailModel(
            serviceId: sEmailServiceId,
            templateId: sEmailTemplateAdminInviteId,
            userId: sEmailUserId,
            accessToken: sEmailAccessToken,
            template: AdminEmailTemplateModel(
              subject: 'Welcome to Naviquezon',
              name: admin.firstName,
              email: admin.email,
              password: password,
            ).toJson(),
          );

          //  Request to send the email.
          final service = await _emailService.sendEmail(
            email: emailModel,
          );

          //  Return the service result.
          return service.fold(
            (f) => const Left(AccountInviteFailure()),
            (r) => const Right(null),
          );
        },
      );
    } catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }

  /// Future method to delete an admin account.
  ///
  Future<Either<Failure, void>> deleteAdminAccount(
    String id,
  ) async {
    try {
      //  Call the repository to delete the admin account
      await AccountFirebaseRepository.deleteAccountAdmin(id);

      return const Right(null);
    } catch (e) {
      return Left(DefaultFailure(message: e.toString()));
    }
  }
}
