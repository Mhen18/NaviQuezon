import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/admin/verification/domain/verification_sort_enum.dart';
import 'package:naviquezon/src/features/admin/verification/infrastructure/services/verification_service.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template GetVerificationListCubit}
/// Cubit for fetching the list of accounts that need to be verified.
///{@endtemplate}
class GetVerificationListCubit extends Cubit<CubitState> {
  ///{@macro GetVerificationListCubit}
  GetVerificationListCubit() : super(CubitStateInitial());

  final _verificationService = VerificationService();

  /// Future method that run and emit state for [GetVerificationListCubit].
  Future<void> run(VerificationSortEnum sort) async {
    //  Emit the loading state
    emit(CubitStateLoading());

    //  Call the service to get the verification list
    final service = await _verificationService.getVerificationList(
      sort: sort,
    );

    //  Check if the cubit is closed
    if (isClosed) return;

    //  Emit the state based on the service result
    service.fold(
      (f) => emit(CubitStateFailed(f)),
      (s) => emit(CubitStateSuccess<List<ProfileModel>>(s)),
    );
  }
}
