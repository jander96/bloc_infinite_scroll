import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:flutter_pagination_example/src/common/types/hero_types.dart';
import 'package:flutter_pagination_example/src/features/heros/domain/datasource/hero_datasource.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HeroDatasource)
class HeroDatasourceImpl implements HeroDatasource{
  final MarvelApiClient marvelApiClient;
  final DisneyApiClient disneyApiClient;

  HeroDatasourceImpl(this.marvelApiClient, this.disneyApiClient);
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

  @override
  Future<DisneyListEither> getDisneyList(int limit, int offset) async {
    try{
      final response = await disneyApiClient.getCharacters(limit, offset);
      return right(response.chars);
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