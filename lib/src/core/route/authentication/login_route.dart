import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/authentication/login/presentation/screens/login_screen.dart';

///{@template LoginRoute}
/// Route for the splash screen.
///{@endtemplate}
class LoginRoute {
  static final route = GoRoute(
    path: LoginScreen.route,
    builder: (context, state) {
      return const LoginScreen();
    },
  );
}
