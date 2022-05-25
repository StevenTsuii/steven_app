import 'package:dartz/dartz.dart';
import 'package:steven_app/feature/article/domain/repositories/article_repository.dart';

import '../entites/article.dart';
import '../entites/failure.dart';

class GetArticleList {
  final ArticleRepository articleRepository;

  GetArticleList(this.articleRepository);

  Future<Either<Failure, List<Article>>> execute(String articleId) {
    return articleRepository.getArticleList();
  }
}
