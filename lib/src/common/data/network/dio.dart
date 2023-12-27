import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pagination_example/src/common/data/network/constants.dart';
import 'package:flutter_pagination_example/src/common/data/network/marvel_api_client.dart';
import 'package:flutter_pagination_example/src/common/di/dependency_injection.dart';
import 'package:injectable/injectable.dart';
import 'package:crypto/crypto.dart' as crypto;

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio()..interceptors.add(MyInterceptor());
  @lazySingleton
  MarvelApiClient get restClient => MarvelApiClient(getIt<Dio>());
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