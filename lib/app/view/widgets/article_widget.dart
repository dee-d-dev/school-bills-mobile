import 'package:flutter/material.dart';
import 'package:school_bills/core/utils/config.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Config.contentPadding(v: 15),
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                    Text('The Gaurdian • 19h', style: Config.b3),
                  ],
                ),
                Config.vGap10,
                Text(
                    'Lorem ipsum dolor sit amet consectetur. Blandit quam ac porttitor venenatis suspendisse proin. Blandit quam ac porttitor venenatis suspendisse proin. Blandit quam ac porttitor venenatis suspendisse proin.',
                    maxLines: 5,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Config.b1b),
              ],
            ),
          ),
          Config.hGap10,
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
