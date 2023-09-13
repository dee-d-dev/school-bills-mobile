import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/app/view/provider/article_provider.dart';
import 'package:school_bills/app/view/widgets/article_banner.dart';
import 'package:school_bills/app/view/widgets/article_widget.dart';
import 'package:school_bills/app/view/widgets/empty_widget.dart';
import 'package:school_bills/core/platform_specific/platform_progress_indicator.dart';
import 'package:school_bills/core/routes/routes.dart';
import 'package:school_bills/core/utils/config.dart';
import 'package:school_bills/core/widgets/custom_button.dart';

class ArticleScreen extends ConsumerStatefulWidget {
  const ArticleScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ArticleScreenState();
}

class ArticleScreenState extends ConsumerState<ArticleScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(articleProvider.notifier).getAllArticle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(articleProvider);

    return Scaffold(
      body: state.when(
        idle: () => const SizedBox.shrink(),
        loading: () => const Center(child: PlatformProgressIndicator()),
        loaded: (articles) {
          return ListView.separated(
            itemCount: articles.length,
            padding: Config.contentPadding(
                h: 20, v: MediaQuery.viewPaddingOf(context).top + 20),
            separatorBuilder: (context, index) {
              if (index == 0) {
                return const SizedBox(height: 30);
              }
              return const Divider();
            },
            itemBuilder: (context, index) {
              final article = articles[index];
              if (index == 0) {
                return ArticleBanner(article: article);
              }
              return GestureDetector(
                onTap: () => context.push(
                  Routes.browser,
                  extra: article.link,
                ),
                child: ArticleWidget(article: article),
              );
            },
          );
        },
        empty: () => const EmptyWidget(
          title: 'No articles found',
          subtitle: 'Check back later',
        ),
        error: (message) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, textAlign: TextAlign.center),
            Config.vGap15,
            CustomButton(
              hPadding: 20,
              text: 'Retry',
              onPressed: () =>
                  ref.read(articleProvider.notifier).getAllArticle(),
            )
          ],
        ),
      ),
    );
  }
}
