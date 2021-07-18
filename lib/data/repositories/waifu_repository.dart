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
    await _charactersDao.updateWaifu(
      Mapping.jsonWaifuToSavedCharacter(waifu),
      position,
    );
  }

  Future updateWaifuByValue(JsonWaifu waifu) async {
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
    return await _jikanService.getWaifuInfo(id);
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

  Future<bool> characterExists(int malId) async {
    return await this._charactersDao.characterExists(malId);
  }
}
