// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/database/dao/characters_dao.dart' as _i6;
import '../data/database/dao/today_dao.dart' as _i5;
import '../data/database/database.dart' as _i3;
import 'injection_config.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.Database>(_i3.Database());
  gh.singleton<_i4.Dio>(networkModule.dio);
  gh.singleton<_i5.TodayDao>(_i5.TodayDao(get<_i3.Database>()));
  gh.singleton<_i6.CharactersDao>(_i6.CharactersDao(get<_i3.Database>()));
  return get;
}

class _$NetworkModule extends _i7.NetworkModule {}
