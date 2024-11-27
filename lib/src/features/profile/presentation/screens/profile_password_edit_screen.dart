import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_password_update_cubit.dart';

class ProfilePasswordEditScreen extends StatefulWidget {
  const ProfilePasswordEditScreen({super.key});

  static const route = rProfilePassword;

  @override
  State<ProfilePasswordEditScreen> createState() => _ScreenState();
}

class _ScreenState extends State<ProfilePasswordEditScreen> {
  final _passwordCubit = ProfilePasswordUpdateCubit();

  final _passCurrentController = TextEditingController();
  final _passNewController = TextEditingController();
  final _passConfirmController = TextEditingController();

  String? _passErrorText;

  bool get _valid {
    final currentPassword = _passCurrentController.text;
    final newPassword = _passNewController.text;
    final confirm = _passConfirmController.text;

    return currentPassword.isNotEmpty && (newPassword == confirm);
  }

  /// Handle the save button pressed.
  ///
  void _onSavePressed() {
    final currentPassword = _passCurrentController.text;
    final newPassword = _passNewController.text;

    _passwordCubit.run(
      oldPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  /// Handle the current password changed.
  ///
  void _onNewPasswordChanged(String value) {
    final newPassword = _passNewController.text;
    final confirm = _passConfirmController.text;

    setState(() {
      //  Check if the new password is empty.
      if (newPassword.isEmpty || confirm.isEmpty) {
        _passErrorText = null;
      } else {
        //  Check if the new password and confirm password do not match.
        if (newPassword != confirm) {
          _passErrorText = 'Passwords do not match.';
        } else {
          _passErrorText = null;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _passwordCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Password'),
          actions: [
            TextButton(
              onPressed: _valid ? _onSavePressed : null,
              child: const Text('Save'),
            ),
          ],
        ),
        body: BlocListener<ProfilePasswordUpdateCubit, CubitState>(
          listener: (context, passwordState) {
            if (passwordState is CubitStateLoading) {
              LoadingDialog.show(context);
            }

            if (passwordState is CubitStateFailed) {
              LoadingDialog.hide(context);

              final failure = passwordState.failure;
              AppSnackBar.error(context).show(failure.message);
            }

            if (passwordState is CubitStateSuccess) {
              LoadingDialog.hide(context);

              AppSnackBar.success(context).show(
                'Password updated successfully.',
              );

              context.pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      RoundedTextField.password(
                        controller: _passCurrentController,
                        label: 'Current Password',
                      ),
                      const Gap(16),
                      RoundedTextField.password(
                        controller: _passNewController,
                        label: 'New Password',
                        onChanged: _onNewPasswordChanged,
                        errorText: _passErrorText,
                      ),
                      const Gap(16),
                      RoundedTextField.password(
                        controller: _passConfirmController,
                        label: 'Confirm Password',
                        onChanged: _onNewPasswordChanged,
                      ),
                    ],
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
