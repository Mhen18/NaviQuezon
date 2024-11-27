import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';

///{@template DefaultDrawerButton}
/// Button widget for the report drawer.
///{@endtemplate}
class DefaultDrawerButton extends StatelessWidget {
  ///{@macro DefaultDrawerButton}
  const DefaultDrawerButton({
    required this.onPressed,
    required this.icon,
    required this.text,
    super.key,
  });

  final void Function() onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black87,
          ),
          const Gap(10),
          Expanded(
            child: Text(
              text,
              style: textStyle14w400,
            ),
          ),
          const Gap(8),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
