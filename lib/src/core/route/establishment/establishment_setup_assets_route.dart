import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_setup_assets_screen.dart';

///{@template EstablishmentSetupAssetsRoute}
/// Route for the [EstablishmentSetupAssetsScreen].
///{@endtemplate}
class EstablishmentSetupAssetsRoute {
  static final route = GoRoute(
    path: EstablishmentSetupAssetsScreen.route,
    builder: (context, state) {
      //  Get the role of the user.
      final role = context.read<AppRoleCubit>().state;

      //  Get the establishment from the state.
      final establishment = state.extra;

      //  Check if the user is an owner and the establishment is not null.
      if (role == AppRoleEnum.owner && establishment != null) {
        //  Check if the establishment is an instance of [EstablishmentModel].
        if (establishment is EstablishmentModel) {
          return EstablishmentSetupAssetsScreen(
            establishment: establishment,
          );
        }
      }

      //  Return the error route container.
      return const ErrorRouteContainer();
    },
  );
}
