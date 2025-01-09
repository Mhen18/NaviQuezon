import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/terms_and_conditions.dart';

class TermsAndConditionRoute {
  static const path = '/terms-and-conditions'; // Path constant

  static final route = GoRoute(
    path: path, // Use the static path
    builder: (context, state) => const TermsAndConditionsScreen(),
  );
}
