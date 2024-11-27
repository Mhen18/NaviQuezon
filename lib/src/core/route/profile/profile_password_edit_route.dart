import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/profile_password_edit_screen.dart';

///{@template ProfilePasswordEditRoute}
/// Route for the [ProfilePasswordEditScreen].
///{@endtemplate}
class ProfilePasswordEditRoute {
  static final route = GoRoute(
    path: ProfilePasswordEditScreen.route,
    builder: (context, state) {
      return const ProfilePasswordEditScreen();
    },
  );
}
