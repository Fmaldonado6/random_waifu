import 'package:hive/hive.dart';
import 'package:random_waifu/models/models.dart';

class Mapping {
  static JsonWaifu savedWaifuToJsonWaifu(SavedCharacter savedCharacter) {
    return JsonWaifu(
        anime: savedCharacter.anime,
        image_url: savedCharacter.imageUrl,
        mal_id: savedCharacter.characterId,
        manga: savedCharacter.manga,
        title: savedCharacter.name,
        date: savedCharacter.date);
  }

  static List<JsonWaifu> savedWaifuBoxToLJsonWaifuList(
    Box<SavedCharacter> savedCharacter,
  ) {
    final list = <JsonWaifu>[];

    savedCharacter.values.forEach((element) {
      list.add(JsonWaifu(
        anime: element.anime,
        date: element.date,
        image_url: element.imageUrl,
        mal_id: element.characterId,
        manga: element.manga,
        title: element.name,
      ));
    });
    return list;
  }

  static List<SavedCharacter> jsonWaifuListToSavedCharacterList(
    List<JsonWaifu> list,
  ) {
    return list.map((e) => jsonWaifuToSavedCharacter(e)).toList();
  }

  static SavedCharacter jsonWaifuToSavedCharacter(JsonWaifu jsonWaifu) {
    return SavedCharacter(
      anime: jsonWaifu.anime,
      characterId: jsonWaifu.mal_id,
      date: _getDate(),
      imageUrl: jsonWaifu.image_url,
      manga: jsonWaifu.manga,
      name: jsonWaifu.title,
    );
  }

  static String _getDate() {
    return "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}";
  }
}
