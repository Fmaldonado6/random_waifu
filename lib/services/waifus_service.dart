import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:random_waifu/models/errors/errors.dart';
import 'package:random_waifu/models/models.dart';

class WaifusService {
  final http.Client client;

  final url = "https://fmaldonado6.github.io/files/waifus.json";

  List<JsonWaifu>? waifus;

  WaifusService(this.client);

  Future<JsonWaifu> getRandomWaifu() async {
    waifus = waifus != null ? waifus : await getWaifusList();

    final rng = new Random();

    final index = rng.nextInt(waifus!.length - 1);

    return waifus![index];
  }

  Future<List<JsonWaifu>> getWaifusList() async {
    final urlEncoded = Uri.encodeFull(url);
    final response = await client.get(Uri.parse(urlEncoded));
    if (response.statusCode != 200) throw new AppError();
    final json = jsonDecode(response.body) as List<dynamic>;
    final list = json.map((e) => JsonWaifu.fromJson(e)).toList();
    waifus = list;
    return list;
  }
}
