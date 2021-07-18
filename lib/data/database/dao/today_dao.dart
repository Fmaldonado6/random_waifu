import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/database.dart';

@singleton
class TodayDao {
  Database database;

  TodayDao(this.database);

  Future addToday(DateTime now) async {
    await database.todayBox?.clear();
    await database.todayBox?.add(now.day);
  }

  Future<int?> getToday() async {
    return database.todayBox!.values.length > 0
        ? database.todayBox?.values.elementAt(0)
        : null;
  }
}
