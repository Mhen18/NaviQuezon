import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/application/forgot_password_reset_cubit.dart';
import 'package:naviquezon/src/features/authentication/splash/presentation/screens/splash_screen.dart';

///{@template ForgotPasswordResetParams}
/// Parameters for [ForgotPasswordResetScreen].
///{@endtemplate}
class ForgotPasswordResetParams {
  ///{@macro ForgotPasswordResetParams}
  const ForgotPasswordResetParams({
    required this.email,
  });

  final String email;
}

///{@template ForgotPasswordResetScreen}
/// Screen for the forgot password reset.
///{@endtemplate}
class ForgotPasswordResetScreen extends StatefulWidget {
  ///{@macro ForgotPasswordResetScreen}
  const ForgotPasswordResetScreen({
    required ForgotPasswordResetParams params,
    super.key,
  }) : _params = params;

  final ForgotPasswordResetParams _params;

  static const route = rForgotPasswordReset;

  @override
  State<ForgotPasswordResetScreen> createState() => _ScreenState();
}

class _ScreenState extends State<ForgotPasswordResetScreen> {
  final _resetCubit = ForgotPasswordResetCubit();

  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  String? _passwordError;

  ForgotPasswordResetParams get _params => widget._params;

  /// Method to handle the password changed.
  ///
  void _onPasswordChanged(String? value) {
    final password = value;
    final rePassword = _rePasswordController.text;

    setState(() {
      if (password != rePassword) {
        _passwordError = 'Password does not match.';
      } else {
        _passwordError = null;
      }
    });
  }

  /// Method to handle the re-password changed.
  ///
  void _onRePasswordChanged(String? value) {
    final password = _passwordController.text;
    final rePassword = value;

    setState(() {
      if (password != rePassword) {
        _passwordError = 'Password does not match.';
      } else {
        _passwordError = null;
      }
    });
  }

  /// Method to handle the reset password button pressed.
  ///
  void _onResetPasswordPressed() {
    // Reset password.
    _resetCubit.run(
      email: _params.email,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _resetCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go(SplashScreen.route);
            },
          ),
        ),
        body: BlocListener<ForgotPasswordResetCubit, CubitState>(
          listener: (context, resetState) {
            if (resetState is CubitStateLoading) {
              LoadingDialog.show(context);
            }

            if (resetState is CubitStateFailed) {
              LoadingDialog.hide(context);
              final failure = resetState.failure;
              AppSnackBar.error(context).show(failure.message);
            }

            if (resetState is CubitStateSuccess<void>) {
              LoadingDialog.hide(context);
              AppSnackBar.success(context).show('Password reset successful');

              context.go(SplashScreen.route);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Reset password for email: ',
                    children: [
                      TextSpan(
                        text: _params.email,
                        style: textStyle14w600,
                      ),
                    ],
                  ),
                  style: textStyle14w400,
                ),
                const Gap(16),
                RoundedTextField(
                  controller: _passwordController,
                  onChanged: _onPasswordChanged,
                  label: 'New Password',
                ),
                const Gap(8),
                RoundedTextField(
                  controller: _rePasswordController,
                  onChanged: _onRePasswordChanged,
                  errorText: _passwordError,
                  label: 'Re-enter Password',
                ),
                const Gap(16),
                Center(
                  child: RoundedButton(
                    onPressed:
                        _passwordError == null ? _onResetPasswordPressed : null,
                    label: 'Reset Password',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
