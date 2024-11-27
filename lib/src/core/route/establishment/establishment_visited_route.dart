import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_visited_screen.dart';

///{@template EstablishmentVisitedRoute}
/// Route for the [EstablishmentVisitedScreen].
///{@endtemplate}
class EstablishmentVisitedRoute {
  static final route = GoRoute(
    path: EstablishmentVisitedScreen.route,
    builder: (context, state) {
      return const EstablishmentVisitedScreen();
    },
  );
}
