import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/exceptions/email_not_exist_excetion.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/keys/database_keys.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_itinerary_model.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_validation_model.dart';

///{@template ProfileFirebaseRepository}
/// Repository for firebase profile module.
///{@endtemplate}
class ProfileFirebaseRepository {
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

  /// Cast the profile validation.
  ///
  static ProfileValidationModel? _castValidation(
    Map<dynamic, dynamic> value,
  ) {
    //  Check if the profile map is true
    ProfileValidationModel? profileValidation;

    //  Check if the profile map is true
    value.forEach((key, value) {
      if (key == 'validation') {
        final validation = value! as Map<Object?, Object?>;

        profileValidation = ProfileValidationModel.fromJson(
          validation.cast<String, dynamic>(),
        );
      }
    });

    return profileValidation;
  }

  /// Cast the establishment like list.
  ///
  static List<String> _castEstablishmentLikeList(
    Map<dynamic, dynamic> value,
  ) {
    //  Get the establishment like list
    final estaLikeList = <String>[];
    //  Get the establishment like map
    final estaLikeMap = value['establishment_like'];

    //  Check if the establishment like map is not null
    if (estaLikeMap != null) {
      //  Convert the establishment like map to a list
      final estaLike = estaLikeMap as List<Object?>;
      //  Loop through the establishment like list
      for (final esta in estaLike) {
        final establishment = esta.toString();
        //  Add the establishment to the list
        estaLikeList.add(establishment);
      }
    }

    return estaLikeList;
  }

  /// Cast the establishment itinerary list.
  ///
  static List<EstablishmentItineraryModel> _castEstablishmentItineraryList(
    Map<dynamic, dynamic> value,
  ) {
    final estaItineraryList = <EstablishmentItineraryModel>[];

    final estaItinerary = value['establishment_itinerary'];

    //  Check if the profile has itinerary.
    if (estaItinerary != null) {
      //  Get the list of itinerary from the establishment.
      final itineraryList = estaItinerary! as List<Object?>;

      //  Loop through the list of itineraries.
      for (final itinerary in itineraryList) {
        if (itinerary != null) {
          //  Convert the itinerary to value.
          final itineraryMap = itinerary as Map<Object?, Object?>;

          //  Convert the itinerary value to establishment review model.
          final itineraryModel = EstablishmentItineraryModel.fromJson(
            itineraryMap.cast<String, dynamic>()
              ..addAll({
                'runtimeType': 'default',
              }),
          );

          //  Add the itinerary model to the list.
          estaItineraryList.add(itineraryModel);
        }
      }

      // Sort the reviews by updatedDate in descending order (latest first)
      estaItineraryList.sort((a, b) {
        final updatedDateA = a.updatedDate! as num;
        final updatedDateB = b.updatedDate! as num;

        return updatedDateB.compareTo(updatedDateA);
      });
    }

    return estaItineraryList;
  }

  /// Future method to get the profile list from the database.
  ///
  static Future<List<ProfileModel>> getProfileList() async {
    try {
      //  Get the reference of the profile.
      final profileRef = FirebaseDatabase.instance.ref(tProfile);

      //  Get the snapshot of the profile.
      final profileSnapshot = await profileRef.get();

      //  Create a list of profile model.
      final profileList = <ProfileModel>[];

      //  Check if the profile snapshot is not null
      if (profileSnapshot.value != null) {
        final profileMap = profileSnapshot.value! as Map<dynamic, dynamic>;

        for (final value in profileMap.values) {
          final valueMap = value as Map<Object?, Object?>;

          //  Convert the value map to profile model
          final profile = ProfileModel.fromJson(
            valueMap.cast<String, dynamic>(),
          );

          //  Add the profile to the profile list
          profileList.add(profile);
        }
      }

      //  Return the profile list
      return profileList;
    } catch (e) {
      rethrow;
    }
  }

