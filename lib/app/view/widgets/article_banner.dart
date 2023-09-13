import 'package:flutter/material.dart';
import 'package:school_bills/app/data/models/article_model.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/cached_image.dart';

class ArticleBanner extends StatelessWidget {
  final ArticleModel article;
  const ArticleBanner({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          CachedImage(
            url: article.thumbnail?.highRes.url ?? '',
            height: Config.y(220),
            width: double.infinity,
            radius: 4,
          ),
          Container(
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
                    CachedImage(
                      url: article.thumbnail?.lowRes.url ?? '',
                      height: 20,
                      width: 20,
                      radius: 4,
                    ),
                    Config.hGap5,
                    Text('${article.publisher} • 19h',
                        style: Config.textTheme.labelSmall
                            ?.copyWith(color: Colors.white)),
                  ],
                ),
                Config.vGap10,
                Text(article.title,
                    style: Config.textTheme.bodySmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
