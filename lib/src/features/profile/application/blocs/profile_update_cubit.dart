import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/infrastructure/services/profile_service.dart';

///{@template ProfileUpdateCubit}
/// Cubit for fetching profile information.
///{@endtemplate}
class ProfileUpdateCubit extends Cubit<CubitState> {
  ///{@macro ProfileUpdateCubit}
  ProfileUpdateCubit() : super(CubitStateInitial());

  final _profileService = ProfileService();

  /// Future method to run and emit [ProfileUpdateCubit].
  ///
  Future<void> run(ProfileModel profile) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Update profile information.
    final service = await _profileService.updateProfile(profile: profile);

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<ProfileModel>(r)),
    );
  }
}
