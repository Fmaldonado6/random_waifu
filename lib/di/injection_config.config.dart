// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:dio/src/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/database/dao/characters_dao.dart' as _i14;
import '../data/database/dao/today_dao.dart' as _i12;
import '../data/database/database.dart' as _i6;
import '../data/network/auth_service/auth_service.dart' as _i5;
import '../data/network/firebase/firebase_service.dart' as _i8;
import '../data/network/waifus/jikan_service.dart' as _i9;
import '../data/network/waifus/waifus_service.dart' as _i13;
import '../data/notifications/local_notifications.dart' as _i11;
import '../data/repositories/waifu_repository.dart' as _i4;
import '../ui/screens/detail/cubit/detail_cubit.dart' as _i3;
import 'injection_config.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<_i3.DetailCubit>(
      () => _i3.DetailCubit(get<_i4.WaifuRepository>()));
  gh.singleton<_i5.AuthService>(_i5.AuthService());
  gh.singleton<_i6.Database>(_i6.Database());
  gh.singleton<_i7.Dio>(networkModule.dio);
  gh.singleton<_i8.FirebaseService>(_i8.FirebaseService());
  gh.singleton<_i9.JikanService>(_i9.JikanService(get<_i10.Dio>()));
  gh.singleton<_i11.PushNotificationService>(_i11.PushNotificationService());
  gh.singleton<_i12.TodayDao>(_i12.TodayDao(get<_i6.Database>()));
  gh.singleton<_i13.WaifusService>(_i13.WaifusService(get<_i7.Dio>()));
  gh.singleton<_i14.CharactersDao>(_i14.CharactersDao(get<_i6.Database>()));
  gh.singleton<_i4.WaifuRepository>(_i4.WaifuRepository(
      get<_i14.CharactersDao>(),
      get<_i12.TodayDao>(),
      get<_i9.JikanService>(),
      get<_i13.WaifusService>()));
  return get;
}

class _$NetworkModule extends _i15.NetworkModule {}
