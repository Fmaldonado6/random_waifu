import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:random_waifu/ui/screens/home/home_page.dart';

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
            brightness: Brightness.dark,
          ),
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}
