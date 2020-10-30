library AnimeInformation;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:random_waifu/data/models/serializers/serializers.dart';

part 'AnimeInformation.g.dart';

abstract class AnimeInformation implements Built<AnimeInformation, AnimeInformationBuilder> {
  String get name;
  String get image_url;
  @nullable
  String get role;
  @nullable
  String get language;

  AnimeInformation._();

  factory AnimeInformation([updates(AnimeInformationBuilder b)]) = _$AnimeInformation;

  String toJson() {
    return json.encode(serializers.serializeWith(AnimeInformation.serializer, this));
  }

  static AnimeInformation fromJson(String jsonString) {
    return serializers.deserializeWith(AnimeInformation.serializer, json.decode(jsonString));
  }

  static Serializer<AnimeInformation> get serializer => _$animeInformationSerializer;
}