import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/database.dart';

@singleton
class TodayDao {
  Database database;

  TodayDao(this.database);

  void addToday(DateTime now) async {
    await database.todayBox?.clear();
    await database.todayBox?.add(now.day);
  }
}
