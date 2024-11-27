import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template AccountInviteFailure}
/// Failure for account invite.
///{@endtemplate}
class AccountInviteFailure extends Failure {
  ///{@macro AccountInviteFailure}
  const AccountInviteFailure()
      : super(
          message: 'Admin added successfully, but failed to send the email.',
        );
}
