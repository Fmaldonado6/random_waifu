library CharacterInformation;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:random_waifu/data/models/serializers/serializers.dart';


import 'AnimeInformation.dart';

part 'CharacterInformation.g.dart';

abstract class CharacterInformation implements Built<CharacterInformation, CharacterInformationBuilder> {
  @nullable
  String get name;
  @nullable
  String get about;

  @nullable
  String get image_url;
  @nullable
  BuiltList<AnimeInformation> get animeography;
  @nullable
  BuiltList<AnimeInformation> get mangaography;
  @nullable
  BuiltList<AnimeInformation> get voice_actors;



  CharacterInformation._();

  factory CharacterInformation([updates(CharacterInformationBuilder b)]) = _$CharacterInformation;

  String toJson() {
    return json.encode(serializers.serializeWith(CharacterInformation.serializer, this));
  }

  static CharacterInformation fromJson(String jsonString) {
    return serializers.deserializeWith(CharacterInformation.serializer, json.decode(jsonString));
  }

  static Serializer<CharacterInformation> get serializer => _$characterInformationSerializer;
}