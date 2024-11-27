import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/admin/verification/infrastructure/services/verification_service.dart';

///{@template PutVerificationCubit}
/// Cubit for the put verification.
///{@endtemplate}
class PutVerificationCubit extends Cubit<CubitState> {
  ///{@macro PutVerificationCubit}
  PutVerificationCubit() : super(CubitStateInitial());

  final _verificationService = VerificationService();

  /// Method to run and emit state for [PutVerificationCubit].
  ///
  Future<void> run({
    required String profileId,
    required bool isApproved,
  }) async {
    //  Emit the loading state
    emit(CubitStateLoading());

    //  Call the service to put the verification
    final service = await _verificationService.putVerification(
      profileId: profileId,
      isApproved: isApproved,
    );

    //  Check if the cubit is closed
    if (isClosed) return;

    //  Emit the state based on the service result
    service.fold(
      (f) => emit(CubitStateFailed(f)),
      (s) => emit(CubitStateSuccess<bool>(s)),
    );
  }
}
