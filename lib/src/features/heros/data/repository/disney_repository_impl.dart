import 'package:flutter_pagination_example/src/common/types/hero_types.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/datasource/disney_datasource.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/datasource/hero_datasource.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/repository/disney_repository.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/repository/hero_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DisneyRepository)
class DisneyRepositoryImpl extends DisneyRepository{
  final DisneyDatasource datasource;
  DisneyRepositoryImpl(this.datasource);
  @override
  Future<DisneyListEither> getChars(int limit, int offset)=>
      datasource.getDisneyList(limit, offset);
}