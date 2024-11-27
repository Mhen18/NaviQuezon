import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/user/faq/infrastructure/services/faq_service.dart';

///{@template FaqGetCubit}
/// Cubit for getting the frequently asked questions.
///{@endtemplate}
class FaqGetCubit extends Cubit<CubitState> {
  FaqGetCubit() : super(CubitStateInitial());

  final _faqService = FaqService();

  /// Future method to run and emit state for [FaqGetCubit]
  ///
  Future<void> run() async {
    //  Emit the loading state
    emit(CubitStateLoading());

    //  Get the faq list from the service
    final service = await _faqService.getFaqList();

    //  Check if the cubit is closed
    if (isClosed) return;

    //  Emit the state based on the service result
    service.fold(
      (failure) => emit(CubitStateFailed(failure)),
      (value) => emit(CubitStateSuccess(value)),
    );
  }
}
