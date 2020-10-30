library HistoryState;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:random_waifu/data/models/ApiModels/SavedInformation.dart';

part 'HistoryState.g.dart';

abstract class HistoryState implements Built<HistoryState, HistoryStateBuilder> {
  bool get isLoading;
  bool get hasError;
  SavedInformation get savedInformation;

  HistoryState._();

  factory HistoryState([updates(HistoryStateBuilder b)]) = _$HistoryState;
}