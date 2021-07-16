import 'package:firebase_database/firebase_database.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/entities/entities.dart';


@singleton
class Database {
  static const CharacterBox = 'savedCharacters';
  static const TodayBox = 'today';

  Box<SavedCharacter>? characterBox;
  Box<int>? todayBox;

  Database() {
    this.init();
  }

  init() async {
    characterBox = await Hive.openBox(CharacterBox);
    todayBox = await Hive.openBox(TodayBox);
  }
}
