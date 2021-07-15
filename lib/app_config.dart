import 'package:flutter/material.dart';

class AppConfig {
  final String adId;
  final String rewardedAd;
  static AppConfig _instance;

  factory AppConfig({String adId, String rewardedAd}) {
    return _instance ??= AppConfig._internal(
      adId: adId,
      rewardedAd: rewardedAd,
    );
  }

  AppConfig._internal({
    @required this.adId,
    @required this.rewardedAd,
  });
}
