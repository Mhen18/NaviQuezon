import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_image_screen.dart';

///{@template EstablishmentImageRoute}
/// Route for the [EstablishmentImageScreen].
///{@endtemplate}
class EstablishmentImageRoute {
  static final route = GoRoute(
    path: EstablishmentImageScreen.route,
    builder: (context, state) {
      //  Get the establishment from the state.
      final image = state.extra;

      //  Check if the image path is not null.
      if (image != null) {
        //  Check if the image is an instance of [String].
        if (image is String) {
          return EstablishmentImageScreen(
            imagePath: image,
          );
        }
      }

      //  Return the error route container.
      return const ErrorRouteContainer();
    },
  );
}
