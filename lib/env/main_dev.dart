import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/injection_container.dart';
import 'package:random_waifu/main.dart';
import 'package:random_waifu/models/models.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  initKiwi();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SavedCharacterAdapter());
  AppConfig(adId: "ca-app-pub-3940256099942544/2247696110");
  runApp(
    MyApp(),
  );
}
