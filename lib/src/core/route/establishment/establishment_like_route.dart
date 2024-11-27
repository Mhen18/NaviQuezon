import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_like_screen.dart';

///{@template EstablishmentLikeRoute}
/// Route for the [EstablishmentLikeScreen].
///{@endtemplate}
class EstablishmentLikeRoute {
  static final route = GoRoute(
    path: EstablishmentLikeScreen.route,
    builder: (context, state) {
      return const EstablishmentLikeScreen();
    },
  );
}
