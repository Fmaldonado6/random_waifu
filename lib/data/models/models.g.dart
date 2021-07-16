// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonWaifu _$JsonWaifuFromJson(Map<String, dynamic> json) {
  return JsonWaifu(
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
}

Map<String, dynamic> _$JsonWaifuToJson(JsonWaifu instance) => <String, dynamic>{
      'title': instance.title,
      'mal_id': instance.malId,
      'image_url': instance.imageUrl,
      'anime': instance.anime,
      'manga': instance.manga,
      'date': instance.date,
    };

Waifu _$WaifuFromJson(Map<String, dynamic> json) {
  return Waifu(
    name: json['name'] as String?,
    about: json['about'] as String?,
    imageUrl: json['image_url'] as String?,
    animeography: (json['animeography'] as List<dynamic>?)
        ?.map((e) => AnimeInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
    mangaography: (json['mangaography'] as List<dynamic>?)
        ?.map((e) => AnimeInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
    voiceActors: (json['voice_actors'] as List<dynamic>?)
        ?.map((e) => AnimeInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WaifuToJson(Waifu instance) => <String, dynamic>{
      'name': instance.name,
      'about': instance.about,
      'image_url': instance.imageUrl,
      'animeography': instance.animeography,
      'mangaography': instance.mangaography,
      'voice_actors': instance.voiceActors,
    };

FireBaseResponse _$FireBaseResponseFromJson(Map<String, dynamic> json) {
  return FireBaseResponse()
    ..waifus = (json['waifus'] as List<dynamic>?)
        ?.map((e) => SavedCharacter.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$FireBaseResponseToJson(FireBaseResponse instance) =>
    <String, dynamic>{
      'waifus': instance.waifus,
    };
