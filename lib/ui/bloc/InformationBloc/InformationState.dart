library InformationState;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';
import 'package:random_waifu/data/models/ApiModels/KitsuCharacterInformation.dart';

part 'InformationState.g.dart';

abstract class InformationState
    implements Built<InformationState, InformationStateBuilder> {
  bool get isLoading;
  bool get hasError;
  KitsuCharacterInformation get characterInformation;

  InformationState._();

  factory InformationState([updates(InformationStateBuilder b)]) =
      _$InformationState;

  factory InformationState.loading() {
    return InformationState((b) => b
      ..isLoading = true
      ..hasError = false
      ..characterInformation = null);
  }

  factory InformationState.error() {
    return InformationState((b) => b
      ..isLoading = false
      ..hasError = true
      ..characterInformation = null);
  }

  factory InformationState.success(KitsuCharacterInformation characterInformation) {
    return InformationState((b) => b
      ..isLoading = false
      ..hasError = false
      ..characterInformation.replace(characterInformation));
  }
}
