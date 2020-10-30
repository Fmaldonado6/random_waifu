library KitsuImage;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/data/models/serializers/serializers.dart';

part 'KitsuImage.g.dart';

@HiveType(typeId: 3)
abstract class KitsuImage implements Built<KitsuImage, KitsuImageBuilder> {
  @HiveField(0)
  @nullable
  String get original;

  KitsuImage._();

  factory KitsuImage([updates(KitsuImageBuilder b)]) = _$KitsuImage;

  String toJson() {
    return json.encode(serializers.serializeWith(KitsuImage.serializer, this));
  }

  static KitsuImage fromJson(String jsonString) {
    return serializers.deserializeWith(
        KitsuImage.serializer, json.decode(jsonString));
  }

  static Serializer<KitsuImage> get serializer => _$kitsuImageSerializer;
}
