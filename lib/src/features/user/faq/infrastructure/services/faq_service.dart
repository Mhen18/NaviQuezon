import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/user/faq/domain/models/faq_add_model.dart';
import 'package:naviquezon/src/features/user/faq/domain/models/faq_model.dart';
import 'package:naviquezon/src/features/user/faq/infrastructure/repositories/faq_firebase_repository.dart';

///{@template FaqService}
/// Service for the frequently asked questions module.
///{@endtemplate}
class FaqService {
  /// Future method to get the faq list.
  Future<Either<Failure, List<FaqModel>>> getFaqList() async {
    try {
      //  Get the verification list from the firebase repository
      final faq = await FaqFirebaseRepository.getFaqList();

      //  Return the faq repository result.
      return faq;
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return the default failures
      return const Left(DefaultFailure());
    }
  }

  /// Future method to save the faq.
  ///
  Future<Either<Failure, void>> setupFaq({
    required FaqAddModel faq,
    String? faqId,
  }) async {
    try {
      //  Check if the faq id is not null
      if (faqId != null) {
        //  Patch the faq to the firebase repository
        await FaqFirebaseRepository.patchFaq(faq: faq, faqId: faqId);
      } else {
        //  Save the faq to the firebase repository
        await FaqFirebaseRepository.postFaq(faq: faq);
      }

      //  Return the success result
      return const Right(null);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return the default failures
      return const Left(DefaultFailure());
    }
  }

  /// Future method to delete the faq.
  ///
  Future<Either<Failure, void>> deleteFaq({
    required String faqId,
  }) async {
    try {
      final request = await FaqFirebaseRepository.deleteFaq(faqId: faqId);

      return request;
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      //  Return the default failures
      return const Left(DefaultFailure());
    }
  }
}
