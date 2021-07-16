import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/models/models.dart';

abstract class CollectionState {
  const CollectionState();
}

class CollectionStateLoading extends CollectionState {
  const CollectionStateLoading();
}

class CollectionStateLoaded extends CollectionState {
  final Box<dynamic> waifus;
  final NativeAd? ad;
  const CollectionStateLoaded(this.waifus, this.ad);
}

class CollectionStateAdLoaded extends CollectionState {
  final adLoaded;
  const CollectionStateAdLoaded(this.adLoaded);
}

class CollectionStateError extends CollectionState {
  final String error;

  const CollectionStateError(this.error);
}
