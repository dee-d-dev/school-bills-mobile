import 'package:flutter/cupertino.dart';
import 'package:school_bills/app/data/models/article_model.dart';
import 'package:school_bills/app/data/models/result.dart';
import 'package:school_bills/app/domain/articles_repository.dart';
import 'package:school_bills/core/services/network_service/network_service.dart';

final class ArticleRepositoryImpl implements ArticleRepository {
  final NetworkService networkService;

  const ArticleRepositoryImpl({required this.networkService});

  @override
  Future<Result<List<ArticleModel>>> getAllArticles() async {
    try {
      final res = await networkService.get('/articles/all');

      final articles = (res.data['data'] as List)
          .map((e) => ArticleModel.fromJson(e))
          .toList();

      return Result.success(articles);
    } on CustomError catch (error) {
      debugPrint('$error');
      return Result.error(error);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Failed to get all articles'));
    }
  }
}
