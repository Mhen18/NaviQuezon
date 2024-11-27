import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_setup_screen.dart';

///{@template EstablishmentSetupRoute}
/// Route for the [EstablishmentSetupScreen].
///{@endtemplate}
class EstablishmentSetupRoute {
  static final route = GoRoute(
    path: EstablishmentSetupScreen.route,
    builder: (context, state) {
      //  Get the role of the user.
      final role = context.read<AppRoleCubit>().state;

      //  Check if the user is not an owner.
      if (role != AppRoleEnum.owner) {
        return const ErrorRouteContainer();
      }

      //  Get the establishment from the state.
      final establishment = state.extra;

      //  Check if the establishment is not null.
      if (establishment != null) {
        //  Check if the establishment is an instance of [EstablishmentModel].
        if (establishment is EstablishmentModel) {
          //  Return the establishment setup screen with the establishment
          //  parameter.
          return EstablishmentSetupScreen.edit(
            establishment: establishment,
          );
        }
      }

      return const EstablishmentSetupScreen();
    },
  );
}
