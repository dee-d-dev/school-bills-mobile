import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_bills/app/data/models/article_model.dart';

part 'generated/article_state.freezed.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState.idle() = _Idle;
  const factory ArticleState.loading() = _Loading;
  const factory ArticleState.empty() = _Empty;
  const factory ArticleState.loaded(List<ArticleModel> articles) = _Loaded;
  const factory ArticleState.error(String message) = _Error;
}
