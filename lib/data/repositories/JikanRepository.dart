import 'dart:math';

import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';
import 'package:random_waifu/data/network/JikanApi.dart';

class JikanRepository {
  final JikanApi _jikanApi;

  JikanRepository(this._jikanApi);

  Future<CharacterInformation> getCharacterInformation(int characterId) async {
    var characterInformation = await _jikanApi.getCharacterInformation(characterId);

    return characterInformation;
  }
}
