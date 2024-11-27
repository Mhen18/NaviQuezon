import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_itinerary_screen.dart';

///{@template EstablishmentItineraryRoute}
/// Route for the [EstablishmentItineraryScreen].
///{@endtemplate}
class EstablishmentItineraryRoute {
  static final route = GoRoute(
    path: EstablishmentItineraryScreen.route,
    builder: (context, state) {
      return const EstablishmentItineraryScreen();
    },
  );
}
