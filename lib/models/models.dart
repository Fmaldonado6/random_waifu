import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class SavedCharacter {
  @HiveField(0)
  final int characterId;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String date;

  SavedCharacter({
    this.characterId,
    this.imageUrl,
    this.name,
    this.date,
  });
  factory SavedCharacter.fromJson(Map<String, dynamic> json) =>
      _$SavedCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$SavedCharacterToJson(this);
}

@JsonSerializable()
class JsonWaifu {
  String title;
  int mal_id;
  String image_url;

  JsonWaifu({this.title, this.mal_id, this.image_url});

  factory JsonWaifu.fromJson(Map<String, dynamic> json) =>
      _$JsonWaifuFromJson(json);
  Map<String, dynamic> toJson() => _$JsonWaifuToJson(this);
}

@JsonSerializable()
class Waifu {
  String name;
  String about;
  String image_url;
  List<AnimeInformation> animeography;
  List<AnimeInformation> mangaography;
  List<AnimeInformation> voice_actors;

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
class AnimeInformation {
  String name;
  String image_url;
  String role;
  String language;

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
  List<SavedCharacter> waifus;

  FireBaseResponse();

  factory FireBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$FireBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FireBaseResponseToJson(this);
}
