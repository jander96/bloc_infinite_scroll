//@GeneratedMicroModule;NetworkPackageModule;package:network/src/network/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:dio/dio.dart' as _i3;
import 'package:injectable/injectable.dart' as _i1;
import 'package:network/src/network/dio.dart' as _i7;
import 'package:network/src/network/disney_api_client.dart' as _i5;
import 'package:network/src/network/enviroments/env.dart' as _i4;
import 'package:network/src/network/marvel_api_client.dart' as _i6;

const String _dev = 'dev';
const String _prod = 'prod';

class NetworkPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.singleton<_i4.Env>(
      _i4.Development(),
      registerFor: {_dev},
    );
    gh.singleton<_i4.Env>(
      _i4.Production(),
      registerFor: {_prod},
    );
    gh.factory<String>(
      () => registerModule.baseUrl(gh<_i4.Env>()),
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i5.DisneyApiClient>(() => registerModule.disneyClient(
          gh<String>(instanceName: 'baseUrl'),
          gh<_i3.Dio>(),
        ));
    gh.lazySingleton<_i6.MarvelApiClient>(() => registerModule.restClient(
          gh<String>(instanceName: 'baseUrl'),
          gh<_i3.Dio>(),
        ));
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
