// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/heros/data/datasource/disney_datasource_impl.dart'
    as _i4;
import '../../features/heros/data/datasource/hero_datasource_impl.dart' as _i9;
import '../../features/heros/data/repository/disney_repository_impl.dart'
    as _i6;
import '../../features/heros/data/repository/hero_repository_impl.dart' as _i11;
import '../../features/heros/domain/datasource/disney_datasource.dart' as _i3;
import '../../features/heros/domain/datasource/hero_datasource.dart' as _i8;
import '../../features/heros/domain/repository/disney_repository.dart' as _i5;
import '../../features/heros/domain/repository/hero_repository.dart' as _i10;
import '../../features/heros/presenter/bloc/hero_list_bloc.dart' as _i7;

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
    gh.singleton<_i3.DisneyDatasource>(
        _i4.DisneyDataSourceImpl(gh<InvalidType>()));
    gh.singleton<_i5.DisneyRepository>(
        _i6.DisneyRepositoryImpl(gh<_i3.DisneyDatasource>()));
    gh.factory<_i7.HeroBloc>(() => _i7.HeroBloc(gh<_i5.DisneyRepository>()));
    gh.singleton<_i8.HeroDatasource>(_i9.HeroDatasourceImpl(
      gh<InvalidType>(),
      gh<InvalidType>(),
    ));
    gh.singleton<_i10.HeroRepository>(
        _i11.HeroRepositoryImpl(gh<_i8.HeroDatasource>()));
    return this;
  }
}
