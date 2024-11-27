import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/presentation/forgot_password_screen.dart';

///{@template ForgotPasswordRoute}
/// Route for the splash screen.
///{@endtemplate}
class ForgotPasswordRoute {
  static final route = GoRoute(
    path: ForgotPasswordScreen.route,
    builder: (context, state) {
      return const ForgotPasswordScreen();
    },
  );
}
