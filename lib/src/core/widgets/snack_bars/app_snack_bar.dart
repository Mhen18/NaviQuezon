import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';

///{@template SuccessSnackBar}
/// Custom snackBar widget that display the message.
///{@endtemplate}
class AppSnackBar {
  ///{@macro AppSnackBar}
  AppSnackBar(
    this._context, {
    Widget? content,
    int? durationSeconds,
    Color? backgroundColor,
    Color? textColor,
    bool floating = false,
    bool toast = false,
  })  : _toast = toast,
        _floating = floating,
        _textColor = textColor,
        _backgroundColor = backgroundColor,
        _durationSeconds = durationSeconds,
        _content = content;

  ///{@macro AppSnackBar.success}
  AppSnackBar.success(
    this._context, {
    int? durationSeconds,
    bool floating = false,
    bool toast = false,
  })  : _toast = toast,
        _floating = floating,
        _durationSeconds = durationSeconds,
        _content = null,
        _backgroundColor = colorSuccess700,
        _textColor = Colors.white;

  ///{@macro AppSnackBar.error}
  AppSnackBar.error(
    this._context, {
    int? durationSeconds,
    bool floating = false,
    bool toast = false,
  })  : _toast = toast,
        _floating = floating,
        _durationSeconds = durationSeconds,
        _content = null,
        _backgroundColor = colorError700,
        _textColor = Colors.white;

  ///{@macro AppSnackBar.info}
  AppSnackBar.info(
    this._context, {
    int? durationSeconds,
    bool floating = false,
    bool toast = false,
  })  : _toast = toast,
        _floating = floating,
        _durationSeconds = durationSeconds,
        _content = null,
        _backgroundColor = color1363DF,
        _textColor = Colors.white;

  final BuildContext _context;
  final Widget? _content;
  final int? _durationSeconds;
  final Color? _backgroundColor;
  final Color? _textColor;
  final bool _floating;
  final bool _toast;

  /// Method to show the snackBar message.
  ///
  void show(String message) {
    try {
      if (_toast == true) {
        Fluttertoast.cancel();
        Fluttertoast.showToast(
          msg: message,
          textColor: _textColor,
          backgroundColor: _backgroundColor,
        );
        return;
      }

      final snackBar = SnackBar(
        backgroundColor: _backgroundColor ?? Colors.white,
        duration: Duration(seconds: _durationSeconds ?? 2),
        behavior:
            _floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
        margin: _floating ? EdgeInsets.zero : null,
        shape: _floating ? const RoundedRectangleBorder() : null,
        content: _content ??
            Text(
              message,
              style: textStyle14w600.copyWith(
                color: _textColor,
              ),
            ),
      );

      //  Close the existing snackBar before showing the new one.
      ScaffoldMessenger.of(_context).clearSnackBars();

      //  Show the snackBar.
      ScaffoldMessenger.of(_context).showSnackBar(snackBar);
    } on Exception catch (_) {
      //  If showing snackBar failed, show toast instead.
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: message,
        textColor: _textColor,
        backgroundColor: _backgroundColor,
      );
    }
  }
}
