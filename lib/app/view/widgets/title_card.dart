import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/config.dart';

class TileCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  const TileCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Config.contentPadding(h: 20),
      padding: Config.contentPadding(h: 15, v: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData),
          Config.hGap20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Config.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              Text(subtitle),
            ],
          )
        ],
      ),
    );
  }
}
