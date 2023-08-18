import 'package:flutter/material.dart';
import 'package:school_bills/app/view/widgets/article_banner.dart';
import 'package:school_bills/app/view/widgets/article_widget.dart';
import 'package:school_bills/core/utils/config.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: Config.contentPadding(
            h: 20, v: MediaQuery.viewPaddingOf(context).top + 20),
        separatorBuilder: (context, index) {
          if (index == 0) {
            return const SizedBox(height: 30);
          }
          return const Divider();
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const ArticleBanner();
          }
          return const ArticleWidget();
        },
      ),
    );
  }
}
