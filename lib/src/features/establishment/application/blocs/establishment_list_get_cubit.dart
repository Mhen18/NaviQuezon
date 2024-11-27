import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentListGetCubit}
/// Cubit to get the list of establishments.
///{@endtemplate}
class EstablishmentListGetCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentListGetCubit}
  EstablishmentListGetCubit() : super(CubitStateInitial());

  final _establishmentService = EstablishmentService();

  /// Future method that run and emit state for [EstablishmentListGetCubit].
  ///
  Future<void> run({String? query}) async {
    //  Emit the loading state.
    emit(CubitStateLoading());

    //  Get the establishment list from the service.
    final service = await _establishmentService.getEstablishments(
      query: query,
    );

    //  Check if the cubit is closed.
    if (isClosed) return;

    //  Emit the state based on the service result.
    service.fold(
      (failure) => emit(CubitStateFailed(failure)),
      (establishments) => emit(
        CubitStateSuccess<List<EstablishmentModel>>(establishments),
      ),
    );
  }
}
