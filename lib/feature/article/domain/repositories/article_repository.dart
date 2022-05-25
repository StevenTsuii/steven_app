import 'package:dartz/dartz.dart';

import '../entites/article.dart';
import '../entites/failure.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getArticleList();
}
