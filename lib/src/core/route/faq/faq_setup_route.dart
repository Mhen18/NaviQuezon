import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/user/faq/presentation/screens/faq_setup_screen.dart';

///{@template FaqSetupRoute}
/// Route for the splash screen.
///{@endtemplate}
class FaqSetupRoute {
  static final route = GoRoute(
    path: FaqSetupScreen.route,
    builder: (context, state) {
      //  Get the current role.
      final role = context.read<AppRoleCubit>().state;

      //  Check if the role is not admin.
      if (role != AppRoleEnum.superAdmin) {
        return const ErrorRouteContainer();
      }

      return const FaqSetupScreen();
    },
  );
}
