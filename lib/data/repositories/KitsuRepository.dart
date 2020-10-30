import 'dart:collection';
import 'dart:math';

import 'package:hive/hive.dart';
import 'package:random_string/random_string.dart';
import 'package:random_waifu/data/characterList/CharacterList.dart';
import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';
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

    if (!isFemale(characterInformation))
      return getRandomWaifu();
    else {
      if (!characterExists(characterInformation.data.attributes.malId)) {
        final newCharacter = SavedCharacter(
            characterId: characterInformation.data.attributes.malId,
            imageUrl: characterInformation.data.attributes.image.original,
            name: characterInformation.data.attributes.name,
            data: characterInformation.data);

        print("New character: ${newCharacter.name}");

        await Hive.box('savedCharacters').add(newCharacter);
        await Hive.box('today').clear();
        await Hive.box('today').add(DateTime.now().day);
      }
      return characterInformation;
    }
  }

  bool characterExists(int id) {
    final characters = Hive.box('savedCharacters');
    print("Waifus exist: ${characters.length}");

    for (var i = 0; i < characters.length; i++) {
      var character = characters.getAt(i) as SavedCharacter;
      print(character);

      if (character.characterId == id) return true;
    }

    return false;
  }

  KitsuCharacterInformation loadLastWaifu() {
    var waifus = Hive.box('savedCharacters');
    print("Waifus: ${waifus.length}");

    var characterInformation = KitsuCharacterInformation((b) => b
      ..data.attributes.name = waifus.getAt(waifus.length - 1).name
      ..data.attributes.malId = waifus.getAt(waifus.length - 1).characterId
      ..data.attributes.image.original =
          waifus.getAt(waifus.length - 1).imageUrl);

    return characterInformation;
  }

  bool isFemale(KitsuCharacterInformation characterInformation) {
    var isFemale = new RegExp(r'(?:^|\W)she(?:$|\W)')
        .allMatches(characterInformation.data.attributes.description);

    if (isFemale.length <= 3 &&
            !CharacterList.whitelist
                .contains(characterInformation.data.attributes.name) ||
        characterInformation.data.attributes.image.original.isEmpty ||
        CharacterList.blacklist
            .contains(characterInformation.data.attributes.name)) {
      return false;
    }

    return true;
  }
}
