
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/network/constants.dart';
import 'package:network/src/network/domain/disney_char.dart';
import 'package:retrofit/http.dart';
part 'disney_api_client.g.dart';
@RestApi(baseUrl: '')
abstract class DisneyApiClient {
  @factoryMethod
  factory DisneyApiClient(Dio dio,{String baseUrl}) = _DisneyApiClient;

  @GET(DisneyApiConstants.characterPath)
  Future<DisneyResponse> getCharacters(@Query('pageSize') int limit, @Query('page') int offset);
}