import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_discover_screen.dart';

///{@template EstablishmentDiscoverRoute}
/// Route for the splash screen.
///{@endtemplate}
class EstablishmentDiscoverRoute {
  static final route = GoRoute(
    path: EstablishmentDiscoverScreen.route,
    builder: (context, state) {
      return const EstablishmentDiscoverScreen();
    },
  );
}
