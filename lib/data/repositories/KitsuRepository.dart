import 'dart:math';

import 'package:hive/hive.dart';
import 'package:random_string/random_string.dart';
import 'package:random_waifu/data/models/ApiModels/KitsuCharacterInformation.dart';
import 'package:random_waifu/data/models/ApiModels/SavedCharacter.dart';
import 'package:random_waifu/data/network/KitsuApi.dart';

class KitsuRepository {
  KitsuApi _kitsuApi;
  Random _random = Random.secure();

  KitsuRepository(this._kitsuApi);

  Future<KitsuCharacterInformation> getRandomWaifu() async {
    var characterId = randomBetween(1, 105762);

    var characterInformation =
        await _kitsuApi.getApiResults(characterId: characterId);

    var isFemale = new RegExp(r'(?:^|\W)she(?:$|\W)')
        .allMatches(characterInformation.data.attributes.description);

    if (isFemale.length <= 3 ||
        characterInformation.data.attributes.image.original.isEmpty)
      return getRandomWaifu();
    else if (!characterExists(characterInformation.data.attributes.malId)) {
      final newCharacter = SavedCharacter(
          characterId: characterInformation.data.attributes.malId,
          imageUrl: characterInformation.data.attributes.image.original,
          name: characterInformation.data.attributes.name);

      Hive.box('savedCharacters').add(newCharacter);
    }
    return characterInformation;
  }

  bool characterExists(int id) {
    final characters = Hive.box('savedCharacters');

    for (var i = 0; i < characters.length; i++) {
      var character = characters.get(i) as SavedCharacter;

      if (character.characterId == id) return true;
    }

    return false;
  }
}
