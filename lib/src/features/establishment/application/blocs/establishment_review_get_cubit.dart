import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_review_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentReviewGetCubit}
/// Cubit for getting establishment review.
///{@endtemplate}
class EstablishmentReviewGetCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentReviewGetCubit}
  EstablishmentReviewGetCubit() : super(CubitStateInitial());

  final _establishmentService = EstablishmentService();

  /// Future method to run and emit [EstablishmentReviewGetCubit].
  ///
  Future<void> run(String establishmentId) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Call the service to get the establishment reviews.
    final service = await _establishmentService.getEstablishmentDetails(
      establishmentId,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(
        CubitStateSuccess<List<EstablishmentReviewModel>>(r.reviews ?? []),
      ),
    );
  }
}
