import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/registration_model.dart';
import 'package:naviquezon/src/features/authentication/registration/infrastructures/services/registration_service.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template PushRegistrationCubit}
/// Cubit handle the registration.
///{@endtemplate}
class PushRegistrationCubit extends Cubit<CubitState> {
  ///{@macro PushRegistrationCubit}
  PushRegistrationCubit() : super(CubitStateInitial());

  final _registrationService = RegistrationService();

  /// Future method that run and emit state for [PushRegistrationCubit].
  ///
  Future<void> run({
    required RegistrationModel registration,
  }) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Get the registration service based on the role.
    final service = await _registrationService.postRegistration(
      registration: registration,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (f) => emit(CubitStateFailed(f)),
      (s) => emit(CubitStateSuccess<ProfileModel?>(s)),
    );
  }
}
