import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_bills/core/utils/config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hint;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters = const [],
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      style:
          Config.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        contentPadding: const EdgeInsets.all(15),
        hintText: hint,
        hintStyle:
            Config.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      validator: (value) {
        return value == null || value.trim().isEmpty
            ? '$hint is required'
            : null;
      },
    );
  }
}
