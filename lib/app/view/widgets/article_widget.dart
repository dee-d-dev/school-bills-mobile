import 'package:flutter/material.dart';
import 'package:school_bills/app/data/models/article_model.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/cached_image.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleModel article;
  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Config.contentPadding(v: 15),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CachedImage(
                      url: article.thumbnail?.lowRes.url ?? '',
                      height: 20,
                      width: 20,
                      radius: 4,
                    ),
                    Config.hGap5,
                    Text('${article.publisher} • 19h',
                        style: Config.textTheme.labelSmall),
                  ],
                ),
                Config.vGap10,
                Text(article.title,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Config.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Config.hGap10,
          CachedImage(
            url: article.thumbnail?.lowRes.url ?? '',
            height: 80,
            width: 80,
            radius: 4,
          ),
        ],
      ),
    );
  }
}
