import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/presentation/forgot_password_reset_screen.dart';

///{@template ForgotPasswordResetRoute}
/// Route for the splash screen.
///{@endtemplate}
class ForgotPasswordResetRoute {
  static final route = GoRoute(
    path: ForgotPasswordResetScreen.route,
    builder: (context, state) {
      final params = state.extra;

      if (params != null) {
        if (params is ForgotPasswordResetParams) {
          return ForgotPasswordResetScreen(params: params);
        }
      }

      return const ErrorRouteContainer();
    },
  );
}
