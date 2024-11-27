import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/route/app_router.dart';
import 'package:naviquezon/src/core/themes/app_theme.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/application/forgot_password_send_cubit.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';

///{@template App}
/// The root widget of the application.
///{@endtemplate}
class App extends StatefulWidget {
  ///{@macro App}
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _roleCubit = AppRoleCubit();
  final _profileCubit = ProfileGetCubit();
  final _forgotPassCubit = ForgotPasswordSendCubit();

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  //  Method to initialize the blocs/cubits.
  void _initBlocs() {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => _roleCubit,
        ),
        BlocProvider(
          lazy: false,
          create: (context) => _profileCubit,
        ),
        BlocProvider(
          lazy: false,
          create: (context) => _forgotPassCubit,
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: AppRouter.config.routeInformationParser,
        routeInformationProvider: AppRouter.config.routeInformationProvider,
        routerDelegate: AppRouter.config.routerDelegate,
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: true,
        builder: (context, child) {
          final data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
