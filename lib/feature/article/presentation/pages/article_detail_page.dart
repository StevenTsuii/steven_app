import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steven_app/feature/article/presentation/bloc/article_bloc.dart';

class ArticleDetailPage extends StatelessWidget {
  static const valueKey = "ArticleDetailPage";

  const ArticleDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ArticleDetail"),
      ),
      body: SafeArea(
        child: BlocConsumer<ArticleBloc, ArticleState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                              "https://unite.pokemon.com/images/news/articles/pokemon-unite-goes-full-fury-for-pokemon-day/cover-2x.jpg"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Pokémon Day happens just once a year on February 27, but fortunately, Pokémon UNITE’s Pokémon Day event will be celebrating your love of Pokémon for over two weeks! From February 24 to April 11, 2022, Pokémon UNITE will be upping its game with special log-in bonuses and a thrilling new type of quick battle—full-fury battles.\n\nBattle to the max in these new full-fury battles, available on Saturdays, Sundays, and Mondays throughout the Pokémon Day event and beyond. Full-fury battles offer shorter waiting times before diving into the heat of battle, and the battles themselves are flashier, with moves being easier to string together than ever before. These fast, frenzied battles feature shorter cooldowns, shorter recovery times after being knocked out, increased Aeos energy from knocking out opposing Pokémon, and much more. This is also the perfect opportunity to battle using Pokémon you haven’t tried yet, because on special days throughout the event, all Pokémon will be available to play at no cost in all battles except ranked matches.\n\nLook your best while battling by receiving Trainer fashion items just for logging in to Pokémon UNITE during the Pokémon Day event. The first day you log in during the event, your Trainer can receive a T-shirt featuring a Pokémon Day logo, and on the second day you log in during the event, your Trainer can receive a matching cap to go with it.\n\nHappy Pokémon Day!",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        )
                      ]),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
