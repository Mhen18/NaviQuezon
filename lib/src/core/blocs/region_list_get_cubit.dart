import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/services/location_service.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/region_model.dart';

///{@template RegionListGetCubit}
/// Cubit for fetching the list of regions.
///{@endtemplate}
class RegionListGetCubit extends Cubit<CubitState> {
  ///{@macro RegionListGetCubit}
  RegionListGetCubit() : super(CubitStateInitial());

  final _locationService = LocationService();

  /// Future method that run and emit state for [RegionListGetCubit].
  ///
  Future<void> run() async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Get the list of regions from the services.
    final service = await _locationService.getRegionList();

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    service.fold(
      (f) => emit(CubitStateFailed(f)),
      (s) => emit(CubitStateSuccess<List<RegionModel>>(s)),
    );
  }

  /// Method to reset the cubit state.
  ///
  void reset() {
    emit(CubitStateInitial());
  }
}
