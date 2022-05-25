import 'package:dartz/dartz.dart';
import 'package:steven_app/feature/article/domain/entites/article.dart';
import 'package:steven_app/feature/article/domain/repositories/article_repository.dart';

import '../../domain/entites/failure.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  Future<Either<Failure, List<Article>>> getArticleList() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return const Right([
      Article(
          "ESPEON UNLEASHES ITS POWER IN POKÉMON UNITE",
          "Add some more psychic power to your team now that Espeon has arrived in Pokémon UNITE. For a limited time, you can acquire Espeon’s Unite license without spending Aeos gems through a special in-game Espeon event starting at midnight on May 16, 2022. Earn points by logging in, participating in and winning battles, and other in-game activities. You can then redeem Espeon’s Unite license once you’ve earned 2,000 points in this event. This special event ends June 12, 2022, at which point Espeon’s Unite license will be available at the Unite Battle Committee for 10,000 Aeos coins. You can also receive Espeon’s Unite license at any time by exchanging 575 Aeos gems at the Unite Battle Committee.",
          "https://unite.pokemon.com/images/news/articles/espeon-unleashes-its-power-in-pokemon-unite/cover-2x.jpg"),
      Article(
          "AZUMARILL OFFERS BUBBLE TROUBLE IN POKÉMON UNITE",
          "This Ranged Attacker is ready to take the battle to the opposition with a variety of mind-bending attacks. This Pokémon begins each match as Eevee, of course, and evolves into Espeon upon reaching Lv. 4. Eevee’s basic attack becomes a boosted attack with every third attack, dealing increased damage, while Espeon’s basic attack becomes a boosted attack after a set amount of time passes, causing Espeon to fire a beam in front of the itself. The beam deals increased damage to opposing Pokémon it hits and decreases their movement speed for a short time.",
          "https://unite.pokemon.com/images/news/articles/azumarill-offers-bubble-trouble-in-pokemon-unite/cover-2x.jpg"),
      Article(
          "POKÉMON UNITE GAME UPDATE 3/15",
          "Eevee starts with the Anticipation Ability, which negates any hindrance that would affect Eevee and causes it to become immune to hindrances for a short time. When Eevee evolves into Espeon, its Ability becomes Magic Bounce, which functions similarly to Anticipation when Espeon would be affected by a hindrance. On top of that, Magic Bounce also deals damage to the opposing Pokémon that attempted to inflict the hindrance on Espeon and temporarily decrease that Pokémon’s movement speed. Both Anticipation and Magic Bounce go on a short cooldown after they’re triggered.",
          "https://unite.pokemon.com/images/news/articles/pokemon-unite-patch-3-15/cover-2x.jpg"),
    ]);
  }
}
