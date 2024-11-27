import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/profile_screen.dart';

///{@template ProfileRoute}
/// Route for the [ProfileScreen].
///{@endtemplate}
class ProfileRoute {
  static final route = GoRoute(
    path: ProfileScreen.route,
    builder: (context, state) {
      return const ProfileScreen();
    },
  );
}
