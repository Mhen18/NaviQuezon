import 'package:flutter/material.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer_button.dart';

///{@template AdminDrawer}
/// Custom widget that display the drawer
///{@endtemplate}
class AdminDrawer extends StatelessWidget {
  ///{@macro AdminDrawer}
  const AdminDrawer({
    required bool isSuperAdmin,
    required void Function() onEditPressed,
    required void Function() onVerifyPressed,
    required void Function() onFaqSetupPressed,
    required void Function() onManagePressed,
    required void Function() onEditProfilePressed,
    required void Function() onEditPasswordPressed,
    required void Function() onLogoutPressed,
    super.key,
  })  : _isSuperAdmin = isSuperAdmin,
        _onEditPressed = onEditPressed,
        _onVerifyPressed = onVerifyPressed,
        _onFaqSetupPressed = onFaqSetupPressed,
        _onManagePressed = onManagePressed,
        _onEditProfilePressed = onEditProfilePressed,
        _onEditPasswordPressed = onEditPasswordPressed,
        _onLogoutPressed = onLogoutPressed;

  final bool _isSuperAdmin;
  final void Function() _onEditPressed;
  final void Function() _onVerifyPressed;
  final void Function() _onFaqSetupPressed;
  final void Function() _onManagePressed;
  final void Function() _onEditProfilePressed;
  final void Function() _onEditPasswordPressed;
  final void Function() _onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultDrawer(
      buttonList: [
        DefaultDrawerButton(
          onPressed: _onEditPressed,
          icon: Icons.edit,
          text: 'Edit Form',
        ),
        if (_isSuperAdmin == true) ...[
          DefaultDrawerButton(
            onPressed: _onVerifyPressed,
            icon: Icons.person_add,
            text: 'Verify Accounts',
          ),
          DefaultDrawerButton(
            onPressed: _onFaqSetupPressed,
            icon: Icons.question_answer,
            text: 'FAQ Setup',
          ),
          DefaultDrawerButton(
            onPressed: _onManagePressed,
            icon: Icons.person,
            text: 'Manage Accounts',
          ),
        ],
        DefaultDrawerButton(
          onPressed: _onEditProfilePressed,
          icon: Icons.account_circle,
          text: 'Edit Profile',
        ),
        DefaultDrawerButton(
          onPressed: _onEditPasswordPressed,
          icon: Icons.password,
          text: 'Edit Password',
        ),
        DefaultDrawerButton(
          onPressed: _onLogoutPressed,
          icon: Icons.logout,
          text: 'Logout',
        ),
      ],
    );
  }
}
