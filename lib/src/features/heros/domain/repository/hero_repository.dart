import 'package:flutter_pagination_example/src/common/types/hero_types.dart';

abstract class HeroRepository{
  Future<HeroListEither> getHeroList(int limit, int offset);
}