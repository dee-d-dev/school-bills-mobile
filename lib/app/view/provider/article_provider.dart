import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bills/app/domain/articles_repository.dart';
import 'package:school_bills/app/view/provider/article_state.dart';
import 'package:school_bills/core/di/service_locator.dart';

final articleProvider = NotifierProvider<ArticleProvider, ArticleState>(
  () => sl<ArticleProvider>(),
);

final class ArticleProvider extends Notifier<ArticleState> {
  final ArticleRepository articleRepository;
  ArticleProvider({required this.articleRepository});

  @override
  ArticleState build() => const ArticleState.idle();

  Future<bool> getAllArticle() async {
    state = const ArticleState.loading();
    final res = await articleRepository.getAllArticles();
    return res.when(
      success: (articles) {
        state = articles.isEmpty
            ? const ArticleState.empty()
            : ArticleState.loaded(articles);
        return true;
      },
      error: (error) {
        state = ArticleState.error(error.message);
        return false;
      },
    );
  }
}
