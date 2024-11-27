import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/admin/verification/presentation/verification_details_screen.dart';

///{@template VerificationDetailsRoute}
/// Route for the [VerificationDetailsScreen].
///{@endtemplate}
class VerificationDetailsRoute {
  static final route = GoRoute(
    path: VerificationDetailsScreen.route,
    builder: (context, state) {
      final role = context.read<AppRoleCubit>().state;
      final params = state.extra;

      //  Check if the params are null.
      if (params == null) {
        //  Navigate to the error route.
        return const ErrorRouteContainer();
      }

      //  Check if the role is not admin.
      if (role != AppRoleEnum.superAdmin) {
        //  Navigate to the error route.
        return const ErrorRouteContainer();
      }

      //  Return the screen.
      return VerificationDetailsScreen(
        params: params as VerificationDetailsParams,
      );
    },
  );
}
