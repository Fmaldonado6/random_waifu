import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/dao/characters_dao.dart';
import 'package:random_waifu/data/mapping/mapping.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/network/waifus/jikan_service.dart';
import 'package:random_waifu/data/network/waifus/waifus_service.dart';

@singleton
class WaifuRepository {
  CharactersDao _charactersDao;
  JikanService _jikanService;
  WaifusService _waifusService;

  WaifuRepository(
    this._charactersDao,
    this._jikanService,
    this._waifusService,
  );

  List<JsonWaifu>? _waifus;
  get waifus => getLocalWaifus();

  List<JsonWaifu>? _localWaifus;
  get localWaifus => getWaifus();

  Future updateWaifus(JsonWaifu waifu, int position) async {
    await _charactersDao.updateWaifu(
      Mapping.jsonWaifuToSavedCharacter(waifu),
      position,
    );
  }

  Future<Waifu> getWaifuInfo(int id) async {
    return await _jikanService.getWaifuInfo(id);
  }

  Future<List<JsonWaifu>> getWaifus() async {
    return _waifus ?? (_waifus = await _waifusService.getWaifuList());
  }

  Future<List<JsonWaifu>> getLocalWaifus() async {
    if (_localWaifus != null) return _localWaifus!;

    final savedWaifus = await _charactersDao.getWaifus();

    _localWaifus = Mapping.savedWaifuBoxToJsonWaifuList(savedWaifus);

    return _localWaifus!;
  }
}
