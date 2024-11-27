import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';

///{@template EstablishmentReportGetCubit}
/// Cubit for getting establishment report.
///{@endtemplate}
class EstablishmentReportGetCubit extends Cubit<CubitState> {
  EstablishmentReportGetCubit() : super(CubitStateInitial());

  /// Method to run and emit state for [EstablishmentReportGetCubit].
  ///
  Future<void> run(String establishmentId) async {
    emit(CubitStateLoading());
  }
}
