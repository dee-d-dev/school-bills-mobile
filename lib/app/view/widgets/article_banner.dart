import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/config.dart';

class ArticleBanner extends StatelessWidget {
  const ArticleBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.y(220),
      width: double.infinity,
      padding: Config.contentPadding(h: 15, v: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.transparent, Color(0xFF66096F)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Config.hGap5,
              Text('The Gaurdian • 19h',
                  style: Config.textTheme.labelSmall
                      ?.copyWith(color: Colors.white)),
            ],
          ),
          Config.vGap10,
          Text(
              'Lorem ipsum dolor sit amet consectetur. Blandit quam ac porttitor venenatis suspendisse proin.',
              style: Config.textTheme.bodySmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
