import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';
import 'package:naviquezon/src/features/profile/infrastructure/services/profile_service.dart';

///{@template ProfileGetCubit}
/// Cubit for fetching profile information.
///{@endtemplate}
class ProfileGetCubit extends Cubit<CubitState> {
  ///{@macro ProfileGetCubit}
  ProfileGetCubit() : super(CubitStateInitial());

  final _profileService = ProfileService();

  /// Future method to run and emit [ProfileGetCubit].
  ///
  Future<void> run() async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Get profile information.
    final service = await _profileService.getProfile();

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<ProfileModel>(r)),
    );
  }

  void emitProfile(ProfileModel profile) {
    //  Emit loading state.
    emit(CubitStateLoading());

    emit(CubitStateSuccess<ProfileModel>(profile));
  }
}
