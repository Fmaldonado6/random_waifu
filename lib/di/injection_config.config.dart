// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/database/dao/characters_dao.dart' as _i12;
import '../data/database/dao/today_dao.dart' as _i10;
import '../data/database/database.dart' as _i4;
import '../data/network/auth_service/auth_service.dart' as _i3;
import '../data/network/firebase/firebase_service.dart' as _i6;
import '../data/network/waifus/jikan_service.dart' as _i7;
import '../data/network/waifus/waifus_service.dart' as _i11;
import '../data/notifications/local_notifications.dart' as _i9;
import '../data/preferences/preferences.dart' as _i8;
import '../data/repositories/waifu_repository.dart' as _i13;
import '../ui/screens/cloud/cubit/cloud_cubit.dart' as _i14;
import '../ui/screens/collection/cubit/collection_cubit.dart' as _i15;
import '../ui/screens/detail/cubit/detail_cubit.dart' as _i16;
import '../ui/screens/home/cubit/home_cubit.dart' as _i17;
import 'injection_config.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<_i3.AuthService>(() => _i3.AuthService());
  gh.singleton<_i4.Database>(_i4.Database());
  gh.singleton<_i5.Dio>(networkModule.dio);
  gh.factory<_i6.FirebaseService>(() => _i6.FirebaseService());
  gh.singleton<_i7.JikanService>(_i7.JikanService(get<_i5.Dio>()));
  gh.singleton<_i8.Preferences>(_i8.Preferences());
  gh.singleton<_i9.PushNotificationService>(_i9.PushNotificationService());
  gh.singleton<_i10.TodayDao>(_i10.TodayDao(get<_i4.Database>()));
  gh.singleton<_i11.WaifusService>(_i11.WaifusService(get<_i5.Dio>()));
  gh.singleton<_i12.CharactersDao>(_i12.CharactersDao(get<_i4.Database>()));
  gh.singleton<_i13.WaifuRepository>(_i13.WaifuRepository(
      get<_i12.CharactersDao>(),
      get<_i10.TodayDao>(),
      get<_i7.JikanService>(),
      get<_i11.WaifusService>()));
  gh.factory<_i14.CloudCubit>(() => _i14.CloudCubit(
      get<_i3.AuthService>(),
      get<_i6.FirebaseService>(),
      get<_i13.WaifuRepository>(),
      get<_i8.Preferences>()));
  gh.factory<_i15.CollectionCubit>(
      () => _i15.CollectionCubit(get<_i13.WaifuRepository>()));
  gh.factory<_i16.DetailCubit>(
      () => _i16.DetailCubit(get<_i13.WaifuRepository>()));
  gh.factory<_i17.HomeCubit>(() => _i17.HomeCubit(
      get<_i13.WaifuRepository>(),
      get<_i8.Preferences>(),
      get<_i3.AuthService>(),
      get<_i6.FirebaseService>()));
  return get;
}

class _$NetworkModule extends _i18.NetworkModule {}
