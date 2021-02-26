// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedCharacterAdapter extends TypeAdapter<SavedCharacter> {
  @override
  final int typeId = 0;

  @override
  SavedCharacter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedCharacter(
      characterId: fields[0] as int,
      imageUrl: fields[1] as String,
      name: fields[2] as String,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedCharacter obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.characterId)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedCharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedCharacter _$SavedCharacterFromJson(Map<String, dynamic> json) {
  return SavedCharacter(
    characterId: json['characterId'] as int,
    imageUrl: json['imageUrl'] as String,
    name: json['name'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$SavedCharacterToJson(SavedCharacter instance) =>
    <String, dynamic>{
      'characterId': instance.characterId,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'date': instance.date,
    };

JsonWaifu _$JsonWaifuFromJson(Map<String, dynamic> json) {
  return JsonWaifu(
    title: json['title'] as String,
    mal_id: json['mal_id'] as int,
    image_url: json['image_url'] as String,
  );
}

Map<String, dynamic> _$JsonWaifuToJson(JsonWaifu instance) => <String, dynamic>{
      'title': instance.title,
      'mal_id': instance.mal_id,
      'image_url': instance.image_url,
    };

Waifu _$WaifuFromJson(Map<String, dynamic> json) {
  return Waifu(
    name: json['name'] as String,
    about: json['about'] as String,
    image_url: json['image_url'] as String,
    animeography: (json['animeography'] as List)
        ?.map((e) => e == null
            ? null
            : AnimeInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mangaography: (json['mangaography'] as List)
        ?.map((e) => e == null
            ? null
            : AnimeInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    voice_actors: (json['voice_actors'] as List)
        ?.map((e) => e == null
            ? null
            : AnimeInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WaifuToJson(Waifu instance) => <String, dynamic>{
      'name': instance.name,
      'about': instance.about,
      'image_url': instance.image_url,
      'animeography': instance.animeography,
      'mangaography': instance.mangaography,
      'voice_actors': instance.voice_actors,
    };

AnimeInformation _$AnimeInformationFromJson(Map<String, dynamic> json) {
  return AnimeInformation(
    name: json['name'] as String,
    image_url: json['image_url'] as String,
    role: json['role'] as String,
    language: json['language'] as String,
  );
}

Map<String, dynamic> _$AnimeInformationToJson(AnimeInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image_url': instance.image_url,
      'role': instance.role,
      'language': instance.language,
    };

FireBaseResponse _$FireBaseResponseFromJson(Map<String, dynamic> json) {
  return FireBaseResponse()
    ..waifus = (json['waifus'] as List)
        ?.map((e) => e == null
            ? null
            : SavedCharacter.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FireBaseResponseToJson(FireBaseResponse instance) =>
    <String, dynamic>{
      'waifus': instance.waifus,
    };
