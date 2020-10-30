import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'package:random_waifu/data/models/ApiModels/SavedInformation.dart';
import 'package:random_waifu/data/network/JikanApi.dart';
import 'package:random_waifu/data/network/KitsuApi.dart';
import 'package:random_waifu/data/repositories/JikanRepository.dart';
import 'package:random_waifu/data/repositories/KitsuRepository.dart';
import 'package:random_waifu/data/repositories/StorageRepository.dart';
import 'package:random_waifu/ui/bloc/DetailBloc/DetailBloc.dart';
import 'package:random_waifu/ui/bloc/DetailBloc/DetailState.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationBloc.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationState.dart';

void initKiwi() {
  kiwi.KiwiContainer()
    ..registerInstance(http.Client())
    ..registerFactory((c) => KitsuApi(c.resolve()))
    ..registerFactory((c) => JikanApi(c.resolve()))
    ..registerFactory((c) => KitsuRepository(c.resolve()))
    ..registerFactory((c) => JikanRepository(c.resolve()))
    ..registerFactory(
        (c) => InformationBloc(InformationState.loading(), c.resolve()))
    ..registerFactory((c) => DetailBloc(DetailState.loading(), c.resolve()));
}
