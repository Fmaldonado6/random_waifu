import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/entities/entities.dart';
import 'package:random_waifu/data/models/models.dart';

@Injectable()
class FirebaseService {
  final db = FirebaseDatabase.instance.ref();

  Future saveWaifus(List<SavedCharacter> characters, String id) async {
    var json = characters.map((e) => e.toJson()).toList();

    await db.child(id).child("waifus").set(json);
  }

  Future deleteAllWaifus(String id) async {
    await db.child(id).remove();
  }

  Future<List<SavedCharacter>> loadWaifus(String id) async {
    var snapshot = await db.child(id).get();

    final Map<String, dynamic> json = snapshot.value is String
        ? jsonDecode(snapshot.value as String)
        : jsonDecode(jsonEncode(snapshot.value));

    var response = FireBaseResponse.fromJson(json);

    return response.waifus ?? [];
  }
}
