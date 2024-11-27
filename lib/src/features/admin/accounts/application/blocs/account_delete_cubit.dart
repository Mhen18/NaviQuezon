import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/admin/accounts/infrastructure/services/account_service.dart';

///{@template AccountDeleteCubit}
/// Cubit for handling of deleting an account.
///{@endtemplate}
class AccountDeleteCubit extends Cubit<CubitState> {
  ///{@macro AccountDeleteCubit}
  AccountDeleteCubit() : super(CubitStateInitial());

  final _accountService = AccountService();

  /// Future method to run and emit state for [AccountDeleteCubit].
  ///
  Future<void> run(String id) async {
    emit(CubitStateLoading());

    final result = await _accountService.deleteAdminAccount(id);

    if (isClosed) return;

    result.fold(
      (f) => emit(CubitStateFailed(f)),
      (_) => emit(CubitStateSuccess(null)),
    );
  }
}
