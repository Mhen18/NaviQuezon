import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';

///{@template AppRoleCubit}
/// A [Cubit] which manages the role of the user.
///{@endtemplate}
class AppRoleCubit extends Cubit<AppRoleEnum> {
  ///{@macro AppRoleCubit}
  AppRoleCubit() : super(AppRoleEnum.user);

  /// Method to emit the role of the user.
  void emitRole(AppRoleEnum role) => emit(role);
}
