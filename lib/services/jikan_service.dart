import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_waifu/models/errors/errors.dart';
import 'package:random_waifu/models/models.dart';

class JikanService {
  final http.Client client;
  final String _baseUrl = 'https://api.jikan.moe/v3/';

  JikanService(this.client);

  Future<Waifu> getCharacterInformation(int characterId) async {
    final urlRaw = '${_baseUrl}character/$characterId';

    final urlEncoded = Uri.encodeFull(urlRaw);

    final response = await client.get(Uri.parse(urlEncoded));
    if (response.statusCode == 200)
      return Waifu.fromJson(jsonDecode(response.body));

    throw new AppError();
  }
}
