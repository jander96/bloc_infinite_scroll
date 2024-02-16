// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:network/network.dart' as _i3;

import '../../features/heros/data/datasource/disney_datasource_impl.dart'
    as _i5;
import '../../features/heros/data/datasource/hero_datasource_impl.dart' as _i10;
import '../../features/heros/data/repository/disney_repository_impl.dart'
    as _i7;
import '../../features/heros/data/repository/hero_repository_impl.dart' as _i12;
import '../../features/heros/domain/datasource/disney_datasource.dart' as _i4;
import '../../features/heros/domain/datasource/hero_datasource.dart' as _i9;
import '../../features/heros/domain/repository/disney_repository.dart' as _i6;
import '../../features/heros/domain/repository/hero_repository.dart' as _i11;
import '../../features/heros/presenter/bloc/hero_list_bloc.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.NetworkPackageModule().init(gh);
    gh.singleton<_i4.DisneyDatasource>(
        _i5.DisneyDataSourceImpl(gh<_i3.DisneyApiClient>()));
    gh.singleton<_i6.DisneyRepository>(
        _i7.DisneyRepositoryImpl(gh<_i4.DisneyDatasource>()));
    gh.factory<_i8.HeroBloc>(() => _i8.HeroBloc(gh<_i6.DisneyRepository>()));
    gh.singleton<_i9.HeroDatasource>(_i10.HeroDatasourceImpl(
      gh<_i3.MarvelApiClient>(),
      gh<_i3.DisneyApiClient>(),
    ));
    gh.singleton<_i11.HeroRepository>(
        _i12.HeroRepositoryImpl(gh<_i9.HeroDatasource>()));
    return this;
  }
}
