import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/infrastructure/service/forgot_password_service.dart';

///{@template ForgotPasswordResetCubit}
/// Cubit for the forgot password reset.
///{@endtemplate}
class ForgotPasswordResetCubit extends Cubit<CubitState> {
  ///{@macro ForgotPasswordResetCubit}
  ForgotPasswordResetCubit() : super(CubitStateInitial());

  final _forgotPasswordService = ForgotPasswordService();

  /// Future method to run and emit state for [ForgotPasswordResetCubit].
  ///
  Future<void> run({
    required String email,
    required String password,
  }) async {
    emit(CubitStateLoading());

    final result = await _forgotPasswordService.resetPassword(
      email: email,
      password: password,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(CubitStateFailed(failure)),
      (success) => emit(CubitStateSuccess<void>(null)),
    );
  }
}
