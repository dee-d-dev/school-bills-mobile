import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/config.dart';

class RecieptInfo extends StatelessWidget {
  final String leading;
  final String trailing;
  const RecieptInfo({super.key, required this.leading, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading, style: Config.b2),
        Text(trailing, style: Config.b2b),
      ],
    );
  }
}
