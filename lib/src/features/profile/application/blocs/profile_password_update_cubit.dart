import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/profile/infrastructure/services/profile_service.dart';

///{@template ProfilePasswordUpdateCubit}
/// Cubit for updating the profile password.
///{@endtemplate}
class ProfilePasswordUpdateCubit extends Cubit<CubitState> {
  ///{@macro ProfilePasswordUpdateCubit}
  ProfilePasswordUpdateCubit() : super(CubitStateInitial());

  final _profileService = ProfileService();

  /// Future method to run and emit [ProfilePasswordUpdateCubit].
  ///
  Future<void> run({
    required String oldPassword,
    required String newPassword,
  }) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Update profile password.
    final service = await _profileService.updatePassword(
      currentPassword: oldPassword,
      newPassword: newPassword,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<void>(r)),
    );
  }
}
