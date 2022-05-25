part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {}

class LoadArticleListEvent extends ArticleEvent {}

class RefreshArticleListEvent extends ArticleEvent {}
