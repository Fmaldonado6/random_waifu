import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:random_waifu/models/errors/errors.dart';
import 'package:random_waifu/models/models.dart';

class WaifusService {
  final http.Client client;

  final url = "https://fmaldonado6.github.io/files/waifus.json";

  WaifusService(this.client);

  Future<JsonWaifu> getRandomWaifu() async {
    final urlEncoded = Uri.encodeFull(url);

    final response = await client.get(Uri.parse(urlEncoded));
    if (response.statusCode != 200) throw new AppError();

    final json = jsonDecode(response.body) as List<Object>;
    final list = json.map((e) => JsonWaifu.fromJson(e)).toList();

    final rng = new Random();

    final index = rng.nextInt(list.length - 1);

    return list[index];
  }
}
