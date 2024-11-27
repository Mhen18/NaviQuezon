import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/models/email/email_model.dart';
import 'package:naviquezon/src/core/providers/email_api_provider.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';

class EmailService {
  final _emailChopper = ChopperClient(
    interceptors: [
      HttpLoggingInterceptor(),
    ],
    converter: const JsonConverter(),
    errorConverter: const JsonConverter(),
    services: [
      EmailApiProvider.create(),
    ],
  );

  Future<Either<Failure, Response<dynamic>>> sendEmail({
    required EmailModel email,
  }) async {
    try {
      final response = await _emailChopper
          .getService<EmailApiProvider>()
          .sendEmail(email: email);

      if (response.isSuccessful) {
        return Right(response);
      } else {
        return const Left(DefaultFailure());
      }
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return Left(
        DefaultFailure(message: e.toString()),
      );
    }
  }
}
