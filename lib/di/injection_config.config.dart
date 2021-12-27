// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/database/dao/characters_dao.dart' as _i17;
import '../data/database/dao/today_dao.dart' as _i15;
import '../data/database/database.dart' as _i11;
import '../data/network/auth_service/auth_service.dart' as _i3;
import '../data/network/firebase/firebase_service.dart' as _i4;
import '../data/network/waifus/jikan_service.dart' as _i13;
import '../data/network/waifus/waifus_service.dart' as _i16;
import '../data/notifications/local_notifications.dart' as _i14;
import '../data/preferences/preferences.dart' as _i7;
import '../data/repositories/waifu_repository.dart' as _i6;
import '../ui/screens/cloud/cubit/cloud_cubit.dart' as _i5;
import '../ui/screens/collection/cubit/collection_cubit.dart' as _i8;
import '../ui/screens/detail/cubit/detail_cubit.dart' as _i9;
import '../ui/screens/home/cubit/home_cubit.dart' as _i10;
import 'injection_config.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<_i3.AuthService>(() => _i3.AuthService());
  gh.factory<_i4.FirebaseService>(() => _i4.FirebaseService());
  gh.factory<_i5.CloudCubit>(() => _i5.CloudCubit(
      get<_i3.AuthService>(),
      get<_i4.FirebaseService>(),
      get<_i6.WaifuRepository>(),
      get<_i7.Preferences>()));
  gh.factory<_i8.CollectionCubit>(
      () => _i8.CollectionCubit(get<_i6.WaifuRepository>()));
  gh.factory<_i9.DetailCubit>(
      () => _i9.DetailCubit(get<_i6.WaifuRepository>()));
  gh.factory<_i10.HomeCubit>(() => _i10.HomeCubit(
      get<_i6.WaifuRepository>(),
      get<_i7.Preferences>(),
      get<_i3.AuthService>(),
      get<_i4.FirebaseService>()));
  gh.singleton<_i11.Database>(_i11.Database());
  gh.singleton<_i12.Dio>(networkModule.dio);
  gh.singleton<_i13.JikanService>(_i13.JikanService(get<_i12.Dio>()));
  gh.singleton<_i7.Preferences>(_i7.Preferences());
  gh.singleton<_i14.PushNotificationService>(_i14.PushNotificationService());
  gh.singleton<_i15.TodayDao>(_i15.TodayDao(get<_i11.Database>()));
  gh.singleton<_i16.WaifusService>(_i16.WaifusService(get<_i12.Dio>()));
  gh.singleton<_i17.CharactersDao>(_i17.CharactersDao(get<_i11.Database>()));
  gh.singleton<_i6.WaifuRepository>(_i6.WaifuRepository(
      get<_i17.CharactersDao>(),
      get<_i15.TodayDao>(),
      get<_i13.JikanService>(),
      get<_i16.WaifusService>()));
  return get;
}

class _$NetworkModule extends _i18.NetworkModule {}
