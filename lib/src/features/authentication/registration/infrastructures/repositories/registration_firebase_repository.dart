import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/failures/email_already_exist_failure.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/failures/phone_already_exist_failure.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/registration_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/registration_validation_model.dart';

class RegistrationFirebaseRepository {
  /// Future method to push profile registration.
  ///
  static Future<Either<Failure, String?>> pushRegistration({
    required RegistrationModel registration,
  }) async {
    try {
      //  Get the reference to the database
      final profileRef = FirebaseDatabase.instance.ref('profile');

      //  Get the snapshot of the profile
      final profileSnapshot = await profileRef.get();

      //  Check if the profile snapshot is not null
      if (profileSnapshot.value != null) {
        final profileMap = profileSnapshot.value! as Map<dynamic, dynamic>;

        //  Loop through the profile map to get all the data and check if
        //  the email or phone is already exist.
        for (final value in profileMap.values) {
          final valueMap = value as Map<dynamic, dynamic>;

          final hasEmail = valueMap.containsKey('email');
          final hasPhone = valueMap.containsKey('phone');

          //  Check if the email is already exist
          if (hasEmail) {
            final email = valueMap['email'];
            if (email == registration.email) {
              return Left(EmailAlreadyExistFailure());
            }
          }

          //  Check if the phone is already exist
          if (hasPhone) {
            final phone = valueMap['phone'];
            if (phone == registration.phone) {
              return Left(PhoneAlreadyExistFailure());
            }
          }
        }
      }

      final role = AppRoleEnum.fromString(registration.role);

      //  Check if the role is owner to check if the email or phone is already
      //  exist before proceeding to validation.
      if (role == AppRoleEnum.owner && registration.validation == null) {
        return const Right(null);
      }

      //  Push the registration to the database
      final profile = profileRef.push();

      //  Set the registration details to the profile
      await profile.set(registration.toJson());

      //  Update the created and updated date
      await profile.update({
        'id': profile.key,
        'created_date': ServerValue.timestamp,
        'updated_date': ServerValue.timestamp,
      });

      //  Check if the registration has owner validation
      final regValidation = registration.validation;

      if (regValidation != null) {
        final validation = await _pushValidation(
          regValidation: regValidation,
          profileId: profile.key!,
        );

        return validation.fold(
          Left.new,
          (_) => const Right(null),
        );
      }

      //  Return the profile key as the account id
      return Right(profile.key);
    } catch (e) {
      //  Rethrow the exception
      rethrow;
    }
  }

  /// Future method to push the validation to the database.
  ///
  static Future<Either<Failure, void>> _pushValidation({
    required RegistrationValidationModel regValidation,
    required String profileId,
  }) async {
    try {
      //  Get the reference to the database
      final validationRef = FirebaseDatabase.instance.ref('validation');

      //  Push the registration validation to the database
      final validation = validationRef.push();

      //  Get the storage reference path
      final validationStorageRef = 'validation/$profileId';

      //  Upload the id front image
      final frontId = await _uploadImage(
        refPath: validationStorageRef,
        path: regValidation.idFront,
        child: 'front_id',
      );

      //  Upload the id back image
      final backId = await _uploadImage(
        refPath: validationStorageRef,
        path: regValidation.idBack,
        child: 'back_id',
      );

      //  Upload the permit front image
      final frontPermit = await _uploadImage(
        refPath: validationStorageRef,
        path: regValidation.permitFront,
        child: 'front_permit',
      );

      //  Upload the permit back image
      final backPermit = await _uploadImage(
        refPath: validationStorageRef,
        path: regValidation.permitBack,
        child: 'back_permit',
      );

      //  Upload the formal picture image
      final formalPicture = await _uploadImage(
        refPath: validationStorageRef,
        path: regValidation.formalPicture,
        child: 'formal_picture',
      );

      //  Create a new validation with the uploaded images
      final registrationValidation = regValidation.copyWith(
        idFront: frontId,
        idBack: backId,
        permitFront: frontPermit,
        permitBack: backPermit,
        formalPicture: formalPicture,
      );

      //  Set the registration details to the profile
      await validation.set(registrationValidation.toJson());

      //  Update the created and updated date
      await validation.update({
        'id': validation.key,
        'owner_id': profileId,
        'created_date': ServerValue.timestamp,
        'updated_date': ServerValue.timestamp,
      });

      return const Right(null);
    } catch (e) {
      //  Rethrow the exception
      rethrow;
    }
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

    //  Upload the file to the storage
    await storage.child(child).putFile(file);

    //  Get the download url
    final url = await storage.child(child).getDownloadURL();

    //  Return the url
    return url;
  }
}
