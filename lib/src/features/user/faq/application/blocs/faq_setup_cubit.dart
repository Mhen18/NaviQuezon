import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/user/faq/domain/models/faq_add_model.dart';
import 'package:naviquezon/src/features/user/faq/infrastructure/services/faq_service.dart';

///{@template FaqSetupCubit}
/// Cubit for handling the setup of the FAQ.
///{@endtemplate}
class FaqSetupCubit extends Cubit<CubitState> {
  ///{@macro FaqSetupCubit}
  FaqSetupCubit() : super(CubitStateInitial());

  final _faqService = FaqService();

  /// Future method to run and emit state for [FaqSetupCubit].
  ///
  Future<void> run(
    FaqAddModel faq, {
    String? faqId,
  }) async {
    emit(CubitStateLoading());

    //  Request the faq service to setup the faq
    final service = await _faqService.setupFaq(faq: faq, faqId: faqId);

    //  Check if the cubit is closed.
    if (isClosed) return;

    //  Emit the state based on the service result
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<bool>(faqId != null)),
    );
  }
}
