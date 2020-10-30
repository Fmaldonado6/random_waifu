import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_waifu/InjectionContainer.dart';
import 'package:random_waifu/data/models/ApiModels/SavedCharacter.dart';
import 'package:random_waifu/ui/pages/MainPage.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

void main() async {
  initKiwi();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SavedCharacterAdapter());
  Hive.deleteBoxFromDisk('savedCharacters');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo),
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) if (snapshot
              .hasError) {
            return Text("data");
          } else {
            return MainPage();
          }else{
            return Scaffold( backgroundColor: Colors.indigo,);
          }
        },
        future: Hive.openBox('today'),
      ),
    );
  }
}
