import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/network/data_service.dart';

@Singleton()
class JikanService extends DataService {
  JikanService(Dio dio) : super("https://api.jikan.moe/v4/", dio);

  Future<Waifu> getWaifuInfo(int id) async {
    final res = await this.dio.get("${this.apiUrl}characters/$id");
    return Waifu.fromJson(res.data["data"]);
  }

  Future<List<Anime>> getWaifuAnime(int id) async {
    final res = await this.dio.get("${this.apiUrl}characters/$id/anime");
    final list = res.data["data"] as List;
    return list.map((e) => Anime.fromJson(e)).toList();
  }

  Future<List<Manga>> getWaifuManga(int id) async {
    final res = await this.dio.get("${this.apiUrl}characters/$id/manga");
    final list = res.data["data"] as List;
    return list.map((e) => Manga.fromJson(e)).toList();
  }

  Future<List<VoiceActressInformation>> getWaifuVoiceActresses(int id) async {
    final res = await this.dio.get("${this.apiUrl}characters/$id/voices");
    final list = res.data["data"] as List;
    return list.map((e) => VoiceActressInformation.fromJson(e)).toList();
  }
}
