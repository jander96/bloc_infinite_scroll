import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:network/src/network/constants.dart';
import 'package:network/src/network/di/injection.dart';
import 'package:network/src/network/disney_api_client.dart';
import 'package:network/src/network/enviroments/env.dart';
import 'package:network/src/network/marvel_api_client.dart';

@module
abstract class RegisterModule {

  @lazySingleton
  Dio get dio => Dio();
  @injectable
  @Named('baseUrl')
  String baseUrl(Env env) => env.baseUrl;

  @lazySingleton
  MarvelApiClient restClient(@Named('baseUrl') String baseUrl,Dio dio) =>
      MarvelApiClient(dio,baseUrl: baseUrl );

  @lazySingleton
  DisneyApiClient  disneyClient(@Named('baseUrl') String baseUrl,Dio dio) =>
      DisneyApiClient(dio,baseUrl: baseUrl);
}



class MyInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final ts = DateTime.timestamp().toString();
    final hash =  crypto.md5.convert(
        utf8.encode("$ts${ApiConstants.privateKey}${ApiConstants.publicKey}")
    ).toString();

    options.queryParameters.addAll({
      'apikey': ApiConstants.publicKey,
      'ts': ts,
      'hash': hash
    });
    return super.onRequest(options, handler);
  }
}