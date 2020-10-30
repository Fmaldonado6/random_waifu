import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:random_waifu/data/models/ApiModels/SavedInformation.dart';

class Storage {



  Future<String> readFile() async {
  try {
    final file = await _localFile;

    String contents = await file.readAsString();

    return contents;
  } catch (e) {
    return '';
  }
}

Future<File> writeData(String json) async {
  final file = await _localFile;

  // Write the file.
  return file.writeAsString('$json');
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/saveFile.json');
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
}