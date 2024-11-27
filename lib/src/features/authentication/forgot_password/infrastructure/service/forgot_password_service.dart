import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/models/email/email_model.dart';
import 'package:naviquezon/src/core/models/email/email_template_model.dart';
import 'package:naviquezon/src/core/services/email_service.dart';
import 'package:naviquezon/src/core/utils/constants/exceptions/email_not_exist_excetion.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/constants/failures/email_not_exist.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:naviquezon/src/features/profile/infrastructure/repositories/profile_firebase_repository.dart';

class ForgotPasswordService {
  final _emailService = EmailService();

  /// Getter for the generated OTP.
  ///
  String get _generateOtp {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        5,
        (_) => characters.codeUnitAt(random.nextInt(characters.length)),
      ),
    );
  }

  /// Future method to send reset password email.
  ///
  Future<Either<Failure, ForgotPasswordEntity>> sendResetPasswordEmail({
    required String email,
  }) async {
    try {
      //  Create the email subject and OTP.
      const subject = 'Reset Password';
      final otp = _generateOtp;

      //  Check if the email exists.
      final profile = await ProfileFirebaseRepository.getProfileByEmail(
        email,
      );

      //  Return failures if the email does not exist.
      if (profile == null) {
        return const Left(EmailNotExistFailure());
      }

      //  Create the email model.
      final emailModel = EmailModel(
        serviceId: sEmailServiceId,
        templateId: sEmailTemplateForgotPasswordId,
        userId: sEmailUserId,
        accessToken: sEmailAccessToken,
        template: EmailTemplateModel(
          subject: subject,
          email: profile.email,
          name: profile.firstName,
          resetOtp: otp,
        ).toJson(),
      );

      //  Request to send the email.
      final service = await _emailService.sendEmail(email: emailModel);

      //  Create the forgot password entity.
      final forgotPassword = ForgotPasswordEntity(
        email: email,
        otp: otp,
        date: DateTime.now(),
      );

      //  Return the service result.
      return service.fold(
        Left.new,
        (_) => Right(forgotPassword),
      );
    } on EmailNotExistException catch (e) {
      printError(e);

      return Left(
        DefaultFailure(message: e.message),
      );
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return Left(
        DefaultFailure(message: e.toString()),
      );
    }
  }

  /// Future method to reset and create new password.
  ///
  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String password,
  }) async {
    try {
      //  Check if the email exists.
      final profile = await ProfileFirebaseRepository.getProfileByEmail(
        email,
      );

      //  Return failures if the email does not exist.
      if (profile == null) {
        return const Left(EmailNotExistFailure());
      }

      //  Update the profile password.
      return ProfileFirebaseRepository.resetProfilePassword(
        profileId: profile.id,
        password: password,
      );
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }
}
