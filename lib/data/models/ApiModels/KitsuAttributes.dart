library KitsuAttributes;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/data/models/serializers/serializers.dart';

import 'KitsuImage.dart';

part 'KitsuAttributes.g.dart';

@HiveType(typeId: 2)
abstract class KitsuAttributes
    implements Built<KitsuAttributes, KitsuAttributesBuilder> {
  @HiveField(0)
  @nullable
  String get description;
  @HiveField(1)
  @nullable
  String get name;

  @HiveField(2)
  @nullable
  int get malId;

  @HiveField(3)
  KitsuImage get image;

  KitsuAttributes._();

  factory KitsuAttributes([updates(KitsuAttributesBuilder b)]) =
      _$KitsuAttributes;

  String toJson() {
    return json
        .encode(serializers.serializeWith(KitsuAttributes.serializer, this));
  }

  static KitsuAttributes fromJson(String jsonString) {
    return serializers.deserializeWith(
        KitsuAttributes.serializer, json.decode(jsonString));
  }

  static Serializer<KitsuAttributes> get serializer =>
      _$kitsuAttributesSerializer;
}
