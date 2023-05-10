import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/data/database/entities/entities.dart';
import 'package:random_waifu/di/injection_config.dart';
import 'package:hive/hive.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/ui/screens/home/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SavedCharacterAdapter());
  Hive.registerAdapter(AnimeInformationAdapter());
  Hive.registerAdapter(KitsuDataAdapter());
  Hive.registerAdapter(KitsuAttributesAdapter());
  Hive.registerAdapter(KitsuImageAdapter());
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  print(const String.fromEnvironment("NATIVE_AD_ID"));
  AppConfig(
    adId: const String.fromEnvironment("NATIVE_AD_ID"),
    rewardedAd: const String.fromEnvironment("REWARDED_AD_ID"),
  );
  configureInjection();
  runApp(
    MyApp(),
  );
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.indigo,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Waifu',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark),
        ),
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
