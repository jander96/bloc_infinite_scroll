
import 'package:dio/dio.dart';
import 'package:flutter_pagination_example/src/common/domain/hero.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'marvel_api_client.g.dart';
@RestApi(baseUrl: 'https://gateway.marvel.com:443/v1/public/')
abstract class MarvelApiClient {
  @factoryMethod
  factory MarvelApiClient(Dio dio,{String baseUrl}) = _MarvelApiClient;
  
  @GET('characters')
  Future<ApiResponse> getHeroList(@Query('limit') int limit, @Query('offset') int offset);
}