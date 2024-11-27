import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/admin/accounts/infrastructure/services/account_service.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template AccountGetCubit}
/// Cubit for getting the account of the admin.
///{@endtemplate}
class AccountListGetCubit extends Cubit<CubitState> {
  ///{@macro AccountGetCubit}
  AccountListGetCubit() : super(CubitStateInitial());

  final _accountService = AccountService();

  /// Future method that run and emit state for [AccountListGetCubit].
  ///
  Future<void> run() async{
    //  Emit the loading state
    emit(CubitStateLoading());

    //  Call the service to get the admin account list
    final service = await _accountService.getAdminAccountList();

    //  Check if the cubit is closed
    if (isClosed) return;

    //  Emit the state based on the service result
    service.fold(
      (f) => emit(CubitStateFailed(f)),
      (s) => emit(CubitStateSuccess<List<ProfileModel>>(s)),
    );
  }
}
