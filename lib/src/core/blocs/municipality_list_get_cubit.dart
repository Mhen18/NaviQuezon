import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/services/location_service.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';

///{@template MunicipalityListGetCubit}
/// Cubit for fetching the list of municipalities.
///{@endtemplate}
class MunicipalityListGetCubit extends Cubit<CubitState> {
  ///{@macro MunicipalityListGetCubit}
  MunicipalityListGetCubit() : super(CubitStateInitial());

  final _locationService = LocationService();

  /// Future method that run and emit state for [MunicipalityListGetCubit].
  ///
  Future<void> run(String provinceCode) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Get the list of municipalities from the services.
    final service = await _locationService.getMunicipalityList(
      provinceCode: provinceCode,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    service.fold(
      (f) => emit(CubitStateFailed(f)),
      (s) => emit(CubitStateSuccess<List<MunicipalityModel>>(s)),
    );
  }

  /// Method to reset the cubit state.
  ///
  void reset() {
    emit(CubitStateInitial());
  }
}
