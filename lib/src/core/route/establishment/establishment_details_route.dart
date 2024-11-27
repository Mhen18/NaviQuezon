import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_details_screen.dart';

///{@template EstablishmentDetailsRoute}
/// Route for the splash screen.
///{@endtemplate}
class EstablishmentDetailsRoute {
  static final route = GoRoute(
    path: EstablishmentDetailsScreen.route,
    builder: (context, state) {
      //  Get the establishment model from the state
      final establishment = state.extra;

      //  Check if the establishment is not null
      if (establishment != null) {
        //  Check if the establishment is an instance of EstablishmentModel
        if (establishment is EstablishmentModel) {
          //  Return the establishment details screen
          return EstablishmentDetailsScreen(
            establishment: establishment,
          );
        }
      }

      //  Return the error route container
      return const ErrorRouteContainer();
    },
  );
}
