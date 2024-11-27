import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';

///{@template Debouncer}
/// Debouncer class to handle the debounce of the onChanged method
///{@endtemplate}
class Debouncer {
  ///{@macro Debouncer}
  Debouncer({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

///{@template RoundedTextField}
/// Custom text field widget with border layout
///{@endtemplate}
class RoundedTextField extends StatefulWidget {
  ///{macro: RoundedTextField}
  const RoundedTextField({
    super.key,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    void Function(String)? onFieldSubmitted,
    void Function(String?)? onSaved,
    String? label,
    TextStyle? labelStyle,
    Color? labelColor,
    String? subLabel,
    TextStyle? subLabelStyle,
    Color? subLabelColor,
    TextStyle? fieldTextStyle,
    String? hint,
    TextStyle? hintStyle,
    bool? obscureText,
    String? obscuringCharacter,
    Widget? suffixIcon,
    String? errorText,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines,
    EdgeInsetsGeometry? contentPadding,
    Widget? prefixIcon,
    TextInputType? keyboardType,
    void Function()? onTap,
    int? debounce,
    String? prefixText,
    TextStyle? prefixTextStyle,
    double? radius,
    bool? centerLabel,
    bool? readOnly,
    bool? enabled,
    Color? fillColor,
  })  : _centerLabel = centerLabel,
        _radius = radius,
        _prefixTextStyle = prefixTextStyle,
        _prefixText = prefixText,
        _debounce = debounce,
        _onTap = onTap,
        _keyboardType = keyboardType,
        _contentPadding = contentPadding,
        _maxLines = maxLines,
        _inputFormatters = inputFormatters,
        _textInputAction = textInputAction,
        _errorText = errorText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _obscuringCharacter = obscuringCharacter,
        _obscureText = obscureText,
        _hintStyle = hintStyle,
        _hint = hint,
        _fieldTextStyle = fieldTextStyle,
        _labelStyle = labelStyle,
        _labelColor = labelColor,
        _label = label,
        _subLabelStyle = subLabelStyle,
        _subLabelColor = subLabelColor,
        _subLabel = subLabel,
        _onSaved = onSaved,
        _onFieldSubmitted = onFieldSubmitted,
        _onChanged = onChanged,
        _focusNode = focusNode,
        _controller = controller,
        _readOnly = readOnly,
        _enabled = enabled,
        _fillColor = fillColor;

  ///{@macro RoundedTextField.password}
  /// Display text field with visibility icon for password
  const RoundedTextField.password({
    super.key,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    void Function(String)? onFieldSubmitted,
    void Function(String?)? onSaved,
    String? label,
    TextStyle? labelStyle,
    Color? labelColor,
    String? subLabel,
    TextStyle? subLabelStyle,
    Color? subLabelColor,
    TextStyle? fieldTextStyle,
    String? hint,
    TextStyle? hintStyle,
    String? obscuringCharacter,
    String? errorText,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines,
    EdgeInsetsGeometry? contentPadding,
    Widget? prefixIcon,
    TextInputType? keyboardType,
    void Function()? onTap,
    int? debounce,
    String? prefixText,
    TextStyle? prefixTextStyle,
    double? radius,
    bool? centerLabel,
    bool? readOnly,
    bool? enabled,
    Color? fillColor,
  })  : _centerLabel = centerLabel,
        _radius = radius,
        _prefixTextStyle = prefixTextStyle,
        _prefixText = prefixText,
        _debounce = debounce,
        _onTap = onTap,
        _keyboardType = keyboardType,
        _contentPadding = contentPadding,
        _maxLines = maxLines,
        _inputFormatters = inputFormatters,
        _textInputAction = textInputAction,
        _errorText = errorText,
        _prefixIcon = prefixIcon,
        _obscuringCharacter = obscuringCharacter,
        _hintStyle = hintStyle,
        _hint = hint,
        _fieldTextStyle = fieldTextStyle,
        _labelStyle = labelStyle,
        _labelColor = labelColor,
        _label = label,
        _subLabelStyle = subLabelStyle,
        _subLabelColor = subLabelColor,
        _subLabel = subLabel,
        _onSaved = onSaved,
        _onFieldSubmitted = onFieldSubmitted,
        _onChanged = onChanged,
        _focusNode = focusNode,
        _controller = controller,
        _obscureText = true,
        _suffixIcon = null,
        _readOnly = readOnly,
        _enabled = enabled,
        _fillColor = fillColor;

  final TextEditingController? _controller;
  final FocusNode? _focusNode;
  final void Function(String)? _onChanged;
  final void Function(String)? _onFieldSubmitted;
  final void Function(String?)? _onSaved;
  final String? _label;
  final Color? _labelColor;
  final TextStyle? _labelStyle;
  final String? _subLabel;
  final Color? _subLabelColor;
  final TextStyle? _subLabelStyle;
  final TextStyle? _fieldTextStyle;
  final String? _hint;
  final TextStyle? _hintStyle;
  final bool? _obscureText;
  final String? _obscuringCharacter;
  final Widget? _suffixIcon;
  final Widget? _prefixIcon;
  final String? _errorText;
  final TextInputAction? _textInputAction;
  final List<TextInputFormatter>? _inputFormatters;
  final int? _maxLines;
  final EdgeInsetsGeometry? _contentPadding;
  final TextInputType? _keyboardType;
  final void Function()? _onTap;
  final int? _debounce;
  final String? _prefixText;
  final TextStyle? _prefixTextStyle;
  final double? _radius;
  final bool? _centerLabel;
  final bool? _readOnly;
  final bool? _enabled;
  final Color? _fillColor;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool _obscureText = false;

  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();

    /// Check if the obscure text is not null
    if (widget._obscureText != null) {
      _obscureText = widget._obscureText!;
    }

    _debouncer = Debouncer(milliseconds: widget._debounce ?? 0);
  }

  @override
  void dispose() {
    _debouncer.dispose();

    super.dispose();
  }

  /// Method to handle the onChanged event
  ///
  void _onChanged(String value) {
    if (widget._onChanged != null) {
      //  Check if the debounce is not null
      if (widget._debounce != null) {
        //  Run the debouncer
        _debouncer.run(() => widget._onChanged!(value));
      } else {
        widget._onChanged!(value);
      }
    }
  }

  /// Display the suffix icon if not null or show the
  /// visibility icon button for password
  ///
  Widget? get _suffixIcon {
    if (widget._suffixIcon != null) {
      return widget._suffixIcon;
    }

    if (widget._obscureText != null) {
      return IconButton(
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.black87,
        ),
      );
    }

    return null;
  }

  /// Get the max lines for the text field
  ///
  int get _maxLines {
    if (widget._obscureText != null) {
      return 1;
    }

    return widget._maxLines ?? 1;
  }

  /// Check if the field errorText is not null or empty
  ///
  bool get _hasError {
    if (widget._errorText != null) {
      return widget._errorText!.isNotEmpty;
    }

    return false;
  }

  /// Check if the label should be centered
  ///
  CrossAxisAlignment get _centerLabel {
    if (widget._centerLabel ?? false) {
      return CrossAxisAlignment.center;
    }

    return CrossAxisAlignment.start;
  }

  /// Get the border radius
  ///
  double get _borderRadius {
    return widget._radius ?? 8;
  }

  /// Getter for the label style
  ///
  TextStyle get _labelStyle {
    return widget._labelStyle ??
        textStyle12w600.copyWith(
          color: widget._labelColor,
        );
  }

  /// Getter for the subLabel style
  ///
  TextStyle get _subLabelStyle {
    return widget._subLabelStyle ??
        textStyle10w400.copyWith(
          color: widget._subLabelColor ?? Colors.grey[600],
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: _centerLabel,
      children: [
        if (widget._label != null) ...[
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: widget._label,
                  style: _labelStyle,
                ),
                if (widget._subLabel != null) ...[
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: widget._subLabel,
                    style: _subLabelStyle,
                  ),
                ],
              ],
            ),
            style: _labelStyle,
          ),
          const SizedBox(height: 4),
        ],
        GestureDetector(
          onTap: widget._onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_borderRadius),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: widget._controller,
              focusNode: widget._focusNode,
              readOnly: widget._readOnly ?? false,
              onChanged: _onChanged,
              onFieldSubmitted: widget._onFieldSubmitted,
              onSaved: widget._onSaved,
              obscureText: _obscureText,
              obscuringCharacter: widget._obscuringCharacter ?? '●',
              cursorColor: _hasError ? colorError700 : textPrimary,
              textInputAction: widget._textInputAction,
              inputFormatters: widget._inputFormatters,
              style: widget._fieldTextStyle ?? textStyle14w500,
              keyboardType: widget._keyboardType,
              maxLines: _maxLines,
              enabled: widget._enabled ?? widget._onTap == null,
              decoration: InputDecoration(
                filled: widget._fillColor != null,
                fillColor: widget._fillColor,
                suffixIcon: _suffixIcon,
                prefixIcon: widget._prefixIcon,
                prefixText: widget._prefixText,
                prefixStyle: widget._prefixTextStyle ??
                    textStyle14w400.copyWith(
                      color: textPrimary,
                    ),
                contentPadding:
                    widget._contentPadding ?? const EdgeInsets.all(16),
                hintText: widget._hint,
                hintStyle: widget._hintStyle ??
                    textStyle14w400.copyWith(
                      color: textTertiary,
                    ),
                border: _hasError
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        borderSide: const BorderSide(
                          width: 2,
                          color: colorError,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        borderSide: const BorderSide(
                          color: Colors.black87,
                        ),
                      ),
                focusedBorder: _hasError
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        borderSide: const BorderSide(
                          width: 2,
                          color: colorError,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        borderSide: const BorderSide(
                          width: 2,
                          color: color1363DF,
                        ),
                      ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  borderSide: const BorderSide(
                    width: 2,
                    color: colorError,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  borderSide: const BorderSide(
                    width: 2,
                    color: colorError,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_hasError) ...[
          const SizedBox(height: 8),
          Text(
            widget._errorText!,
            style: textStyle12w400.copyWith(
              color: colorError,
            ),
          ),
        ],
      ],
    );
  }
}
