import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_itinerary_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentItineraryCubit}
/// Cubit for liking the establishment.
///{@endtemplate}
class EstablishmentItineraryCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentItineraryCubit}
  EstablishmentItineraryCubit() : super(CubitStateInitial());

  final _establishmentService = EstablishmentService();

  /// Future method to run and emit state for [EstablishmentItineraryCubit].
  ///
  Future<void> run({
    required EstablishmentItineraryModel itinerary,
  }) async {
    emit(CubitStateLoading());

    final service = await _establishmentService.itineraryEstablishment(
      itinerary: itinerary,
      add: true,
    );

    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<void>(null)),
    );
  }
}
