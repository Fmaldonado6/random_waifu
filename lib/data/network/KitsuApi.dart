import 'package:http/http.dart' as http;
import 'package:random_waifu/data/models/ApiModels/KitsuCharacterInformation.dart';
import 'package:random_waifu/data/models/errors/KitsuSearchError.dart';

class KitsuApi {
  final http.Client client;
  final String _baseUrl = 'https://kitsu.io/api/edge/';

  KitsuApi(this.client);

  Future<KitsuCharacterInformation> getApiResults({int characterId}) async {
    final urlRaw = '${_baseUrl}characters/$characterId';
    print("Search url: $urlRaw");

    final urlEncoded = Uri.encodeFull(urlRaw);

    final response = await client.get(urlEncoded);


    if (response.statusCode == 200) return KitsuCharacterInformation.fromJson(response.body);

    throw new KitsuSearchError();
  }


}
