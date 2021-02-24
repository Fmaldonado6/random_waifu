import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'package:random_waifu/services/AuthService.dart';
import 'package:random_waifu/services/DatabaseService.dart';
import 'package:random_waifu/services/JikanService.dart';
import 'package:random_waifu/services/PushNotificationService.dart';
import 'package:random_waifu/services/waifusService.dart';
import 'package:random_waifu/ui/bloc/DetailBloc/DetailCubit.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationCubit.dart';
import 'package:random_waifu/ui/bloc/authCubit/auth_cubit.dart';

void initKiwi() {
  kiwi.KiwiContainer()
    ..registerInstance(http.Client())
    ..registerSingleton((container) => PushNotificationService())
    ..registerSingleton((container) => AuthService())
    ..registerSingleton((container) => DatabaseService())
    ..registerFactory((c) => JikanService(c.resolve()))
    ..registerFactory((c) => WaifusService())
    ..registerFactory((c) => AuthCubit(c.resolve(), c.resolve()))
    ..registerFactory((c) => InformationCubit(c.resolve(), c.resolve()))
    ..registerFactory((c) => DetailCubit(c.resolve()));
}
