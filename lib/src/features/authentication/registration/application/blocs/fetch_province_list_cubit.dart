import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/services/location_service.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/province_model.dart';

///{@template FetchProvinceListCubit}
/// Cubit for fetching the list of provinces.
///{@endtemplate}
class FetchProvinceListCubit extends Cubit<CubitState> {
  ///{@macro FetchProvinceListCubit}
  FetchProvinceListCubit() : super(CubitStateInitial());

  final _locationService = LocationService();

  /// Future method that run and emit state for [FetchProvinceListCubit].
  ///
  Future<void> run(String regionCode) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Get the list of provinces from the services.
    final service = await _locationService.getProvinceList(
      regionCode: regionCode,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    service.fold(
      (f) => emit(CubitStateFailed(f)),
      (s) => emit(CubitStateSuccess<List<ProvinceModel>>(s)),
    );
  }

  /// Method to reset the cubit state.
  ///
  void reset() {
    emit(CubitStateInitial());
  }
}
