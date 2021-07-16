import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/database.dart';
import 'package:random_waifu/data/database/entities/entities.dart';

@singleton
class CharactersDao {
  Database database;

  CharactersDao(this.database);

  void saveWaifu(SavedCharacter waifu) async {
    await database.characterBox?.add(waifu);
  }

  Future<Box<SavedCharacter>> getWaifus() async{
    return database.characterBox!;
  }

  Future saveAll(List<SavedCharacter> waifu) async {
    await database.characterBox?.addAll(waifu);
  }

  Future updateWaifu(SavedCharacter waifu, int position) async {
    await database.characterBox?.putAt(position, waifu);
  }

  Future deleteWaifu(SavedCharacter waifu, int position) async {
    await database.characterBox?.deleteAt(position);
  }

  Future deleteAll() async {
    await database.characterBox?.clear();
  }
}
