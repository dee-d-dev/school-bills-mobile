import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/config.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  const EmptyWidget({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            textAlign: TextAlign.center,
            style: Config.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600)),
        Config.vGap15,
        if (subtitle != null)
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: Config.textTheme.bodyMedium,
          ),
        Config.vGap20,
      ],
    );
  }
}
