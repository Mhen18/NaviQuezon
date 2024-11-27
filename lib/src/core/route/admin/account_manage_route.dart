import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/admin/accounts/presentation/screens/account_manage_screen.dart';

///{@template AccountManageRoute}
/// Route for the splash screen.
///{@endtemplate}
class AccountManageRoute {
  static final route = GoRoute(
    path: AccountManageScreen.route,
    builder: (context, state) {
      final role = context.read<AppRoleCubit>().state;

      //  Check if the role is not admin.
      if (role != AppRoleEnum.superAdmin) {
        //  Navigate to the error route.
        return const ErrorRouteContainer();
      }

      return const AccountManageScreen();
    },
  );
}
