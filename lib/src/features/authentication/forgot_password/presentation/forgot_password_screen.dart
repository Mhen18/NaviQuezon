import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/application/forgot_password_send_cubit.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:naviquezon/src/features/authentication/forgot_password/presentation/forgot_password_reset_screen.dart';

///{@template ForgotPasswordScreen}
/// Screen for the forgot password.
///{@endtemplate}
class ForgotPasswordScreen extends StatefulWidget {
  ///{@macro ForgotPasswordScreen}
  const ForgotPasswordScreen({super.key});

  static const route = rForgotPassword;

  @override
  State<ForgotPasswordScreen> createState() => _ScreenState();
}

class _ScreenState extends State<ForgotPasswordScreen> {
  late ForgotPasswordSendCubit _forgotPassCubit;

  final _emailController = TextEditingController();
  final _otpController = TextEditingController();

  String? _otp;
  List<ForgotPasswordEntity> forgotPasswordList = [];
  Timer? _timer;
  bool _canSendEmail = true;
  int _remainingTime = 0;

  @override
  void initState() {
    super.initState();
    _initBlocs();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _initBlocs() {
    _forgotPassCubit = BlocProvider.of<ForgotPasswordSendCubit>(context);
    final forgotPassState = _forgotPassCubit.state;

    if (forgotPassState is CubitStateSuccess<ForgotPasswordEntity>) {
      forgotPasswordList.add(forgotPassState.value);
    }
  }

  void _startTimer(int seconds) {
    setState(() {
      _canSendEmail = false;
      _remainingTime = seconds; // 2 minutes in seconds
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _canSendEmail = true;
          timer.cancel();
        }
      });
    });
  }

  void _onSendPressed() {
    if (!_canSendEmail) {
      AppSnackBar.error(context).show(
        'Please wait before sending another email',
      );
      return;
    }

    for (final forgotPassword in forgotPasswordList) {
      if (forgotPassword.email == _emailController.text) {
        final emailDate = forgotPassword.date;
        final nowDate = DateTime.now();
        final diff = nowDate.difference(emailDate).inMinutes;

        if (diff < 2) {
          AppSnackBar.error(context).show('Email already sent');
          setState(() {
            _canSendEmail = false;
            _startTimer(diff * 60);
            _otp = forgotPassword.otp;
          });
          return;
        }
      }
    }

    _forgotPassCubit.run(_emailController.text);
    FocusScope.of(context).unfocus();
    _startTimer(120);
  }

  /// Method to handle the reset button pressed.
  ///
  void _onResetPressed() {
    final otp = _otpController.text;

    if (otp != _otp) {
      AppSnackBar.error(context).show('Invalid OTP');
      return;
    }

    context.pushReplacement(
      ForgotPasswordResetScreen.route,
      extra: ForgotPasswordResetParams(
        email: _emailController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: BlocConsumer<ForgotPasswordSendCubit, CubitState>(
        listener: (context, sendState) {
          if (sendState is CubitStateLoading) {
            LoadingDialog.show(context);
          }

          if (sendState is CubitStateFailed) {
            LoadingDialog.hide(context);
            final failure = sendState.failure;
            AppSnackBar.error(context).show(failure.message);
          }

          if (sendState is CubitStateSuccess<ForgotPasswordEntity>) {
            LoadingDialog.hide(context);
            final forgotPass = sendState.value;

            setState(() {
              forgotPasswordList
                ..removeWhere((fp) => fp.email == forgotPass.email)
                ..add(forgotPass);
              _otp = forgotPass.otp;
            });

            AppSnackBar.success(context).show('Password reset email sent');
          }
        },
        builder: (context, sendState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedTextField(
                  controller: _emailController,
                  label: 'Email',
                  suffixIcon: _canSendEmail
                      ? TextButton(
                          onPressed: _onSendPressed,
                          child: const Text('Send'),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text('${_remainingTime}s'),
                        ),
                ),
                const Gap(16),
                RoundedTextField(
                  controller: _otpController,
                  label: 'OTP',
                  enabled: _otp != null,
                  fillColor: _otp == null ? Colors.grey[200] : null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                  ],
                ),
                const Gap(16),
                RoundedButton(
                  onPressed: _otp == null ? null : _onResetPressed,
                  label: 'Reset Password',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
