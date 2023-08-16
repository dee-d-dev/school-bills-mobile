import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_bills/core/utils/config.dart';

class CustomTextField extends StatefulWidget {
  final void Function(String) onChanged;
  final String hint;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters = const [],
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        contentPadding: const EdgeInsets.all(15),
        hintText: widget.hint,
        hintStyle: Config.b1,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      validator: (value) {
        return value == null || value.trim().isEmpty
            ? '${widget.hint} is required'
            : null;
      },
    );
  }
}
