import 'package:flutter/material.dart';

import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';

///{@template RoundedButton}
/// Custom widget that display the rounded button of the app
///{@endtemplate}
class RoundedButton extends StatelessWidget {
  ///{@macro RoundedButton}
  const RoundedButton({
    super.key,
    String? label,
    TextStyle? labelStyle,
    Color? labelColor,
    TextAlign? labelAlign,
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    void Function()? onPressed,
    Color? backgroundColor,
    Color? shadowColor,
    Color? borderColor,
    double? elevation,
    double? radius,
  })  : _radius = radius,
        _elevation = elevation,
        _borderColor = borderColor,
        _shadowColor = shadowColor,
        _backgroundColor = backgroundColor,
        _onPressed = onPressed,
        _margin = margin,
        _padding = padding,
        _width = width,
        _height = height,
        _labelColor = labelColor,
        _labelAlign = labelAlign,
        _labelStyle = labelStyle,
        _label = label;

  final String? _label;
  final TextStyle? _labelStyle;
  final TextAlign? _labelAlign;
  final Color? _labelColor;
  final double? _height;
  final double? _width;
  final EdgeInsetsGeometry? _padding;
  final EdgeInsetsGeometry? _margin;
  final void Function()? _onPressed;
  final Color? _backgroundColor;
  final Color? _shadowColor;
  final Color? _borderColor;
  final double? _elevation;
  final double? _radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height ?? 48,
      width: _width,
      margin: _margin,
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: _shadowColor ?? _borderColor,
          foregroundColor: _borderColor,
          surfaceTintColor: Colors.transparent,
          padding: _padding ?? const EdgeInsets.symmetric(horizontal: 32),
          elevation: _elevation,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: _onPressed == null
                  ? Colors.transparent
                  : _borderColor ?? _backgroundColor ?? color1363DF,
            ),
            borderRadius: BorderRadius.circular(_radius ?? 8),
          ),
          backgroundColor: _backgroundColor ?? color1363DF,
          disabledBackgroundColor: Colors.grey,
        ),
        child: Text(
          _label ?? '',
          textAlign: _labelAlign,
          style: _labelStyle ??
              textStyle14w600.copyWith(
                color: _labelColor ?? Colors.white,
              ),
        ),
      ),
    );
  }
}
