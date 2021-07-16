import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/database/entities/entities.dart';
import 'package:random_waifu/data/models/models.dart';

@singleton
class FirebaseService {
  final db = FirebaseDatabase.instance.reference();

  void saveWaifus(List<SavedCharacter> characters, String id) async {
    var elements = FireBaseResponse();
    elements.waifus = characters;

    await db.child(id).set(jsonEncode(elements));
  }

  Future<List<SavedCharacter>> loadWaifus(String id) async {
    var snapshot = await db.child(id).once();

    var json = jsonDecode(snapshot.value);

    var response = FireBaseResponse.fromJson(json);
    return response.waifus ?? [];
  }
}
