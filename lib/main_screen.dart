import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steven_app/feature/article/data/repositories/ArticleRepositoryImpl.dart';
import 'package:steven_app/feature/article/domain/usecases/get_article_list.dart';
import 'package:steven_app/feature/article/presentation/bloc/article_bloc.dart';
import 'package:steven_app/feature/article/presentation/pages/article_list_page.dart';
import 'package:steven_app/feature/article/presentation/pages/gallery_page.dart';

import 'feature/book/domain/entities/book.dart';
import 'feature/book/presentation/bloc/book_bloc.dart';
import 'feature/book/presentation/pages/book_page.dart';

class MainPage extends StatefulWidget {
  static const valueKey = "MainPage";

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List _tabViews = [
    BlocProvider<ArticleBloc>(
      create: (context) => ArticleBloc(GetArticleList(ArticleRepositoryImpl()))
        ..add(LoadArticleListEvent()),
      child: const ArticleListPage(),
    ),
    const GalleryPage(),
    BlocProvider<BookBloc>(
      create: (context) =>
          BookBloc()..add(AddBookEvent(const Book("FirstBook", 123))),
      child: const BookPage(title: "BookPage"),
    ),
    BlocProvider<BookBloc>(
      create: (context) =>
          BookBloc()..add(AddBookEvent(const Book("FirstBook", 123))),
      child: const BookPage(title: "Settings"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text("Pokemon"),
            Text(
              "Unite",
              style: TextStyle(color: Colors.orangeAccent),
            ),
          ],
        ),
      ),
      body: _tabViews[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(context, _currentIndex),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(
      BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.blueGrey,
      onTap: (index) {
        _currentIndex = index;
        setState(() {});
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: "Hot"),
        BottomNavigationBarItem(
            icon: Icon(Icons.image), label: "Gallery"),
        BottomNavigationBarItem(icon: Icon(Icons.details), label: "Details"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      ],
    );
  }
}
