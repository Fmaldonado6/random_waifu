import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_waifu/injection_container.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/screens/home/home_page.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  initKiwi();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SavedCharacterAdapter());
  Firebase.initializeApp();
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
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo),
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}
