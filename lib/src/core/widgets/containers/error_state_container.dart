import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';

///{@template ErrorContainer}
/// Custom container that used to show error state.
///{@endtemplate}
class ErrorStateContainer extends StatelessWidget {
  ///{@macro ErrorContainer}
  const ErrorStateContainer({
    super.key,
    void Function()? onPressed,
    String? message,
  })  : _onPressed = onPressed,
        _message = message;

  final String? _message;
  final void Function()? _onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _message ?? 'Failed to load data',
          ),
          if (_onPressed != null) ...[
            const Gap(16),
            RoundedButton(
              onPressed: _onPressed,
              label: 'Retry',
            ),
          ],
        ],
      ),
    );
  }
}
