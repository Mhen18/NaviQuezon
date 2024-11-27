import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/user/faq/infrastructure/services/faq_service.dart';

///{@template FaqDeleteCubit}
/// Cubit for handling the deleting the FAQ.
///{@endtemplate}
class FaqDeleteCubit extends Cubit<CubitState> {
  ///{@macro FaqDeleteCubit}
  FaqDeleteCubit() : super(CubitStateInitial());

  final _faqService = FaqService();

  /// Future method to run and emit state for [FaqDeleteCubit].
  ///
  Future<void> run(String faqId) async {
    emit(CubitStateLoading());

    //  Request the faq service to setup the faq
    final service = await _faqService.deleteFaq(faqId: faqId);

    //  Check if the cubit is closed.
    if (isClosed) return;

    //  Emit the state based on the service result
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<void>(null)),
    );
  }
}
