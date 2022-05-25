import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:steven_app/feature/article/domain/entites/article.dart';
import 'package:steven_app/feature/article/domain/usecases/get_article_list.dart';

part 'article_event.dart';

part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticleList getArticleList;

  ArticleBloc(this.getArticleList) : super(ArticleInitial()) {
    on<LoadArticleListEvent>((event, emit) async {
      emit(ArticleLoadingState());
      final result = await getArticleList.execute("articleId");
      result.fold((l) => {emit(ArticleListErrorState())},
          (r) => {emit(ShowArticleListState(r))});
    });
    on<RefreshArticleListEvent>((event, emit) async {
      emit(ArticleLoadingState());
      final result = await getArticleList.execute("articleId");
      result.fold((l) => {emit(ArticleListErrorState())},
          (r) => {emit(ShowArticleListState(r))});
    });
  }
}
