import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/admin/accounts/domain/models/admin_add_model.dart';
import 'package:naviquezon/src/features/admin/accounts/infrastructure/services/account_service.dart';

///{@template AccountAddCubit}
/// Cubit for handling of adding an account.
///{@endtemplate}
class AccountAddCubit extends Cubit<CubitState> {
  ///{@macro AccountAddCubit}
  AccountAddCubit() : super(CubitStateInitial());

  final _accountService = AccountService();

  /// Future method to run and emit state for [AdminAddModel].
  ///
  Future<void> run(AdminAddModel admin) async {
    emit(CubitStateLoading());

    final result = await _accountService.addAdminAccount(admin);

    if (isClosed) return;

    result.fold(
      (f) => emit(CubitStateFailed(f)),
      (_) => emit(CubitStateSuccess(null)),
    );
  }
}
