import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/profile_edit_screen.dart';

///{@template ProfileEditRoute}
/// Route for the [ProfileEditScreen].
///{@endtemplate}
class ProfileEditRoute {
  static final route = GoRoute(
    path: ProfileEditScreen.route,
    builder: (context, state) {
      return const ProfileEditScreen();
    },
  );
}
