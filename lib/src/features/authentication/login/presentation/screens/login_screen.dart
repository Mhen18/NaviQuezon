import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/scaffolds/background_scaffold.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/admin/report/presentation/screens/report_screen.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/presentation/forgot_password_screen.dart';
import 'package:naviquezon/src/features/authentication/login/application/blocs/post_login_cubit.dart';
import 'package:naviquezon/src/features/authentication/login/domain/models/login_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_discover_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_owner_screen.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template LoginScreen}
/// Screen for the login.
///{@endtemplate}
class LoginScreen extends StatefulWidget {
  ///{@macro LoginScreen}
  const LoginScreen({super.key});

  static const route = rLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginCubit = PostLoginCubit();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Method to handle the pop scope.
  ///
  void _onPopInvoked(bool didPop, dynamic data) {
    //  Check if the pop was invoked.
    if (didPop) return;

    final role = context.read<AppRoleCubit>().state;

    //  Check if the app flavor is not admin.
    if (role != AppRoleEnum.admin) {
      //  Navigate to the splash screen.
      context.pop();
    }
  }

  /// Method to handle the continue button.
  ///
  void _onContinuePressed() {
    //  Get the email from the email field.
    final email = _emailController.text;
    //  Get the password from the password field.
    final password = _passwordController.text;

    final login = LoginModel(
      emailOrPhone: email,
      password: password,
    );

    //  Run the login cubit.
    _loginCubit.run(login: login);
  }

  /// Method to handle the forgot password button.
  ///
  void _onForgotPasswordPressed() {
    context.push(ForgotPasswordScreen.route);
  }

  /// Getter for the icon path based on flavor.
  ///
  String? get _icon {
    final role = context.read<AppRoleCubit>().state;

    switch (role) {
      case AppRoleEnum.superAdmin:
      case AppRoleEnum.admin:
        return Assets.images.icons.icAdmin.keyName;
      case AppRoleEnum.owner:
        return Assets.images.icons.icOwner.keyName;
      case AppRoleEnum.user:
        return null;
    }
  }

  /// Getter to validate the form.
  ///
  bool get _valid {
    //  Check if the email field is not empty.
    final hasEmail = _emailController.text.isNotEmpty;
    //  Check if the password field is not empty.
    final hasPassword = _passwordController.text.isNotEmpty;

    return hasPassword && hasEmail;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginCubit,
      child: BlocListener<PostLoginCubit, CubitState>(
        listener: (context, loginState) {
          if (loginState is CubitStateLoading) {
            //  Show the loading dialog.
            LoadingDialog.show(context);
          }

          if (loginState is CubitStateFailed) {
            //  Close the dialog.
            LoadingDialog.hide(context);

            final failure = loginState.failure;

            //  Show the error message.
            AppSnackBar.error(context).show(failure.message);
          }

          if (loginState is CubitStateSuccess<ProfileModel>) {
            //  Close the dialog.
            LoadingDialog.hide(context);

            //  Get the profile from the state.
            final profile = loginState.value;

            //  Check if the profile has a role.
            //  Get the role from the profile.
            final role = AppRoleEnum.fromString(profile.role);

            //  Emit the role.
            context.read<AppRoleCubit>().emitRole(role);

            //  Emit the profile
            context.read<ProfileGetCubit>().emitProfile(profile);

            //  Check the role.
            switch (role) {
              case AppRoleEnum.superAdmin:
              case AppRoleEnum.admin:
                //  Navigate to the report screen.
                context.go(ReportScreen.route);
              case AppRoleEnum.owner:
                //  Navigate to the establishment list screen.
                context.go(EstablishmentOwnerScreen.route);
              case AppRoleEnum.user:
                //  Navigate to the dashboard screen.
                context.go(EstablishmentDiscoverScreen.route);
            }
          }
        },
        child: BackgroundScaffold.keyboard(
          canPop: false,
          onPopInvokedWithResult: _onPopInvoked,
          builder: (context, visible, role) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: visible
                      ? MediaQuery.of(context).size.height - 200
                      : MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Opacity(
                          opacity: _icon != null ? 1 : 0,
                          child: Image.asset(
                            _icon ?? Assets.images.icons.icUser.keyName,
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Column(
                          children: [
                            RoundedTextField(
                              controller: _emailController,
                              label: 'Email',
                              labelColor: Colors.white,
                              centerLabel: true,
                            ),
                            const Gap(16),
                            RoundedTextField.password(
                              controller: _passwordController,
                              label: 'Password',
                              labelColor: Colors.white,
                              centerLabel: true,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RoundedButton(
                              onPressed: _valid ? _onContinuePressed : null,
                              label: 'Continue',
                            ),
                            TextButton(
                              onPressed: _onForgotPasswordPressed,
                              child: Text(
                                'Forgot password?',
                                style: textStyle12w600.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
