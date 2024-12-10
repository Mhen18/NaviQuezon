import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/route/admin/account_manage_route.dart';
import 'package:naviquezon/src/core/route/admin/report_route.dart';
import 'package:naviquezon/src/core/route/admin/verification_details_route.dart';
import 'package:naviquezon/src/core/route/admin/verification_route.dart';
import 'package:naviquezon/src/core/route/authentication/dashboard_shell_route.dart';
import 'package:naviquezon/src/core/route/authentication/forgot_password_reset_route.dart';
import 'package:naviquezon/src/core/route/authentication/forgot_password_route.dart';
import 'package:naviquezon/src/core/route/authentication/login_route.dart';
import 'package:naviquezon/src/core/route/authentication/registration_route.dart';
import 'package:naviquezon/src/core/route/authentication/splash_route.dart';
import 'package:naviquezon/src/core/route/authentication/terms_and_condition_route.dart';
import 'package:naviquezon/src/core/route/authentication/validation_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_details_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_image_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_like_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_owner_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_reviews_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_setup_amenity_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_setup_assets_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_setup_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_visited_route.dart';
import 'package:naviquezon/src/core/route/faq/faq_setup_route.dart';
import 'package:naviquezon/src/core/route/profile/profile_edit_route.dart';
import 'package:naviquezon/src/core/route/profile/profile_password_edit_route.dart';
import 'package:naviquezon/src/core/utils/loggers/go_router_logger.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';



///{@template AppRouter}
/// Config for the router of the app.
///{@endtemplate}
class AppRouter {
  //  Root navigator key
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  //  Router config
  static GoRouter config = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    observers: [
      GoRouterLogger(),
    ],
    routes: [
      //  Authentication
      SplashRoute.route,
      TermsAndConditionRoute.route,
      LoginRoute.route,
      RegistrationRoute.route,
      ValidationRoute.route,
      VerificationRoute.route,
      VerificationDetailsRoute.route,
      ForgotPasswordRoute.route,
      ForgotPasswordResetRoute.route,

      //  Admin
      AccountManageRoute.route,

      //  Dashboard
      DashboardShellRoute.shellRoute,

      //  Report
      ReportRoute.route,

      //  Establishment
      EstablishmentOwnerRoute.route,
      EstablishmentSetupRoute.route,
      EstablishmentSetupAmenityRoute.route,
      EstablishmentSetupAssetsRoute.route,
      EstablishmentDetailsRoute.route,
      EstablishmentImageRoute.route,
      EstablishmentLikeRoute.route,
      EstablishmentReviewsRoute.route,
      EstablishmentVisitedRoute.route,

      //  Profile
      ProfileEditRoute.route,
      ProfilePasswordEditRoute.route,

      //  FAQ
      FaqSetupRoute.route,
    ],
    errorBuilder: (context, state) {
      final route = GoRouter.of(context).routeInformationProvider.value.uri;
      printError(route);

      return const ErrorRouteContainer();
    },
  );
}
