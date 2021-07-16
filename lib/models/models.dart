import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:random_waifu/data/database/entities/entities.dart';

part 'models.g.dart';


@JsonSerializable()
class JsonWaifu {
  String? title;
  int? mal_id;
  String? image_url;
  AnimeInformation? anime;
  AnimeInformation? manga;
  String? date;
  JsonWaifu({
    this.title,
    this.mal_id,
    this.image_url,
    this.anime,
    this.manga,
    this.date
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
class FireBaseResponse {
  List<SavedCharacter>? waifus;

  FireBaseResponse();

  factory FireBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$FireBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FireBaseResponseToJson(this);
}
