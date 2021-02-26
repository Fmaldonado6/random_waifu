import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'package:random_waifu/repositories/local_database_repository.dart';
import 'package:random_waifu/screens/cloud/cubit/cloud_cubit.dart';
import 'package:random_waifu/screens/collection/cubit/collection_cubit.dart';
import 'package:random_waifu/screens/detail/cubit/detail_cubit.dart';
import 'package:random_waifu/screens/home/cubit/home_cubit.dart';
import 'package:random_waifu/services/auth_service.dart';
import 'package:random_waifu/services/database_service.dart';
import 'package:random_waifu/services/jikan_service.dart';
import 'package:random_waifu/services/push_notification_service.dart';
import 'package:random_waifu/services/waifus_service.dart';

void initKiwi() {
  kiwi.KiwiContainer()
    ..registerInstance(http.Client())
    ..registerSingleton((container) => PushNotificationService())
    ..registerSingleton((container) => AuthService())
    ..registerSingleton((container) => DatabaseService())
    ..registerSingleton((container) => DatabaseRepository())
    ..registerFactory((c) => JikanService(c.resolve()))
    ..registerFactory((c) => WaifusService(c.resolve()))
    ..registerFactory((c) => CloudCubit(c.resolve(), c.resolve(), c.resolve()))
    ..registerFactory((c) => HomeCubit(c.resolve(), c.resolve(), c.resolve()))
    ..registerFactory((c) => CollectionCubit(c.resolve()))
    ..registerFactory((c) => DetailCubit(c.resolve()));
}
