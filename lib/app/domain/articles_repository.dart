import 'package:school_bills/app/data/models/article_model.dart';
import 'package:school_bills/app/data/models/result.dart';

abstract class ArticleRepository {
  Future<Result<List<ArticleModel>>> getAllArticles();
}
