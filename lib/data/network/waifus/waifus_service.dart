import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/network/data_service.dart';

@singleton
class WaifusService extends DataService {
  WaifusService(
    Dio dio,
  ) : super("https://fmaldonado6.github.io/files/waifus.json", dio);

  Future<List<JsonWaifu>> getWaifuList() async {
    final res = await this.dio.get(this.apiUrl);
    final json = res.data as List<dynamic>;
    return json.map((e) => JsonWaifu.fromJson(e)).toList();
  }
}
