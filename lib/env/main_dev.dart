import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/data/database/entities/entities.dart';
import 'package:random_waifu/di/injection_config.dart';
import 'package:random_waifu/injection_container.dart';
import 'package:random_waifu/main.dart';
import 'package:hive/hive.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  initKiwi();
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SavedCharacterAdapter());
  Hive.registerAdapter(AnimeInformationAdapter());
  Hive.registerAdapter(KitsuDataAdapter());
  Hive.registerAdapter(KitsuAttributesAdapter());
  Hive.registerAdapter(KitsuImageAdapter());
  await MobileAds.instance.initialize();
  AppConfig(
    adId: "ca-app-pub-3940256099942544/2247696110",
    rewardedAd: "ca-app-pub-3940256099942544/5224354917",
  );
  runApp(
    MyApp(),
  );
}
