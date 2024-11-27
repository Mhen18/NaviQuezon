import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/authentication/registration/presentation/screens/registration_screen.dart';

///{@template RegistrationRoute}
/// Route for the splash screen.
///{@endtemplate}
class RegistrationRoute {
  static final route = GoRoute(
    path: RegistrationScreen.route,
    builder: (context, state) {
      return const RegistrationScreen();
    },
  );
}
