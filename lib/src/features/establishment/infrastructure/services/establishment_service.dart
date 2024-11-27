import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/services/shared_pref_service.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/keys/shared_pref_keys.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_add_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_itinerary_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_review_add_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_survey_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/repositories/establishment_firebase_repository.dart';

///{@template EstablishmentServices}
/// Service for handling establishment module.
///{@endtemplate}
class EstablishmentService {
  final _sharedPrefService = SharedPrefService();
  /// Future method to get the owner's establishment.
  ///
  Future<Either<Failure, EstablishmentModel?>> getOwnerEstablishment() async {
    try {
      //  Get the owner id from the shared preference.
      final ownerId = await _sharedPrefService.readStringSharedPref(spUserId);

      //  Check if the owner id is null.
      if (ownerId == null) {
        //  Return a default failures if the owner id is null.
        return const Left(DefaultFailure());
      }

      //  Get the owner's establishment from the repository.
      final esta = await EstablishmentFirebaseRepository.getOwnerEstablishment(
        ownerId: ownerId,
      );

      return esta;
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to get the establishment list.
  ///
  Future<Either<Failure, List<EstablishmentModel>>> getEstablishments({
    String? query,
  }) async {
    try {
      final establishmentList = <EstablishmentModel>[];

      //  Get the establishment list from the repository.
      final req = await EstablishmentFirebaseRepository.getEstablishmentList(
        query: query,
      );

      //  Loop through the establishment list.
      for (final establishment in req) {
        //  Check if the establishment municipality is not null.
        if (establishment.municipality != null) {
          for (final sMunicipality in sMunicipalityList) {
            final municipalityName = establishment.municipality?.toLowerCase();
            final sMunicipalityName = sMunicipality.toLowerCase();

            //  Check if the municipality name is the same.
            if (municipalityName == sMunicipalityName) {
              establishmentList.add(establishment);
            }
          }
        }
      }


      return Right(establishmentList);
    } catch (e, stackTrace) {
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to get the establishment details.
  ///
  Future<Either<Failure, EstablishmentModel>> getEstablishmentDetails(
    String establishmentId,
  ) async {
    try {
      final req = await EstablishmentFirebaseRepository.getEstablishmentDetails(
        establishmentId,
      );

      return Right(req);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to add/edit the establishment.
  ///
  Future<Either<Failure, void>> setupEstablishment({
    EstablishmentAddModel? establishmentAdd,
    EstablishmentModel? establishment,
  }) async {
    try {
      //  Get the owner id from the shared preference.
      final ownerId = await _sharedPrefService.readStringSharedPref(spUserId);

      if (ownerId == null) {
        return const Left(DefaultFailure());
      }

      //  Check if the establishment and establishmentAdd is null.
      if (establishment == null && establishmentAdd == null) {
        return const Left(DefaultFailure());
      }

      if (establishmentAdd != null) {
        //  Add the establishment to the firebase repository.
        await EstablishmentFirebaseRepository.postEstablishment(
          establishment: establishmentAdd.copyWith(
            ownerId: ownerId,
          ),
        );
      } else if (establishment != null) {
        //  Edit the establishment to the firebase repository.
        await EstablishmentFirebaseRepository.patchEstablishment(
          establishment: establishment,
        );
      }

      return const Right(null);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to add the establishment review.
  ///
  Future<Either<Failure, void>> addEstablishmentReview({
    required EstablishmentReviewAddModel review,
    required String establishmentId,
  }) async {
    try {
      final userId = await _sharedPrefService.readStringSharedPref(spUserId);

      if (userId == null) {
        return const Left(DefaultFailure());
      }

      await EstablishmentFirebaseRepository.postEstablishmentReview(
        review: review.copyWith(
          userId: userId,
        ),
        establishmentId: establishmentId,
      );

      return const Right(null);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to like or unlike the establishment.
  ///
  Future<Either<Failure, void>> likeEstablishment({
    required String establishmentId,
    required bool like,
  }) async {
    try {
      final userId = await _sharedPrefService.readStringSharedPref(spUserId);

      if (userId == null) {
        return const Left(DefaultFailure());
      }

      await EstablishmentFirebaseRepository.patchProfileEstablishmentLike(
        estaId: establishmentId,
        userId: userId,
        like: like,
      );

      return const Right(null);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to add establishment itinerary.
  ///
  Future<Either<Failure, void>> itineraryEstablishment({
    required EstablishmentItineraryModel itinerary,
    required bool add,
  }) async {
    try {
      final userId = await _sharedPrefService.readStringSharedPref(spUserId);

      if (userId == null) {
        return const Left(DefaultFailure());
      }

      await EstablishmentFirebaseRepository.patchProfileEstablishmentItinerary(
        itinerary: itinerary,
        userId: userId,
        add: add,
      );

      return const Right(null);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }

  /// Future method to add establishment survey.
  ///
  Future<Either<Failure, void>> addEstablishmentSurvey({
    required EstablishmentSurveyModel survey,
    required String establishmentId,
  }) async {
    try {
      final userId = await _sharedPrefService.readStringSharedPref(spUserId);

      if (userId == null) {
        return const Left(DefaultFailure());
      }

      await EstablishmentFirebaseRepository.postEstablishmentSurvey(
        survey: survey.copyWith(
          userId: userId,
        ),
        establishmentId: establishmentId,
      );

      return const Right(null);
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);

      return const Left(DefaultFailure());
    }
  }
}
