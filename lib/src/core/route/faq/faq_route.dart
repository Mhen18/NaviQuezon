import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/user/faq/presentation/screens/faq_screen.dart';

///{@template FaqRoute}
/// Route for the splash screen.
///{@endtemplate}
class FaqRoute {
  static final route = GoRoute(
    path: FaqScreen.route,
    builder: (context, state) {
      return const FaqScreen();
    },
  );
}
