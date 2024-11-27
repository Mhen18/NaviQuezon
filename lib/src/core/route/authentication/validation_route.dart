import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/authentication/registration/presentation/screens/registration_validation_screen.dart';

///{@template ValidationRoute}
/// Route for the splash screen.
///{@endtemplate}
class ValidationRoute {
  static final route = GoRoute(
    path: RegistrationValidationScreen.route,
    builder: (context, state) {
      final params = state.extra! as RegistrationValidationScreenParams;

      return RegistrationValidationScreen(
        params: params,
      );
    },
  );
}
