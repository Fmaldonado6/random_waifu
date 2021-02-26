import 'package:random_waifu/models/models.dart';
import 'package:hive/hive.dart';

class DatabaseRepository {
  static const CharacterBox = 'savedCharacters';
  static const TodayBox = 'today';

  init() async {
    await Hive.openBox(CharacterBox);
    await Hive.openBox(TodayBox);
  }

  addWaifu(SavedCharacter waifu) async {
    await Hive.box(CharacterBox).add(waifu);
  }

  resetTimer() async {
    await Hive.box(TodayBox).clear();
    await Hive.box(TodayBox).add(DateTime.now().day);
  }

  addWaifuList(List<SavedCharacter> characters) async {
    await Hive.box(CharacterBox).addAll(characters);
  }

  Future<bool> characterExists(int id) async {
    final characters = Hive.box(CharacterBox);
    for (var i = 0; i < characters.length; i++) {
      var character = characters.getAt(i) as SavedCharacter;
      if (character.characterId == id) return true;
    }

    return false;
  }

  clearCharacters() async {
    await Hive.box(CharacterBox).clear();
  }

  Box<dynamic> getCharacters() {
    return Hive.box(CharacterBox);
  }

  JsonWaifu loadLastWaifu() {
    final waifus = Hive.box(CharacterBox);
    final last = waifus.getAt(waifus.length - 1);

    return JsonWaifu(
      title: last.name,
      mal_id: last.characterId,
      image_url: last.imageUrl,
    );
  }

  getLastWaifuDate() {
    return Hive.box(TodayBox).get(0);
  }

  deleteLastWaifu() async {
    final characters = Hive.box(CharacterBox);
    await Hive.box(TodayBox).clear();
    await characters.deleteAt(characters.length - 1);
  }


}
