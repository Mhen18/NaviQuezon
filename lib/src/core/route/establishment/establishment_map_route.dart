import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_map_screen.dart';

///{@template EstablishmentMapRoute}
/// Route for the splash screen.
///{@endtemplate}
class EstablishmentMapRoute {
  static final route = GoRoute(
    path: EstablishmentMapScreen.route,
    builder: (context, state) {
      final params = state.extra;

      if (params != null) {
        if (params is LatLng) {
          return EstablishmentMapScreen(
            latLng: params,
          );
        }
      }

      return const ErrorRouteContainer();
    },
  );
}
