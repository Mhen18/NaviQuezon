import 'package:flutter/material.dart';
import 'package:naviquezon/src/core/widgets/containers/box_container.dart';

///{@template BoxLabelContainer}
/// A container that is used to wrap a label with a box.
///{@endtemplate}
class BoxLabelContainer extends StatelessWidget {
  ///{@macro BoxContainer}
  const BoxLabelContainer({
    required String name,
    required double width,
    super.key,
    double? height,
    TextStyle? style,
    TextAlign? textAlign,
    Color? backgroundColor,
  })  : _style = style,
        _width = width,
        _name = name,
        _height = height,
        _textAlign = textAlign,
        _backgroundColor = backgroundColor;

  final String _name;
  final double _width;
  final double? _height;
  final TextStyle? _style;
  final TextAlign? _textAlign;
  final Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _name,
      child: BoxContainer(
        height: _height,
        width: _width,
        color: _backgroundColor,
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Text(
              _name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: _textAlign ?? TextAlign.start,
              style: _style,
            ),
          ),
        ),
      ),
    );
  }
}
