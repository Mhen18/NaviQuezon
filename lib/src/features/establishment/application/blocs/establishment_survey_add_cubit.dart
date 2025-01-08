import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/models/address_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_survey_model.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentSurveyAddCubit}
/// Cubit for adding establishment survey.
///{@endtemplate}
class EstablishmentSurveyAddCubit extends Cubit<CubitState> {
  EstablishmentSurveyAddCubit() : super(CubitStateInitial());

  final _establishmentService = EstablishmentService();

  /// Method to run and emit state for [EstablishmentSurveyAddCubit].
  ///
  Future<void> run({
    required EstablishmentSurveyModel survey,
    required AddressModel address,
    required String establishmentId,
  }) async {
    emit(CubitStateLoading());

    final service = await _establishmentService.addEstablishmentSurvey(
      survey: survey,
      address: address,
      establishmentId: establishmentId,
    );

    if (isClosed) return;

    service.fold(
      (failure) => emit(CubitStateFailed(failure)),
      (success) => emit(CubitStateSuccess<void>(null)),
    );
  }
}
