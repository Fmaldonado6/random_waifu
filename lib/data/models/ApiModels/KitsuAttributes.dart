library KitsuAttributes;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:random_waifu/data/models/serializers/serializers.dart';

import 'KitsuImage.dart';

part 'KitsuAttributes.g.dart';

abstract class KitsuAttributes implements Built<KitsuAttributes, KitsuAttributesBuilder> {

  @nullable
  String get description;
  @nullable

  String get name;

  @nullable
  int get malId;

  KitsuImage get image;

  KitsuAttributes._();

  factory KitsuAttributes([updates(KitsuAttributesBuilder b)]) = _$KitsuAttributes;

  String toJson() {
    return json.encode(serializers.serializeWith(KitsuAttributes.serializer, this));
  }

  static KitsuAttributes fromJson(String jsonString) {
    return serializers.deserializeWith(KitsuAttributes.serializer, json.decode(jsonString));
  }

  static Serializer<KitsuAttributes> get serializer => _$kitsuAttributesSerializer;
}