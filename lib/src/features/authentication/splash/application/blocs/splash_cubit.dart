import 'package:bloc/bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';

///{@template SplashCubit}
/// Cubit for the splash screen.
///{@endtemplate}
class SplashCubit extends Cubit<CubitState> {
  ///{@macro SplashCubit}
  SplashCubit() : super(CubitStateInitial());

  Future<void> emitRun() async {}
}
