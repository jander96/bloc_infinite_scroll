import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pagination_example/src/common/data/network/marvel_api_client.dart';
import 'package:flutter_pagination_example/src/common/data/network/network_errors/network_errors.dart';
import 'package:flutter_pagination_example/src/common/types/hero_types.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/datasource/hero_datasource.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HeroDatasource)
class HeroDatasourceImpl implements HeroDatasource{
  final MarvelApiClient marvelApiClient;

  HeroDatasourceImpl(this.marvelApiClient);
  @override
  Future<HeroListEither> getHeroList(int limit, int offset) async {
    try{
      final response = await marvelApiClient.getHeroList(limit, offset);
      return right(response.data.results);
    }catch(e){
      final error = switch(e.runtimeType){
        DioException.connectionError => ConnectionError(),
        SocketException => ConnectionError(),
        DioException =>
            NetworkError.fromStatusCode(
                (e as DioException).response?.statusCode ?? 409),
        _ => UnKnow()
      };
      return left(error);
    }
  }

}