import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steven_app/feature/article/data/repositories/ArticleRepositoryImpl.dart';
import 'package:steven_app/feature/article/domain/usecases/get_article_list.dart';
import 'package:steven_app/feature/article/presentation/pages/article_detail_page.dart';
import 'package:steven_app/main_screen.dart';

import 'feature/article/presentation/bloc/article_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // Define the default brightness and colors.
          // brightness: Brightness.dark,
          primaryColor: Colors.blue,
          // primarySwatch: Colors.blueGrey,

          // fontFamily: 'Georgia',

          // textTheme: const TextTheme(
          //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          // ),
        ),
        // home: const MainPage(),
        home: Navigator(
          pages: [
            const MaterialPage(
                key: ValueKey(MainPage.valueKey), child: MainPage()),
            MaterialPage(
                key: const ValueKey(ArticleDetailPage.valueKey),
                child: BlocProvider(
                  create: (context) =>
                      ArticleBloc(GetArticleList(ArticleRepositoryImpl())),
                  child: const ArticleDetailPage(),
                )),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ));
  }
}
