import 'package:my_app/models/heroes_model.dart';

abstract class IHeroesRepo {
  Future<HeroesModel> getHeroes();
}
