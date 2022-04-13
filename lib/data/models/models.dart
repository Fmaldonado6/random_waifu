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

  String? getName() {
    if (anime != null) return anime!.name;
    if (manga != null) return manga!.name;

    return null;
  }

  String getIsAnimeOrManga() {
    if (anime != null) return "Anime";

    if (manga != null) return "Manga";

    return "Unknown";
  }

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
  WaifuImages? images;
  List<Anime>? animeography;
  List<Manga>? mangaography;
  @JsonKey(name: "voice_actors")
  List<VoiceActressInformation>? voiceActors;

  String? getWaifuImage() {
    if (images == null) return null;

    if (images!.jpg != null) return images?.jpg?.imageUrl;
    if (images!.webp != null) return images?.webp?.imageUrl;
    return null;
  }

  Waifu(
      {this.name,
      this.about,
      this.images,
      this.animeography,
      this.mangaography,
      this.voiceActors});

  factory Waifu.fromJson(Map<String, dynamic> json) => _$WaifuFromJson(json);
  Map<String, dynamic> toJson() => _$WaifuToJson(this);
}

@JsonSerializable()
class Anime {
  String? role;
  MediaInformation? anime;

  Anime();

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class Manga {
  String? role;
  MediaInformation? manga;

  Manga();

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  Map<String, dynamic> toJson() => _$MangaToJson(this);
}

@JsonSerializable()
class MediaInformation {
  int? mal_id;
  String? title;
  String? url;
  WaifuImages? images;

  String? getImage() {
    if (images == null) return null;

    if (images!.jpg != null) return images?.jpg?.imageUrl;
    if (images!.webp != null) return images?.webp?.imageUrl;
    return null;
  }

  MediaInformation({
    this.title,
    this.images,
  });

  factory MediaInformation.fromJson(Map<String, dynamic> json) =>
      _$MediaInformationFromJson(json);

  Map<String, dynamic> toJson() => _$MediaInformationToJson(this);
}

@JsonSerializable()
class VoiceActressInformation {
  String? language;
  VoiceActressPersonInformation? person;

  VoiceActressInformation();

  factory VoiceActressInformation.fromJson(Map<String, dynamic> json) =>
      _$VoiceActressInformationFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceActressInformationToJson(this);
}

@JsonSerializable()
class VoiceActressPersonInformation {
  String? url;
  String? name;
  int? mal_id;
  WaifuImages? images;

  String? getImage() {
    if (images == null) return null;

    if (images!.jpg != null) return images?.jpg?.imageUrl;
    if (images!.webp != null) return images?.webp?.imageUrl;
    return null;
  }

  VoiceActressPersonInformation();

  factory VoiceActressPersonInformation.fromJson(Map<String, dynamic> json) =>
      _$VoiceActressPersonInformationFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceActressPersonInformationToJson(this);
}

@JsonSerializable()
class WaifuImages {
  WaifuImage? jpg;
  WaifuImage? webp;

  WaifuImages();

  factory WaifuImages.fromJson(Map<String, dynamic> json) =>
      _$WaifuImagesFromJson(json);
  Map<String, dynamic> toJson() => _$WaifuImagesToJson(this);
}

@JsonSerializable()
class WaifuImage {
  @JsonKey(name: "image_url")
  String? imageUrl;

  WaifuImage();

  factory WaifuImage.fromJson(Map<String, dynamic> json) =>
      _$WaifuImageFromJson(json);
  Map<String, dynamic> toJson() => _$WaifuImageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FireBaseResponse {
  List<SavedCharacter>? waifus;

  FireBaseResponse();

  factory FireBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$FireBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FireBaseResponseToJson(this);
}
