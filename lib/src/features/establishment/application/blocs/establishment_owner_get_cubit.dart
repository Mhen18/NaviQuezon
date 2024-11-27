import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentOwnerGetCubit}
/// Cubit for fetching the owner's establishment.
///{@endtemplate}
class EstablishmentOwnerGetCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentOwnerGetCubit}
  EstablishmentOwnerGetCubit() : super(CubitStateInitial());

  final _establishmentService = EstablishmentService();

  /// Future method that run and emit state for [EstablishmentOwnerGetCubit].
  ///
  Future<void> run() async {
    emit(CubitStateLoading());

    //  Fetch the owner's establishment.
    final service = await _establishmentService.getOwnerEstablishment();

    //  Check if the cubit is closed.
    if (isClosed) return;

    //  Emit the state based on the service result.
    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<EstablishmentModel?>(r)),
    );
  }
}
