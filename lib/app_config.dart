import 'package:flutter/material.dart';

class AppConfig {
  final String adId;

  static AppConfig _instance;

  factory AppConfig({String adId}) {
    return _instance ??= AppConfig._internal(adId: adId);
  }

  AppConfig._internal({
    @required this.adId,
  });
}
