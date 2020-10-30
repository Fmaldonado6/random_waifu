import 'package:http/http.dart' as http;
import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';
import 'package:random_waifu/data/models/errors/JikanSearchError.dart';

class JikanApi {
  final http.Client client;
  final String _baseUrl = 'https://api.jikan.moe/v3/';

  JikanApi(this.client);

  Future<CharacterInformation> getCharacterInformation(int characterId) async {
    final urlRaw = '${_baseUrl}character/$characterId';

    final urlEncoded = Uri.encodeFull(urlRaw);

    final response = await client.get(urlEncoded);

    if (response.statusCode == 200) return CharacterInformation.fromJson(response.body);

    throw new JikanCharacterError();
  }
}
