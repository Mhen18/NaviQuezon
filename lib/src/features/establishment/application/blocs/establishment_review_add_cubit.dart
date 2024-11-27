import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_review_add_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentReviewAddCubit}
/// Cubit for adding establishment review.
///{@endtemplate}
class EstablishmentReviewAddCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentReviewAddCubit}
  EstablishmentReviewAddCubit() : super(CubitStateInitial());

  final _establishmentService = EstablishmentService();

  /// Future method to run and emit [EstablishmentReviewAddCubit].
  ///
  Future<void> run({
    required EstablishmentReviewAddModel review,
    required String establishmentId,
  }) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Call the service to add the review.
    final service = await _establishmentService.addEstablishmentReview(
      review: review,
      establishmentId: establishmentId,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess(r)),
    );
  }
}