  /// Future method to get profile information.
  ///
  static Future<ProfileModel> getProfile({
    required String userId,
  }) async {
    try {
      //  Get the reference to the database
      final reference = FirebaseDatabase.instance.ref('profile/$userId');

      //  Get the snapshot from the database
      final snapshot = await reference.get();

      //  Check if the snapshot exists
      if (snapshot.exists) {
        //  Get the value from the snapshot
        final value = Map<String, dynamic>.from(snapshot.value! as Map);

        //  Get the profile validation
        final profileValidation = _castValidation(value);

        //  Get the establishment like list
        final estaLikeList = _castEstablishmentLikeList(value);

        //  Get the establishment itinerary list
        final estaItinerary = _castEstablishmentItineraryList(value);

        //  Convert the value to ProfileModel
        final profile = ProfileModel.fromJson(value).copyWith(
          validation: profileValidation,
          estaLike: estaLikeList,
          estaItinerary: estaItinerary,
        );
        return profile;
      } else {
        throw Exception('Profile not found');
      }
    } catch (e) {
      //  Rethrow the exception
      rethrow;
    }
  }

  static Future<ProfileModel?> getProfileByEmail(
    String email,
  ) async {
    try {
      //  Get the reference to the database
      final reference = FirebaseDatabase.instance.ref('profile');

      //  Get the snapshot of the profile
      final profileSnapshot = await reference.get();

      //  Check if the profile snapshot is not null
      if (profileSnapshot.value != null) {
        final profileMap = profileSnapshot.value! as Map<dynamic, dynamic>;

        for (final value in profileMap.values) {
          final valueMap = value as Map<Object?, Object?>;

          //  Get the email and phone
          final emailMap = valueMap['email'];

          //  Check if the email is the same as the email parameter.
          if (emailMap == email) {
            //  Convert the value map to profile model and replace
            //  the validation
            final profile = await ProfileFirebaseRepository.getProfile(
              userId: valueMap['id'].toString(),
            );

            //  Return the profile model.
            return profile;
          }
        }
      }

      throw EmailNotExistException();
    } catch (e) {
      //  Rethrow the exception
      rethrow;
    }
  }

  /// Future method to update profile information.
  ///
  static Future<Either<Failure, void>> patchProfile({
    required ProfileModel profile,
  }) async {
    try {
      //  Get the reference to the database
      final reference = FirebaseDatabase.instance.ref('profile/${profile.id}');

      //  Create a new profile with the new details
      var newProfile = profile;

      //  Check if the establishment has image
      if (profile.image != null) {
        final profileMediaRef = '$tProfile/media/${profile.id}';

        //  Check if the image is from the network
        final isNetwork = Uri.parse(profile.image ?? '').isAbsolute;
        if (isNetwork == false) {
          //  Upload the image to the storage
          final image = await _uploadImage(
            refPath: profileMediaRef,
            path: profile.image ?? '',
            child: 'image',
          );

          //  Update the profile with the new image
          newProfile = newProfile.copyWith(image: image);
        }
      }

      //  Update the profile information
      await reference.update(newProfile.toJson());

      return const Right(null);
    } catch (e) {
      //  Rethrow the exception
      rethrow;
    }
  }

  /// Future method to update profile password from forgot password.
  ///
  static Future<Either<Failure, void>> resetProfilePassword({
    required String profileId,
    required String password,
  }) async {
    try {
      //  Get the reference to the database
      final profileRef = FirebaseDatabase.instance.ref('profile/$profileId');

      final profileSnapshot = await profileRef.get();

      if (profileSnapshot.exists) {
        final passwordRef = profileRef.child('password');

        await passwordRef.set(password);

        return const Right(null);
      }

      throw Exception('Profile not found');
    } catch (e) {
      //  Rethrow the exception
      rethrow;
    }
  }

  /// Future method to update profile password from forgot password.
  ///
  static Future<Either<Failure, void>> patchProfilePassword({
    required String profileId,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      //  Get the reference to the database
      final profileRef = FirebaseDatabase.instance.ref('profile/$profileId');

      final profileSnapshot = await profileRef.get();

      if (profileSnapshot.exists) {
        final passwordRef = profileRef.child('password');

        final passwordSnapshot = await passwordRef.get();
        final password = passwordSnapshot.value;

        if (currentPassword != password) {
          return const Left(
            DefaultFailure(message: 'Current password is incorrect'),
          );
        }

        await passwordRef.set(newPassword);

        return const Right(null);
      }

      throw Exception('Profile not found');
    } catch (e) {
      //  Rethrow the exception
      rethrow;
    }
  }
}
