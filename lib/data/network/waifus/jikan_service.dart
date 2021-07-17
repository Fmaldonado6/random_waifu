import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/network/data_service.dart';
@Singleton()
class JikanService extends DataService {
  JikanService(Dio dio) : super("https://api.jikan.moe/v3/", dio);

  Future<Waifu> getWaifuInfo(int id) async {
    final res = await this.dio.get("${this.apiUrl}character/$id");
    return Waifu.fromJson(res.data);
  }
}