import 'package:json_annotation/json_annotation.dart';
import 'package:random_waifu/data/database/entities/entities.dart';

part 'models.g.dart';

@JsonSerializable()
class JsonWaifu {
  String? title;
  @JsonKey(name: "mal_id")
  int? malId;
  @JsonKey(name: "image_url")
  String? imageUrl;
  AnimeInformation? anime;
  AnimeInformation? manga;
  String? date;
  JsonWaifu(
      {this.title,
      this.malId,
      this.imageUrl,
      this.anime,
      this.manga,
      this.date});

  factory JsonWaifu.fromJson(Map<String, dynamic> json) =>
      _$JsonWaifuFromJson(json);
  Map<String, dynamic> toJson() => _$JsonWaifuToJson(this);
}

@JsonSerializable()
class Waifu {
  String? name;
  String? about;
  @JsonKey(name: "image_url")
  String? imageUrl;
  List<AnimeInformation>? animeography;
  List<AnimeInformation>? mangaography;
  @JsonKey(name: "voice_actors")
  List<AnimeInformation>? voiceActors;

  Waifu(
      {this.name,
      this.about,
      this.imageUrl,
      this.animeography,
      this.mangaography,
      this.voiceActors});

  factory Waifu.fromJson(Map<String, dynamic> json) => _$WaifuFromJson(json);
  Map<String, dynamic> toJson() => _$WaifuToJson(this);
}

@JsonSerializable()
class FireBaseResponse {
  List<SavedCharacter>? waifus;

  FireBaseResponse();

  factory FireBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$FireBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FireBaseResponseToJson(this);
}
