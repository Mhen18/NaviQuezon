import 'package:flutter/material.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';

///{@template BorderDropdown}
/// Custom dropdown with border for dynamic type.
///{@endtemplate}
class BorderDropdown<Type> extends StatefulWidget {
  const BorderDropdown({
    required this.onChanged,
    this.items,
    super.key,
    this.label,
    this.labelStyle,
    this.labelColor,
    this.hint,
    this.value,
    this.contentPadding,
  });

  final void Function(Type?)? onChanged;
  final List<DropdownMenuItem<Type>>? items;
  final String? label;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final String? hint;
  final Type? value;
  final EdgeInsets? contentPadding;

  @override
  State<BorderDropdown<Type>> createState() => _BorderDropdownState();
}

class _BorderDropdownState<Type> extends State<BorderDropdown<Type>> {
  /// Get the items from the widget.
  ///
  List<DropdownMenuItem<Type>>? get _items => widget.items;

  /// Get the function if the dropdown changes.
  ///
  void Function(Type?)? get _onChanged => widget.onChanged;

  /// Get the label that will be displayed in the dropdown.
  ///
  String? get _label => widget.label;

  /// Get the label style that will be displayed in the dropdown.
  ///
  TextStyle? get _labelStyle => widget.labelStyle;

  /// Get the label color that will be displayed in the dropdown.
  ///
  Color? get _labelColor => widget.labelColor;

  /// Get the hint that will be displayed in the dropdown.
  ///
  String? get _hint => widget.hint;

  /// Get the value of the dropdown.
  ///
  Type? get _value => widget.value;

  /// Get the content padding of the dropdown.
  ///
  EdgeInsets get _contentPadding {
    return widget.contentPadding ?? const EdgeInsets.all(16);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_label != null) ...[
          Text(
            _label!,
            style: _labelStyle ?? textStyle12w600.copyWith(color: _labelColor),
          ),
          const SizedBox(height: 4),
        ],
        DropdownButtonFormField<Type>(
          onChanged: _onChanged,
          value: _value,
          items: _items,
          style: textStyle14w500,
          isExpanded: true,
          hint: _hint == null
              ? null
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _hint!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: _items != null ? Colors.white : Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.black87,
              ),
            ),
            contentPadding: _contentPadding,
          ),
        ),
      ],
    );
  }
}
