import 'package:dio/src/dio.dart';
import 'package:random_waifu/data/network/data_service.dart';
import 'package:random_waifu/models/models.dart';

class JikanService extends DataService {
  JikanService(Dio dio) : super("https://api.jikan.moe/v3/", dio);

  Future<Waifu> getWaifuInfo(int id) async {
    final res = await this.dio.get("${this.apiUrl}character/$id");
    return Waifu.fromJson(res.data);
  }
}
