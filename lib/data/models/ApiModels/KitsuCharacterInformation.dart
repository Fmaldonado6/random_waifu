library KitsuCharacterInformation;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:random_waifu/data/models/serializers/serializers.dart';

import 'KitsuData.dart';

part 'KitsuCharacterInformation.g.dart';

abstract class KitsuCharacterInformation implements Built<KitsuCharacterInformation, KitsuCharacterInformationBuilder> {

  KitsuData get data;


  KitsuCharacterInformation._();

  factory KitsuCharacterInformation([updates(KitsuCharacterInformationBuilder b)]) = _$KitsuCharacterInformation;

  String toJson() {
    return json.encode(serializers.serializeWith(KitsuCharacterInformation.serializer, this));
  }

  static KitsuCharacterInformation fromJson(String jsonString) {
    return serializers.deserializeWith(KitsuCharacterInformation.serializer, json.decode(jsonString));
  }

  static Serializer<KitsuCharacterInformation> get serializer => _$kitsuCharacterInformationSerializer;
}