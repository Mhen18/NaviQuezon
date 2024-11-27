import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';

///{@template EstablishmentReportListGetCubit}
/// Cubit for getting establishment report list.
///{@endtemplate}
class EstablishmentReportListGetCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentReportListGetCubit}
  EstablishmentReportListGetCubit() : super(CubitStateInitial());

  /// Method to run and emit state for [EstablishmentReportListGetCubit].
  ///
  Future<void> run() async {
    emit(CubitStateLoading());
  }
}
