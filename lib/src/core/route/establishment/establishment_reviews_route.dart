import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_reviews_screen.dart';

///{@template EstablishmentReviewsRoute}
/// Route for the [EstablishmentReviewsScreen].
///{@endtemplate}
class EstablishmentReviewsRoute {
  static final route = GoRoute(
    path: EstablishmentReviewsScreen.route,
    builder: (context, state) {
      return const EstablishmentReviewsScreen();
    },
  );
}
