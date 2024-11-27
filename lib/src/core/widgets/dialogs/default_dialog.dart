import 'package:flutter/material.dart';

///{@template DefaultDialog}
/// Custom dialog that used to show default dialog.
///{@endtemplate}
class DefaultDialog extends StatelessWidget {
  ///{@macro DefaultDialog}
  const DefaultDialog({
    required Widget child,
    super.key,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
  })  : _child = child,
        _margin = margin,
        _padding = padding,
        _borderRadius = borderRadius;

  final Widget _child;
  final EdgeInsetsGeometry? _margin;
  final EdgeInsetsGeometry? _padding;
  final BorderRadius? _borderRadius;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: _padding ?? const EdgeInsets.all(16),
        margin: _margin ?? const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: _borderRadius ?? BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _child,
          ],
        ),
      ),
    );
  }
}
