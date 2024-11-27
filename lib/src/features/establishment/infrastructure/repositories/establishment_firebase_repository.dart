import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/keys/database_keys.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_add_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_amenity_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_itinerary_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_report_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_review_add_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_review_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_survey_model.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/infrastructure/repositories/profile_firebase_repository.dart';

///{@template EstablishmentFirebaseRepository}
/// Repository for establishment that use firebase as the data source.
///{@endtemplate}
class EstablishmentFirebaseRepository {
  /// Future method to compress the image file.
  ///
  static Future<XFile?> _convertFile(File file, String targetPath) async {
    //  Compress the image file to webp format
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      format: CompressFormat.webp,
    );

    return result;
  }

  /// Future method to upload the image to the storage.
  ///
  static Future<String> _uploadImage({
    required String refPath,
    required String path,
    required String child,
  }) async {
    //  Get the reference to the storage
    final storage = FirebaseStorage.instance.ref(refPath);

    //  Get the file from the image path
    final file = File(path);

    //  Get the path extension and convert the file to webp format
    final pathExtension = path.split('.').last;
    final convertedPath = path.replaceAll(pathExtension, '.webp');
    final converted = await _convertFile(file, convertedPath);

    //  Upload the file to the storage
    if (converted != null) {
      await storage.child(child).putFile(File(converted.path));
    } else {
      await storage.child(child).putFile(file);
    }

    //  Get the download url
    final url = await storage.child(child).getDownloadURL();

    //  Return the url
    return url;
  }

  /// Future method to get the list of establishment's amenities
  ///
  static List<EstablishmentAmenityModel>? _getAmenityList(
    Map<Object?, Object?> map,
  ) {
    try {
      //  Check if the establishment has amenities.
      if (map.containsKey('amenities')) {
        //  Create a list of establishment amenity model.
        final amenities = <EstablishmentAmenityModel>[];

        //  Get the list of amenities from the establishment.
        final amenityList = map['amenities']! as List<Object?>;

        //  Loop through the list of amenities.
        for (final amenity in amenityList) {
          if (amenity != null) {
            //  Convert the amenity to map.
            final amenityMap = amenity as Map<Object?, Object?>;
            //  Convert the amenity map to establishment amenity model.
            final amenityModel = EstablishmentAmenityModel.fromJson(
              amenityMap.cast<String, dynamic>(),
            );

            amenities.add(amenityModel);
          }
        }

        return amenities;
      }
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);
    }
    return null;
  }

  /// Future method to get the list of establishment's review
  ///
  static List<EstablishmentReviewModel>? _getReviewList(
    Map<Object?, Object?> map,
  ) {
    try {
      //  Check if the establishment has reviews.
      if (map.containsKey('reviews')) {
        //  Create a list of establishment review model.
        final reviews = <EstablishmentReviewModel>[];

        //  Get the list of reviews from the establishment.
        final reviewList = map['reviews']! as List<Object?>;

        //  Loop through the list of reviews.
        for (final review in reviewList) {
          if (review != null) {
            //  Convert the review to map.
            final reviewMap = review as Map<Object?, Object?>;

            //  Convert the review map to establishment review model.
            final reviewModel = EstablishmentReviewModel.fromJson(
              reviewMap.cast<String, dynamic>(),
            );

            //  Add the review model to the list.
            reviews.add(reviewModel);
          }
        }

        // Sort the reviews by updatedDate in descending order (latest first)
        reviews.sort((a, b) => b.updatedDate.compareTo(a.updatedDate));

        return reviews;
      }
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);
    }

    return null;
  }

  /// Future method to get the establishment's rating
  ///
  static num? _getRating({
    List<EstablishmentReviewModel>? reviews,
  }) {
    //  Check if the reviews is null or empty.
    if (reviews == null || reviews.isEmpty) {
      return null;
    }

    //  Get the total rating from the reviews.
    final totalRating = reviews.fold<num>(
      0,
      (previousValue, element) => previousValue + element.rate,
    );

    return totalRating / reviews.length;
  }

  static Future<List<EstablishmentReportModel>> _getReport(
    Map<Object?, Object?> map,
  ) async {
    final reports = <EstablishmentReportModel>[];

    try {
      //  Check if the establishment has survey.
      if (map.containsKey('survey')) {
        //  Get the list of survey from the establishment.
        final reportList = map['survey']! as List<Object?>;

        //  Loop through the list of reports.
        for (final report in reportList) {
          if (report != null) {
            //  Convert the report to map.
            final reportMap = report as Map<Object?, Object?>;

            //  Convert the report map to establishment report model.
            var reportModel = EstablishmentReportModel.fromJson(
              reportMap.cast<String, dynamic>()
                ..addAll({
                  'runtimeType': 'default',
                }),
            );

            final profile = await ProfileFirebaseRepository.getProfile(
              userId: reportModel.userId ?? '',
            );

            reportModel = reportModel.copyWith(
              municipality: profile.municipality,
              province: profile.province,
              country: profile.country,
            );

            //  Add the report model to the list.
            reports.add(reportModel);
          }
        }
      }
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);
    }

    return reports;
  }

  static List<EstablishmentSurveyModel> _getSurvey(
    Map<Object?, Object?> map,
  ) {
    final surveys = <EstablishmentSurveyModel>[];

    try {
      //  Check if the establishment has survey.
      if (map.containsKey('survey')) {
        //  Get the list of survey from the establishment.
        final surveyList = map['survey']! as List<Object?>;

        //  Loop through the list of survey.
        for (final survey in surveyList) {
          if (survey != null) {
            //  Convert the survey to map.
            final surveyMap = survey as Map<Object?, Object?>;

            //  Convert the survey map to establishment survey model.
            final surveyModel = EstablishmentSurveyModel.fromJson(
              surveyMap.cast<String, dynamic>()
                ..addAll({
                  'runtimeType': 'default',
                }),
            );

            //  Add the survey model to the list.
            surveys.add(surveyModel);
          }
        }
      }
    } catch (e, stackTrace) {
      printError(e);
      printError(stackTrace);
    }

    return surveys;
  }

  /// Future method to get the owner's profile from the firebase.
  ///
  static Future<ProfileModel> _getOwnerProfile(
    Map<Object?, Object?> map,
  ) async {
    if (map.containsKey('owner_id')) {
      //  Get the owner id from the establishment.
      final ownerId = map['owner_id']! as String;

      //  Get the owner profile from the firebase.
      final profile = await ProfileFirebaseRepository.getProfile(
        userId: ownerId,
      );

      //  Return the owner profile.
      return profile;
    }

    throw Exception('Owner id not found.');
  }

  /// Method to cast establishment map to establishment model.
  ///
  static Future<EstablishmentModel> _castEstablishment(dynamic esta) async {
    //  Convert the establishment to map.
    final map = esta as Map<Object?, Object?>;

    //  Create a list of establishment amenity model.
    final amenities = _getAmenityList(map);

    //  Create a list of establishment review model.
    final reviews = _getReviewList(map);

    final rating = _getRating(reviews: reviews);

    final reports = await _getReport(map);

    final surveys = _getSurvey(map);

    final owner = await _getOwnerProfile(map);

    //  Get the owner municipality
    var municipality = owner.municipality;
    //  Get the establishment municipality
    final municipalityMap = map['municipality'];

    //  Check if the establishment municipality is not null.
    if (municipalityMap != null) {
      final castMunicipality = municipalityMap as String;
      if (castMunicipality.isNotEmpty) {
        //  Convert the establishment municipality to string.
        municipality = castMunicipality;
      }
    }

    //  Convert the establishment map to establishment model.
    final establishment = EstablishmentModel.fromJson(
      map.cast<String, dynamic>(),
    ).copyWith(
      amenities: amenities,
      reviews: reviews,
      rating: rating,
      report: reports,
      survey: surveys,
      municipality: municipality,
    );

    //  Return the establishment model with the copy text of other properties.
    return establishment;
  }

  static Future<bool> _ownerIdentifier(String? ownerId) async {
    //  Check if the owner id is null and throw an exception.
    if (ownerId == null) {
      return false;
    }

    //  For validating if the user creating establishment is an owner.
    final profileRef = FirebaseDatabase.instance.ref('$tProfile/$ownerId');

    //  Get the snapshot of the profile
    final profileSnapshot = await profileRef.get();

    if (profileSnapshot.value != null) {
      //  Get the value from the snapshot
      final value = Map<String, dynamic>.from(profileSnapshot.value! as Map);

      //  Convert the value to ProfileModel
      final profile = ProfileModel.fromJson(value);

      //  Check if the user is an owner
      final role = AppRoleEnum.fromString(profile.role);

      //  Return if the user is an owner
      return role == AppRoleEnum.owner;
    }

    return false;
  }

  /// Future method to get the list of establishments
  ///
  static Future<List<EstablishmentModel>> getEstablishmentList({
    String? query,
  }) async {
    try {
      //  Create a list of establishment model.
      final estaList = <EstablishmentModel>[];

      //  Get the reference to the database
      final estaRef = FirebaseDatabase.instance.ref(tEstablishment);

      //  Get the snapshot of the establishment
      final estaSnapshot = await estaRef.get();

      //  Check if the snapshot is not null.
      if (estaSnapshot.value != null) {
        //  Convert the snapshot to map.
        final estaMap = estaSnapshot.value! as Map<dynamic, dynamic>;

        //  Loop through the establishment map.
        for (final esta in estaMap.values) {
          //  Convert the establishment to establishment model.
          final establishment = await _castEstablishment(esta);

          //  Check if the query is not null.
          if (query != null) {
            //  Get the establishment name.
            final name = establishment.name.toLowerCase();

            //  Check if the establishment name contains the query.
            if (name.contains(query.toLowerCase())) {
              estaList.add(establishment);
            }
          } else {
            //  Add the establishment model to the list.
            estaList.add(establishment);
          }
        }
      }

      //  Return the list of establishment model.
      return estaList;
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to get the establishment details from the firebase.
  ///
  static Future<EstablishmentModel> getEstablishmentDetails(
    String establishmentId,
  ) async {
    try {
      //  Get the reference to the database
      final estaRef = FirebaseDatabase.instance.ref(
        '$tEstablishment/$establishmentId',
      );

      //  Get the snapshot of the establishment
      final estaSnapshot = await estaRef.get();

      //  Check if the snapshot is null.
      if (estaSnapshot.value == null) {
        throw Exception('Establishment not found.');
      }

      //  Convert the establishment to establishment model.
      final establishment = await _castEstablishment(estaSnapshot.value);

      //  Return the establishment model.
      return establishment;
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to get the owner's establishment from the firebase.
  ///
  static Future<Either<Failure, EstablishmentModel?>> getOwnerEstablishment({
    required String ownerId,
  }) async {
    try {
      final estaRef = FirebaseDatabase.instance.ref(tEstablishment);

      final estaSnapshot = await estaRef.get();

      //  Check if the snapshot is null.
      if (estaSnapshot.value != null) {
        final estaMap = estaSnapshot.value! as Map<dynamic, dynamic>;

        //  Loop through the establishment map.
        for (final esta in estaMap.values) {
          //  Convert the establishment to establishment model.
          final establishment = await _castEstablishment(esta);

          //  Check if the owner id is equal to the establishment owner id.
          if (establishment.ownerId == ownerId) {
            return Right(establishment);
          }
        }
      }
      return const Right(null);
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to post the establishment to the firebase.
  ///
  static Future<void> postEstablishment({
    required EstablishmentAddModel establishment,
  }) async {
    try {
      //  Check if the user requesting is owner role.
      final isOwner = await _ownerIdentifier(establishment.ownerId);
      if (isOwner == false) {
        throw Exception('User is not an owner.');
      }

      //  Get the reference to the database
      final estaRef = FirebaseDatabase.instance.ref(tEstablishment);

      //  Push the establishment to the database
      final estaKey = estaRef.push();

      //  Set the establishment details to the database
      await estaKey.set(establishment.toJson());

      //  Check if the key is not null
      if (estaKey.key != null) {
        //  Get the reference to the new establishment
        final newEsta = estaRef.child(estaKey.key ?? '');

        //  Update the establishment with the id, created date and updated date
        await newEsta.update({
          'id': newEsta.key,
          'created_date': ServerValue.timestamp,
          'updated_date': ServerValue.timestamp,
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to patch the establishment to the firebase.
  ///
  static Future<void> patchEstablishment({
    required EstablishmentModel establishment,
  }) async {
    try {
      //  Check if the user requesting is owner role.
      final isOwner = await _ownerIdentifier(establishment.ownerId);
      if (isOwner == false) {
        throw Exception('User is not an owner.');
      }

      //  Get the reference to the database
      final id = establishment.id;
      final estaRef = FirebaseDatabase.instance.ref('$tEstablishment/$id');

      final estaSnapshot = await estaRef.get();

      //  Check if the snapshot is null.
      if (estaSnapshot.value == null) {
        throw Exception('Establishment not found.');
      }

      final estaMediaRef = '$tEstablishment/media/$id';

      //  Create a new establishment with the new details
      var newEsta = establishment;

      //  Check if the establishment has thumbnail
      if (establishment.thumbnail != null) {
        //  Check if the thumbnail is from the network
        final isNetwork = Uri.parse(establishment.thumbnail ?? '').isAbsolute;
        if (isNetwork == false) {
          //  Upload the thumbnail to the storage
          final thumbnail = await _uploadImage(
            refPath: estaMediaRef,
            path: establishment.thumbnail ?? '',
            child: 'thumbnail',
          );

          //  Update the establishment with the new thumbnail
          newEsta = newEsta.copyWith(thumbnail: thumbnail);
        }
      }

      //  Check if the establishment has video
      if (establishment.video != null) {
        //  Check if the video is from the network
        final isNetwork = Uri.parse(establishment.video ?? '').isAbsolute;
        if (isNetwork == false) {
          //  Upload the video to the storage
          final video = await _uploadImage(
            refPath: estaMediaRef,
            path: establishment.video ?? '',
            child: 'video',
          );

          //  Update the establishment with the new video
          newEsta = newEsta.copyWith(video: video);
        }
      }

      //  Check if the establishment has images
      if (establishment.images != null) {
        if (establishment.images!.isNotEmpty) {
          final images = <String>[];

          for (final image in establishment.images!) {
            //  Check if the image is from the network
            final isNetwork = Uri.parse(image).isAbsolute;
            if (isNetwork == false) {
              final index = establishment.images!.indexOf(image);

              //  Upload the video to the storage
              final newImage = await _uploadImage(
                refPath: estaMediaRef,
                path: image,
                child: 'images$index',
              );

              //  Add the new image to the list
              images.add(newImage);
            } else {
              //  Add the image to the list
              images.add(image);
            }
          }

          //  Update the establishment with the new images
          newEsta = newEsta.copyWith(images: images);
        }
      }

      //  Convert the establishment to json
      final updatedData = newEsta.toJson();

      //  Update the updateDate of the establishment
      updatedData['updated_date'] = ServerValue.timestamp;

      await estaRef.update(updatedData);
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to add establishment's review to firebase.
  ///
  static Future<void> postEstablishmentReview({
    required EstablishmentReviewAddModel review,
    required String establishmentId,
  }) async {
    try {
      final establishment = await getEstablishmentDetails(establishmentId);

      //  Get the reference to the database
      final reviewsRef = FirebaseDatabase.instance.ref(
        '$tEstablishment/${establishment.id}/reviews',
      );

      //  Get the reviews from the establishment
      final reviews = establishment.reviews ?? [];
      final newReview = review.copyWith(
        createdDate: ServerValue.timestamp,
        updatedDate: ServerValue.timestamp,
      );

      //  Check if the reviews is empty
      if (reviews.isEmpty) {
        //  Set the review details to the database
        await reviewsRef.set([
          newReview.toJson(),
        ]);
      } else {
        //  Set the review details to the database with the new review
        await reviewsRef.child('${reviews.length}').set(newReview.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to add the establishment survey to the database.
  ///
  static Future<void> postEstablishmentSurvey({
    required EstablishmentSurveyModel survey,
    required String establishmentId,
  }) async {
    try {
      final establishment = await getEstablishmentDetails(
        establishmentId,
      );

      final profile = await ProfileFirebaseRepository.getProfile(
        userId: survey.userId ?? '',
      );

      //  Get the reference to the database
      final surveyRef = FirebaseDatabase.instance.ref(
        '$tEstablishment/${establishment.id}/survey',
      );

      //  Get the survey from the establishment
      final surveyList = establishment.survey ?? [];

      final newSurvey = EstablishmentSurveyModel.add(
        userId: profile.id,
        date: survey.date,
        total: survey.total,
        female: survey.female,
        male: survey.male,
        createdDate: ServerValue.timestamp,
        updatedDate: ServerValue.timestamp,
      );

      //  Check if the reviews is empty
      if (surveyList.isEmpty) {
        //  Set the review details to the database
        await surveyRef.set([
          newSurvey.toJson()..remove('runtimeType'),
        ]);
      } else {
        //  Set the review details to the database with the new review
        await surveyRef.child('${surveyList.length}').set(newSurvey.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to patch profile's like establishment.
  ///
  static Future<void> patchProfileEstablishmentLike({
    required String userId,
    required String estaId,
    required bool like,
  }) async {
    try {
      final establishment = await getEstablishmentDetails(estaId);

      final profile = await ProfileFirebaseRepository.getProfile(
        userId: userId,
      );

      //  Get the reference to the database
      final likeRef = FirebaseDatabase.instance.ref(
        '$tProfile/$userId/establishment_like',
      );

      //  Get the like from the establishment
      final likes = (profile.estaLike ?? []).toList();

      if (likes.contains(establishment.id) && !like) {
        likes.remove(establishment.id);
      } else if (!likes.contains(establishment.id) && like) {
        likes.add(establishment.id);
      }

      if (likes.isEmpty) {
        await likeRef.remove();
      } else {
        await likeRef.set(likes);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to patch profile's like establishment.
  ///
  static Future<void> patchProfileEstablishmentItinerary({
    required String userId,
    required EstablishmentItineraryModel itinerary,
    required bool add,
  }) async {
    try {
      final establishment = await getEstablishmentDetails(
        itinerary.establishmentId,
      );

      final profile = await ProfileFirebaseRepository.getProfile(
        userId: userId,
      );

      //  Get the reference to the database
      final itineraryRef = FirebaseDatabase.instance.ref(
        '$tProfile/$userId/establishment_itinerary',
      );

      //  Get the itinerary from the establishment
      final itineraries = profile.estaItinerary ?? [];

      final newItinerary = EstablishmentItineraryModel.add(
        establishmentId: establishment.id,
        createdDate: ServerValue.timestamp,
        updatedDate: ServerValue.timestamp,
      );

      //  Check if the reviews is empty
      if (itineraries.isEmpty) {
        //  Set the review details to the database
        await itineraryRef.set([
          newItinerary.toJson()..remove('runtimeType'),
        ]);
      } else {
        //  Set the review details to the database with the new review
        await itineraryRef
            .child('${itineraries.length}')
            .set(newItinerary.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }
}
