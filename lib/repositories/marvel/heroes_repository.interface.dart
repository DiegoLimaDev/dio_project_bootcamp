import 'package:my_app/models/heroes_model.dart';

abstract class IHeroesRepo {
  Future<List<HeroesModel>> getHeroes(int offset);
}
