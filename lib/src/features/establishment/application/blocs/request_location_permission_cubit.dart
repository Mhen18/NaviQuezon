import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/services/location_service.dart';

///{@template RequestLocationPermissionCubit}
/// Cubit class that used to request location permission
///{@endtemplate}
class RequestLocationPermissionCubit extends Cubit<CubitState> {
  ///{@macro RequestLocationPermissionCubit}
  RequestLocationPermissionCubit() : super(CubitStateInitial());

  final _locationServices = LocationService();

  Future<void> requestLocationPermission() async {
    emit(CubitStateLoading());

    final service = await _locationServices.requestPermission();

    //  Check if the cubit is closed.
    if (isClosed) return;

    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess(r)),
    );
  }
}
