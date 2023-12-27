import 'package:flutter_pagination_example/src/common/types/hero_types.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/datasource/hero_datasource.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/repository/hero_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HeroRepository)
class HeroRepositoryImpl extends HeroRepository{
  final HeroDatasource datasource;
  HeroRepositoryImpl(this.datasource);
  @override
  Future<HeroListEither> getHeroList(int limit, int offset)=>
      datasource.getHeroList(limit, offset);
}