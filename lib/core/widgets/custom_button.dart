import 'package:flutter/material.dart';

enum ButtonType { filled, outlined, elevated, text }

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.icon,
    this.onPressed,
    this.hPadding = 0,
    this.cPadding = 20,
    this.type = ButtonType.filled,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final double hPadding;
  final double cPadding;
  final Widget? icon;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: EdgeInsets.all(cPadding),
      child: Text(text),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: switch (type) {
        ButtonType.filled => FilledButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon ?? const SizedBox.shrink(),
          ),
        ButtonType.outlined => OutlinedButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon ?? const SizedBox.shrink(),
          ),
        ButtonType.elevated => ElevatedButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon ?? const SizedBox.shrink(),
          ),
        ButtonType.text => TextButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon ?? const SizedBox.shrink(),
          ),
      },
    );
  }
}
