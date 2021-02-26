import 'package:flutter/material.dart';
import 'package:random_waifu/models/models.dart';

abstract class CollectionState {
  const CollectionState();
}

class CollectionStateLoading extends CollectionState {
  const CollectionStateLoading();
}

class CollectionStateLoaded extends CollectionState {
  final List<Widget> waifus;
  const CollectionStateLoaded(this.waifus);
}

class CollectionStateError extends CollectionState {
  final String error;

  const CollectionStateError(this.error);
}
