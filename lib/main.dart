import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_waifu/InjectionContainer.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/pages/MainPage.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  initKiwi();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SavedCharacterAdapter());

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.indigo,
      //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Random Waifu',
        theme: ThemeData(
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo),
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage());
  }
}
