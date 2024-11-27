import 'package:equatable/equatable.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template CubitState}
/// Abstract class for the default state for bloc/cubit.
///{@endtemplate}
abstract class CubitState extends Equatable {}

///{@template CubitStateInitial}
/// Default initial state for bloc/cubit.
///{@endtemplate}
class CubitStateInitial extends CubitState {
  @override
  List<Object> get props => [];
}

///{@template CubitStateLoading}
/// Default loading state for bloc/cubit.
///{@endtemplate}
class CubitStateLoading extends CubitState {
  @override
  List<Object> get props => [];
}

///{@template CubitStateSuccess}
/// Default success state for bloc/cubit.
///{@endtemplate}
class CubitStateSuccess<Params> extends CubitState {
  ///{@macro CubitStateSuccess}
  CubitStateSuccess(
    this.value,
  );

  final Params value;

  @override
  List<Object?> get props {
    return [
      value,
    ];
  }
}

///{@template CubitStateFailed}
/// Default failed state for bloc/cubit.
///{@endtemplate}
class CubitStateFailed extends CubitState {
  ///{@macro CubitStateFailed}
  CubitStateFailed(
    this.failure,
  );

  final Failure failure;

  @override
  List<Object> get props {
    return [
      failure,
    ];
  }
}
