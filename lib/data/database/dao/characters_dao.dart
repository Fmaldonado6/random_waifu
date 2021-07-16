import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/database.dart';
import 'package:random_waifu/models/models.dart';

@singleton
class CharactersDao {
  Database database;

  CharactersDao(this.database);

  void saveWaifu(SavedCharacter waifu) async {
    await database.characterBox?.add(waifu);
  }

  void saveAll(List<SavedCharacter> waifu) async {
    await database.characterBox?.addAll(waifu);
  }

  void updateWaifu(SavedCharacter waifu, int position) async {
    await database.characterBox?.putAt(position, waifu);
  }

  void deleteWaifu(SavedCharacter waifu, int position) async {
    await database.characterBox?.deleteAt(position);
  }

  void deleteAll() async {
    await database.characterBox?.clear();
  }
}
