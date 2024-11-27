import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/features/establishment/infrastructure/services/establishment_service.dart';

///{@template EstablishmentLikeCubit}
/// Cubit for liking the establishment.
///{@endtemplate}
class EstablishmentLikeCubit extends Cubit<CubitState> {
  ///{@macro EstablishmentLikeCubit}
  EstablishmentLikeCubit() : super(CubitStateInitial());

  final _establishmentService = EstablishmentService();

  /// Future method to run and emit state for [EstablishmentLikeCubit].
  ///
  Future<void> run({
    required String establishmentId,
    required bool like,
  }) async {
    emit(CubitStateLoading());

    final service = await _establishmentService.likeEstablishment(
      establishmentId: establishmentId,
      like: like,
    );

    if (isClosed) return;

    service.fold(
      (l) => emit(CubitStateFailed(l)),
      (r) => emit(CubitStateSuccess<void>(null)),
    );
  }
}
