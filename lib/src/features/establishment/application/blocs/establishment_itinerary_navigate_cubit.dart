import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentItineraryNavigationCubit}
/// Cubit for navigating to the establishment itinerary.
///{@endtemplate}
class EstablishmentItineraryNavigationCubit extends Cubit<CubitState> {
  ///{macro EstablishmentItineraryNavigationCubit}
  EstablishmentItineraryNavigationCubit() : super(CubitStateInitial());

  final _estaService = EstablishmentService();

  /// Future method to run and emit state for
  /// [EstablishmentItineraryNavigationCubit].
  ///
  Future<void> run(List<EstablishmentModel> estaList) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    final service = await _estaService.navigateEstablishment(
      estaList: estaList,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<String>(r)),
    );
  }
}
