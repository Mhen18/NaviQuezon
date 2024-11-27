import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/enums/path_enum.dart';

///{@template EstablishmentVideoSetupCubit}
/// Cubit to handle the video setup for the establishment.
///{@endtemplate}
class EstablishmentVideoSetupCubit extends Cubit<CubitState> {
  EstablishmentVideoSetupCubit() : super(CubitStateInitial());

  /// Method to run and emit state for [EstablishmentVideoSetupCubit].
  ///
  void run(String url, PathEnum path) {
    emit(CubitStateLoading());
    emit(CubitStateSuccess<(String, PathEnum)>((url, path)));
  }
}
