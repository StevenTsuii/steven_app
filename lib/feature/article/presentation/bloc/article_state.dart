part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ShowArticleListState extends ArticleState {
  final List<Article> articleList;

  ShowArticleListState(this.articleList);
}

class ArticleListErrorState extends ArticleState {}
