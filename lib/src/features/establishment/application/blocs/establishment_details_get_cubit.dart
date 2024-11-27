import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentDetailsGetCubit}
/// Cubit for getting establishment details.
///{@endtemplate}
class EstablishmentDetailsGetCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentDetailsGetCubit}
  EstablishmentDetailsGetCubit() : super(CubitStateInitial());

  final _establishmentService = EstablishmentService();

  /// Future method to run and emit [EstablishmentDetailsGetCubit].
  Future<void> run(String establishmentId) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Call the service to get the establishment details.
    final service = await _establishmentService.getEstablishmentDetails(
      establishmentId,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<EstablishmentModel>(r)),
    );
  }
}
