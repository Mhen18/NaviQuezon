import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/authentication/login/domain/models/login_model.dart';
import 'package:naviquezon/src/features/authentication/login/infrastructure/services/login_service.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template PostLoginCubit}
/// Cubit handle the post login.
///{@endtemplate}
class PostLoginCubit extends Cubit<CubitState> {
  ///{@macro PostLoginCubit}
  PostLoginCubit() : super(CubitStateInitial());

  final loginService = LoginService();

  /// Future method that run and emit state for [PostLoginCubit].
  ///
  Future<void> run({required LoginModel login}) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    final service = await loginService.postLogin(
      login: login,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<ProfileModel>(r)),
    );
  }
}
