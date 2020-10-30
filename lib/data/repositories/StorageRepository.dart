import 'dart:convert';

import 'package:random_waifu/data/models/ApiModels/SavedInformation.dart';
import 'package:random_waifu/data/storage/Storage.dart';

class StorageRepository {
  final Storage _storage;

  StorageRepository(this._storage);

  Future<SavedInformation> getSavedInfo() async {
    List<Map<String, dynamic>> savedJson = json.decode(await _storage.readFile());


  }

  Future writeInfo(SavedInformation information) async {

  }
}
