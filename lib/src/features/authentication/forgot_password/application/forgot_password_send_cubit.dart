import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/infrastructure/service/forgot_password_service.dart';

///{@template ForgotPasswordSendCubit}
/// Cubit that handling the sending of forgot password email.
///{@endtemplate}
class ForgotPasswordSendCubit extends Cubit<CubitState> {
  ForgotPasswordSendCubit() : super(CubitStateInitial());

  final _forgotPasswordService = ForgotPasswordService();

  /// Future method to run and emit state for [ForgotPasswordSendCubit].
  ///
  Future<void> run(String email) async {
    emit(CubitStateLoading());

    final result = await _forgotPasswordService.sendResetPasswordEmail(
      email: email,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(CubitStateFailed(failure)),
      (success) => emit(
        CubitStateSuccess<ForgotPasswordEntity>(success),
      ),
    );
  }
}
