import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_discover_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_itinerary_route.dart';
import 'package:naviquezon/src/core/route/establishment/establishment_map_route.dart';
import 'package:naviquezon/src/core/route/faq/faq_route.dart';
import 'package:naviquezon/src/core/route/profile/profile_route.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/containers/error_route_container.dart';
import 'package:naviquezon/src/features/user/dashboard/presentation/screens/dashboard_shell_screen.dart';

///{@template DashboardShellRoute}
/// Shell route for the dashboard.
///{@endtemplate}
class DashboardShellRoute {
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static ShellRoute get shellRoute {
    return ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        final role = context.read<AppRoleCubit>().state;

        if (role != AppRoleEnum.user) {
          return const ErrorRouteContainer();
        }

        return DashboardShellScreen(
          child: child,
        );
      },
      routes: [
        EstablishmentDiscoverRoute.route,
        EstablishmentMapRoute.route,
        FaqRoute.route,
        EstablishmentItineraryRoute.route,
        ProfileRoute.route,
      ],
    );
  }
}
