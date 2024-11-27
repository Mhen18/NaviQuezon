import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/authentication/splash/presentation/screens/splash_screen.dart';

///{@template SplashRoute}
/// Route for the splash screen.
///{@endtemplate}
class SplashRoute {
  static final route = GoRoute(
    path: SplashScreen.route,
    builder: (context, state) {
      return const SplashScreen();
    },
  );
}
