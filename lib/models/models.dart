import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class SavedCharacter {
  @HiveField(0)
  final int? characterId;
  @HiveField(1)
  final String? imageUrl;
  @HiveField(2)
  final String? name;
  @HiveField(4)
  final String? date;
  @HiveField(5)
  final AnimeInformation? anime;
  @HiveField(6)
  final AnimeInformation? manga;

  SavedCharacter({
    this.characterId,
    this.imageUrl,
    this.name,
    this.date,
    this.anime,
    this.manga,
  });
  factory SavedCharacter.fromJson(Map<String, dynamic> json) =>
      _$SavedCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$SavedCharacterToJson(this);
}

@HiveType(typeId: 1)
class KitsuData {
  @HiveField(0)
  KitsuAttributes? attributes;

  KitsuData();
}

@HiveType(typeId: 2)
class KitsuAttributes {
  @HiveField(0)
  String? description;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? malId;
  @HiveField(3)
  KitsuImage? image;
}

@HiveType(typeId: 3)
class KitsuImage {
  @HiveField(0)
  String? original;
}

@JsonSerializable()
class JsonWaifu {
  String? title;
  int? mal_id;
  String? image_url;
  AnimeInformation? anime;
  AnimeInformation? manga;

  JsonWaifu({
    this.title,
    this.mal_id,
    this.image_url,
    this.anime,
    this.manga,
  });

  factory JsonWaifu.fromJson(Map<String, dynamic> json) =>
      _$JsonWaifuFromJson(json);
  Map<String, dynamic> toJson() => _$JsonWaifuToJson(this);
}

@JsonSerializable()
class Waifu {
  String? name;
  String? about;
  String? image_url;
  List<AnimeInformation>? animeography;
  List<AnimeInformation>? mangaography;
  List<AnimeInformation>? voice_actors;

  Waifu(
      {this.name,
      this.about,
      this.image_url,
      this.animeography,
      this.mangaography,
      this.voice_actors});

  factory Waifu.fromJson(Map<String, dynamic> json) => _$WaifuFromJson(json);
  Map<String, dynamic> toJson() => _$WaifuToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 4)
class AnimeInformation {
  @HiveType(typeId: 0)
  int? mal_id;
  @HiveType(typeId: 1)
  String? name;
  @HiveType(typeId: 2)
  String? image_url;
  String? role;
  String? language;

  AnimeInformation({
    this.name,
    this.image_url,
    this.role,
    this.language,
  });

  factory AnimeInformation.fromJson(Map<String, dynamic> json) =>
      _$AnimeInformationFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeInformationToJson(this);
}

@JsonSerializable()
class FireBaseResponse {
  List<SavedCharacter>? waifus;

  FireBaseResponse();

  factory FireBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$FireBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FireBaseResponseToJson(this);
}
