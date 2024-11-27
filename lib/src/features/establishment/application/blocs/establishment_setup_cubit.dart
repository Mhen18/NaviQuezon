import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_add_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentAddCubit}
/// Cubit for handling the adding of establishment.
///{@endtemplate}
class EstablishmentSetupCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentAddCubit}
  EstablishmentSetupCubit() : super(CubitStateInitial());

  final _estaService = EstablishmentService();

  /// Method to run and emit state for [EstablishmentSetupCubit].
  ///
  Future<void> run({
    EstablishmentAddModel? establishmentAdd,
    EstablishmentModel? establishment,
  }) async {
    //  Emit the loading state.
    emit(CubitStateLoading());

    //  Call the service to add the establishment.
    final service = await _estaService.setupEstablishment(
      establishment: establishment,
      establishmentAdd: establishmentAdd,
    );

    //  Check if the cubit is closed.
    if (isClosed) return;

    //  Emit the state based on the service result.
    service.fold(
      (failure) => emit(CubitStateFailed(failure)),
      (success) => emit(CubitStateSuccess<void>(null)),
    );
  }
}
