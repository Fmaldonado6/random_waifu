library serializers;


import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:random_waifu/data/models/ApiModels/AnimeInformation.dart';
import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';
import 'package:random_waifu/data/models/ApiModels/KitsuAttributes.dart';
import 'package:random_waifu/data/models/ApiModels/KitsuCharacterInformation.dart';
import 'package:random_waifu/data/models/ApiModels/KitsuData.dart';
import 'package:random_waifu/data/models/ApiModels/KitsuImage.dart';
import 'package:random_waifu/data/models/ApiModels/SavedCharacter.dart';
import 'package:random_waifu/data/models/ApiModels/SavedInformation.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AnimeInformation,
  CharacterInformation,
  KitsuAttributes,
  KitsuData,
  KitsuImage,
  KitsuCharacterInformation,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
