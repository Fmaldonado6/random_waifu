import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/dao/characters_dao.dart';
import 'package:random_waifu/data/database/dao/today_dao.dart';
import 'package:random_waifu/data/mapping/mapping.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/network/waifus/jikan_service.dart';
import 'package:random_waifu/data/network/waifus/waifus_service.dart';

@singleton
class WaifuRepository {
  CharactersDao _charactersDao;
  TodayDao _todayDao;
  JikanService _jikanService;
  WaifusService _waifusService;

  WaifuRepository(
    this._charactersDao,
    this._todayDao,
    this._jikanService,
    this._waifusService,
  );

  List<JsonWaifu>? _waifus;
  Future<List<JsonWaifu>> get waifus async => await getWaifus();

  List<JsonWaifu>? _localWaifus;
  Future<List<JsonWaifu>> get localWaifus async => await getLocalWaifus();

  Future init() async {
    await this._charactersDao.database.init();
  }

  Future updateWaifus(JsonWaifu waifu, int position) async {
    (await this.localWaifus)[position] = waifu;
    await _charactersDao.updateWaifu(
      Mapping.jsonWaifuToSavedCharacter(waifu),
      position,
    );
  }

  Future updateWaifuByValue(JsonWaifu waifu) async {
    final local = await this.localWaifus;
    final position =
        local.indexWhere((element) => element.malId == waifu.malId);

    _localWaifus![position] = waifu;

    await _charactersDao
        .updateWaifuByValue(Mapping.jsonWaifuToSavedCharacter(waifu));
  }

  Future clearWaifu() async {
    await _charactersDao.deleteAll();
    _localWaifus?.clear();
  }

  Future addWaifu(JsonWaifu waifu) async {
    await _charactersDao.saveWaifu(Mapping.jsonWaifuToSavedCharacter(waifu));
    _localWaifus?.add(waifu);
  }

  Future<Waifu> getWaifuInfo(int id) async {
    await Future.delayed(Duration(seconds: 1));
    final waifu = await _jikanService.getWaifuInfo(id);
    final seiyus = await _jikanService.getWaifuVoiceActresses(id);
    final animes = await _jikanService.getWaifuAnime(id);
    await Future.delayed(Duration(seconds: 1));
    final mangas = await _jikanService.getWaifuManga(id);

    waifu.mangaography = mangas;
    waifu.animeography = animes;
    waifu.voiceActors = seiyus;

    return waifu;
  }

  Future<List<JsonWaifu>> getWaifus() async {
    return _waifus ?? (_waifus = await _waifusService.getWaifuList());
  }

  Future<int?> getLastWaifuDate() async {
    return await this._todayDao.getToday();
  }

  Future removeWaifu(int position) async {
    _localWaifus?.removeAt(position);
    await _charactersDao.deleteWaifu(position);
  }

  Future<List<JsonWaifu>> getLocalWaifus() async {
    if (_localWaifus != null) return _localWaifus!;

    final savedWaifus = await _charactersDao.getWaifus();

    _localWaifus = Mapping.savedWaifuBoxToJsonWaifuList(savedWaifus);

    return _localWaifus!;
  }

  Future resetDay() async {
    await this._todayDao.addToday(DateTime.now());
  }

  Future clearDay() async {
    await this._todayDao.clear();
  }

  Future<bool> characterExists(int malId) async {
    return await this._charactersDao.characterExists(malId);
  }

  Future removeWaifuByValue(JsonWaifu waifu) async {
    _localWaifus?.removeWhere((element) => element.malId == waifu.malId);
    await _charactersDao
        .removeWaifuByValue(Mapping.jsonWaifuToSavedCharacter(waifu));
  }

  Future updateWaifusInfo() async {
    final local = await localWaifus;
    final network = await waifus;
    final map = Map<int, JsonWaifu>.fromIterable(network, key: (e) => e.malId);

    for (var i = 0; i < local.length; i++) {
      final waifu = _localWaifus![i];
      final mapElement = map[waifu.malId];

      if (waifu.anime?.name != null ||
          waifu.manga?.name != null ||
          waifu.anime != null ||
          waifu.manga != null ||
          mapElement == null) continue;
      waifu.manga = mapElement.manga;
      waifu.anime = mapElement.anime;
      await updateWaifus(waifu, i);
    }
  }
}
