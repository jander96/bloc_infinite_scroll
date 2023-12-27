// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/heros/data/datasource/hero_datasource_impl.dart' as _i6;
import '../../features/heros/data/repository/hero_repository_impl.dart' as _i8;
import '../../features/heros/domain/datasource/hero_datasource.dart' as _i5;
import '../../features/heros/domain/repository/hero_repository.dart' as _i7;
import '../../features/heros/presenter/bloc/hero_list_bloc.dart' as _i9;
import '../data/network/dio.dart' as _i10;
import '../data/network/marvel_api_client.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.MarvelApiClient>(() => registerModule.restClient);
    gh.singleton<_i5.HeroDatasource>(
        _i6.HeroDatasourceImpl(gh<_i4.MarvelApiClient>()));
    gh.singleton<_i7.HeroRepository>(
        _i8.HeroRepositoryImpl(gh<_i5.HeroDatasource>()));
    gh.factory<_i9.HeroBloc>(() => _i9.HeroBloc(gh<_i7.HeroRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
