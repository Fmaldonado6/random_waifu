import 'package:flutter/material.dart';
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
  const CollectionStateLoaded(this.waifus);
}

class CollectionStateAdLoaded extends CollectionState {
  final adLoaded;
  const CollectionStateAdLoaded(this.adLoaded);
}


class CollectionStateError extends CollectionState {
  final String error;

  const CollectionStateError(this.error);
}
