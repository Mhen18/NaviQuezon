import 'package:firebase_database/firebase_database.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/keys/database_keys.dart';
import 'package:naviquezon/src/features/user/faq/domain/models/faq_add_model.dart';
import 'package:naviquezon/src/features/user/faq/domain/models/faq_model.dart';

//  Create a list of faq model

///{@template FaqFirebaseRepository}
/// Repository for frequently asked questions that use firebase as
/// the data source.
///{@endtemplate}
class FaqFirebaseRepository {
  /// Future method to get the faq list.
  ///
  static Future<Either<Failure, List<FaqModel>>> getFaqList() async {
    try {
      //  Get the reference of the faq.
      final faqRef = FirebaseDatabase.instance.ref(tFaq);

      //  Get the snapshot of the faq.
      final faqSnapshot = await faqRef.get();

      //  Create a list of faq model.
      final faqList = <FaqModel>[];

      //  Check if the faq snapshot is not null
      if (faqSnapshot.value != null) {
        final faqMap = faqSnapshot.value! as Map<dynamic, dynamic>;

        for (final value in faqMap.values) {
          final valueMap = value as Map<Object?, Object?>;

          //  Convert the value map to faq model
          final faq = FaqModel.fromJson(
            valueMap.cast<String, dynamic>(),
          );

          //  Add the faq to the faq list
          faqList.add(faq);
        }
      }

      //  Return the faq list
      return Right(faqList);
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to add new FAQ.
  ///
  static Future<void> postFaq({
    required FaqAddModel faq,
  }) async {
    try {
      //  Get the reference to the database
      final faqRef = FirebaseDatabase.instance.ref(tFaq);

      //  Push the faq to the database
      final faqPush = faqRef.push();

      await faqPush.set(faq.toJson());

      if (faqPush.key != null) {
        final newFaq = faqRef.child(faqPush.key ?? '');

        await newFaq.update({
          'id': newFaq.key,
          'created_date': ServerValue.timestamp,
          'updated_date': ServerValue.timestamp,
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to edit FAQ.
  ///
  static Future<void> patchFaq({
    required FaqAddModel faq,
    required String faqId,
  }) async {
    try {
      //  Get the reference to the database
      final faqRef = FirebaseDatabase.instance.ref('$tFaq/$faqId');

      //  Get the snapshot of the faq.
      final snapShot = await faqRef.get();

      //  Check if the faq snapshot is not null.
      if (snapShot.value != null) {
        final faqMap = snapShot.value! as Map<dynamic, dynamic>;
        final faqData = FaqModel.fromJson(
          faqMap.cast<String, dynamic>(),
        ).copyWith(
          question: faq.question,
          answer: faq.answer,
        );

        await faqRef.update(
          faqData.toJson()
            ..addAll(
              {'updated_date': ServerValue.timestamp},
            ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to delete FAQ.
  ///
  static Future<Either<Failure, void>> deleteFaq({
    required String faqId,
  }) async {
    try {
      //  Get the reference to the database
      final faqRef = FirebaseDatabase.instance.ref('$tFaq/$faqId');

      //  Get the snapshot of the faq.
      final snapShot = await faqRef.get();

      //  Check if the faq snapshot is not null.
      if (snapShot.value != null) {
        //  Remove the faq from the database
        await faqRef.remove();

        //  Return the success result
        return const Right(null);
      }

      //  Return the default failures
      return const Left(DefaultFailure());
    } catch (e) {
      rethrow;
    }
  }
}
