library KitsuData;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/data/models/serializers/serializers.dart';

import 'KitsuAttributes.dart';

part 'KitsuData.g.dart';
@HiveType(typeId: 1)

abstract class KitsuData implements Built<KitsuData, KitsuDataBuilder> {
  @HiveField(0)
  KitsuAttributes get attributes;

  KitsuData._();

  factory KitsuData([updates(KitsuDataBuilder b)]) = _$KitsuData;

  String toJson() {
    return json.encode(serializers.serializeWith(KitsuData.serializer, this));
  }

  static KitsuData fromJson(String jsonString) {
    return serializers.deserializeWith(KitsuData.serializer, json.decode(jsonString));
  }

  static Serializer<KitsuData> get serializer => _$kitsuDataSerializer;
}