import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:network/src/network/constants.dart';
import 'package:network/src/network/di/injection.dart';
import 'package:network/src/network/disney_api_client.dart';
import 'package:network/src/network/marvel_api_client.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();
  @lazySingleton
  MarvelApiClient get restClient => MarvelApiClient(getIt<Dio>());

  @lazySingleton
  DisneyApiClient get disneyClient => DisneyApiClient(getIt<Dio>());
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