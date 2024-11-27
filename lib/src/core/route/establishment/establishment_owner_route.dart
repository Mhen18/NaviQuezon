import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_owner_screen.dart';

///{@template EstablishmentListRoute}
/// Route for the splash screen.
///{@endtemplate}
class EstablishmentOwnerRoute {
  static final route = GoRoute(
    path: EstablishmentOwnerScreen.route,
    builder: (context, state) {
      //  Get the role of the user.
      final role = context.read<AppRoleCubit>().state;

      if (role != AppRoleEnum.owner) {
        return const ErrorRouteContainer();
      }

      return const EstablishmentOwnerScreen();
    },
  );
}
