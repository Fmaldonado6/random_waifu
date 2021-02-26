import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

import 'package:random_waifu/models/models.dart';


class DatabaseService {
  final db = FirebaseDatabase.instance.reference();
  void saveWaifus(List<SavedCharacter> characters, String id) async {
    var elements = FireBaseResponse();
    elements.waifus = characters;

    await db.child(id).set(jsonEncode(elements));
  }

  Future<FireBaseResponse> loadWaifus(String id) async {
    print(id);
    var snapshot = await db.child(id).once();

    print(snapshot);

    var json = jsonDecode(snapshot.value);

    var response = FireBaseResponse.fromJson(json);
    return response;
  }
}
