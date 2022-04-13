// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonWaifu _$JsonWaifuFromJson(Map<String, dynamic> json) => JsonWaifu(
      title: json['title'] as String?,
      malId: json['mal_id'] as int?,
      imageUrl: json['image_url'] as String?,
      anime: json['anime'] == null
          ? null
          : AnimeInformation.fromJson(json['anime'] as Map<String, dynamic>),
      manga: json['manga'] == null
          ? null
          : AnimeInformation.fromJson(json['manga'] as Map<String, dynamic>),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$JsonWaifuToJson(JsonWaifu instance) => <String, dynamic>{
      'title': instance.title,
      'mal_id': instance.malId,
      'image_url': instance.imageUrl,
      'anime': instance.anime,
      'manga': instance.manga,
      'date': instance.date,
    };

Waifu _$WaifuFromJson(Map<String, dynamic> json) => Waifu(
      name: json['name'] as String?,
      about: json['about'] as String?,
      images: json['images'] == null
          ? null
          : WaifuImages.fromJson(json['images'] as Map<String, dynamic>),
      animeography: (json['animeography'] as List<dynamic>?)
          ?.map((e) => Anime.fromJson(e as Map<String, dynamic>))
          .toList(),
      mangaography: (json['mangaography'] as List<dynamic>?)
          ?.map((e) => Manga.fromJson(e as Map<String, dynamic>))
          .toList(),
      voiceActors: (json['voice_actors'] as List<dynamic>?)
          ?.map((e) =>
              VoiceActressInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaifuToJson(Waifu instance) => <String, dynamic>{
      'name': instance.name,
      'about': instance.about,
      'images': instance.images,
      'animeography': instance.animeography,
      'mangaography': instance.mangaography,
      'voice_actors': instance.voiceActors,
    };

Anime _$AnimeFromJson(Map<String, dynamic> json) => Anime()
  ..role = json['role'] as String?
  ..anime = json['anime'] == null
      ? null
      : MediaInformation.fromJson(json['anime'] as Map<String, dynamic>);

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'role': instance.role,
      'anime': instance.anime,
    };

Manga _$MangaFromJson(Map<String, dynamic> json) => Manga()
  ..role = json['role'] as String?
  ..manga = json['manga'] == null
      ? null
      : MediaInformation.fromJson(json['manga'] as Map<String, dynamic>);

Map<String, dynamic> _$MangaToJson(Manga instance) => <String, dynamic>{
      'role': instance.role,
      'manga': instance.manga,
    };

MediaInformation _$MediaInformationFromJson(Map<String, dynamic> json) =>
    MediaInformation(
      title: json['title'] as String?,
      images: json['images'] == null
          ? null
          : WaifuImages.fromJson(json['images'] as Map<String, dynamic>),
    )
      ..mal_id = json['mal_id'] as int?
      ..url = json['url'] as String?;

Map<String, dynamic> _$MediaInformationToJson(MediaInformation instance) =>
    <String, dynamic>{
      'mal_id': instance.mal_id,
      'title': instance.title,
      'url': instance.url,
      'images': instance.images,
    };

VoiceActressInformation _$VoiceActressInformationFromJson(
        Map<String, dynamic> json) =>
    VoiceActressInformation()
      ..language = json['language'] as String?
      ..person = json['person'] == null
          ? null
          : VoiceActressPersonInformation.fromJson(
              json['person'] as Map<String, dynamic>);

Map<String, dynamic> _$VoiceActressInformationToJson(
        VoiceActressInformation instance) =>
    <String, dynamic>{
      'language': instance.language,
      'person': instance.person,
    };

VoiceActressPersonInformation _$VoiceActressPersonInformationFromJson(
        Map<String, dynamic> json) =>
    VoiceActressPersonInformation()
      ..url = json['url'] as String?
      ..name = json['name'] as String?
      ..mal_id = json['mal_id'] as int?
      ..images = json['images'] == null
          ? null
          : WaifuImages.fromJson(json['images'] as Map<String, dynamic>);

Map<String, dynamic> _$VoiceActressPersonInformationToJson(
        VoiceActressPersonInformation instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'mal_id': instance.mal_id,
      'images': instance.images,
    };

WaifuImages _$WaifuImagesFromJson(Map<String, dynamic> json) => WaifuImages()
  ..jpg = json['jpg'] == null
      ? null
      : WaifuImage.fromJson(json['jpg'] as Map<String, dynamic>)
  ..webp = json['webp'] == null
      ? null
      : WaifuImage.fromJson(json['webp'] as Map<String, dynamic>);

Map<String, dynamic> _$WaifuImagesToJson(WaifuImages instance) =>
    <String, dynamic>{
      'jpg': instance.jpg,
      'webp': instance.webp,
    };

WaifuImage _$WaifuImageFromJson(Map<String, dynamic> json) =>
    WaifuImage()..imageUrl = json['image_url'] as String?;

Map<String, dynamic> _$WaifuImageToJson(WaifuImage instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
    };

FireBaseResponse _$FireBaseResponseFromJson(Map<String, dynamic> json) =>
    FireBaseResponse()
      ..waifus = (json['waifus'] as List<dynamic>?)
          ?.map((e) => SavedCharacter.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$FireBaseResponseToJson(FireBaseResponse instance) =>
    <String, dynamic>{
      'waifus': instance.waifus?.map((e) => e.toJson()).toList(),
    };
