import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entites/article.dart';
import '../bloc/article_bloc.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleBloc, ArticleState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Stack(children: [
            state is ShowArticleListState
                ? ListView.builder(
                    itemCount: state.articleList.length,
                    itemBuilder: (BuildContext context, index) {
                      return _buildCard(state.articleList[index]);
                    },
                  )
                : const SizedBox.shrink(),
            state is ArticleLoadingState
                ? _buildLoading()
                : const SizedBox.shrink(),
            state is ShowArticleListState
                ? _buildFloatingActionButton(context)
                : const SizedBox.shrink(),
          ]),
        );
      },
    );
  }

  Center _buildLoading() => const Center(child: CircularProgressIndicator());

  Positioned _buildFloatingActionButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ArticleBloc>(context)
                .add(RefreshArticleListEvent());
          },
          tooltip: 'Search',
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }

  Padding _buildCard(Article article) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 20,
          clipBehavior: Clip.antiAlias,
          color: Colors.grey[300],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(article.coverImage),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  article.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 17, color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                child: Text(
                  article.subtitle,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
