import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/admin/report/infrastructure/service/report_service.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';

///{@template ReportDownloadParams}
/// Parameters for [ReportDownloadCubit].
///{@endtemplate}
class ReportDownloadParams {
  ///{@macro ReportDownloadParams}
  const ReportDownloadParams({
    required this.municipality,
    required this.dateTime,
    required this.establishmentList,
  });

  final String municipality;
  final DateTime dateTime;
  final List<EstablishmentModel> establishmentList;
}

///{@template ReportDownloadCubit}
/// Cubit handle the report download.
///{@endtemplate}
class ReportDownloadCubit extends Cubit<CubitState> {
  ///{@macro ReportDownloadCubit}
  ReportDownloadCubit() : super(CubitStateInitial());

  final _reportService = ReportService();

  /// Future method that run and emit state for [ReportDownloadCubit].
  ///
  Future<void> run({
    required ReportDownloadParams params,
  }) async {
    //  Emit loading state.
    emit(CubitStateLoading());

    //  Get the report service.
    final service = await _reportService.downloadReport(
      establishmentList: params.establishmentList,
      municipality: params.municipality,
      dateTime: params.dateTime,
    );

    //  Check if the cubit is closed then do not emit any state.
    if (isClosed) return;

    //  Emit state based on the result.
    service.fold(
      (f) => emit(CubitStateFailed(f)),
      (_) => emit(CubitStateSuccess<void>(null)),
    );
  }
}
