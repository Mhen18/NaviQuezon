import 'package:flutter/material.dart';

///{@template BoxContainer}
/// A container that is used to wrap a widget with a box.
///{@endtemplate}
class BoxContainer extends StatelessWidget {
  ///{@macro BoxContainer}
  const BoxContainer({
    required double width,
    required Widget child,
    super.key,
    double? height,
    Color? color,
  })  : _width = width,
        _height = height,
        _child = child,
        _color = color;

  final double _width;
  final double? _height;
  final Widget _child;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height ?? 35,
      width: _width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _color ?? Colors.transparent,
        border: Border.all(),
      ),
      child: _child,
    );
  }
}
