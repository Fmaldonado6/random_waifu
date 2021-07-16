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
      characterId: fields[0] as int?,
      imageUrl: fields[1] as String?,
      name: fields[2] as String?,
      date: fields[4] as String?,
      anime: fields[5] as AnimeInformation?,
      manga: fields[6] as AnimeInformation?,
    );
  }

  @override
  void write(BinaryWriter writer, SavedCharacter obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.characterId)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.anime)
      ..writeByte(6)
      ..write(obj.manga);
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

class KitsuDataAdapter extends TypeAdapter<KitsuData> {
  @override
  final int typeId = 1;

  @override
  KitsuData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KitsuData()..attributes = fields[0] as KitsuAttributes?;
  }

  @override
  void write(BinaryWriter writer, KitsuData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.attributes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KitsuDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KitsuAttributesAdapter extends TypeAdapter<KitsuAttributes> {
  @override
  final int typeId = 2;

  @override
  KitsuAttributes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KitsuAttributes()
      ..description = fields[0] as String?
      ..name = fields[1] as String?
      ..malId = fields[2] as int?
      ..image = fields[3] as KitsuImage?;
  }

  @override
  void write(BinaryWriter writer, KitsuAttributes obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.malId)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KitsuAttributesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KitsuImageAdapter extends TypeAdapter<KitsuImage> {
  @override
  final int typeId = 3;

  @override
  KitsuImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KitsuImage()..original = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, KitsuImage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.original);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KitsuImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnimeInformationAdapter extends TypeAdapter<AnimeInformation> {
  @override
  final int typeId = 4;

  @override
  AnimeInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeInformation();
  }

  @override
  void write(BinaryWriter writer, AnimeInformation obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedCharacter _$SavedCharacterFromJson(Map<String, dynamic> json) {
  return SavedCharacter(
    characterId: json['characterId'] as int?,
    imageUrl: json['imageUrl'] as String?,
    name: json['name'] as String?,
    date: json['date'] as String?,
    anime: json['anime'] == null
        ? null
        : AnimeInformation.fromJson(json['anime'] as Map<String, dynamic>),
    manga: json['manga'] == null
        ? null
        : AnimeInformation.fromJson(json['manga'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SavedCharacterToJson(SavedCharacter instance) =>
    <String, dynamic>{
      'characterId': instance.characterId,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'date': instance.date,
      'anime': instance.anime,
      'manga': instance.manga,
    };

JsonWaifu _$JsonWaifuFromJson(Map<String, dynamic> json) {
  return JsonWaifu(
    title: json['title'] as String?,
    mal_id: json['mal_id'] as int?,
    image_url: json['image_url'] as String?,
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
      'mal_id': instance.mal_id,
      'image_url': instance.image_url,
      'anime': instance.anime,
      'manga': instance.manga,
      'date': instance.date,
    };

Waifu _$WaifuFromJson(Map<String, dynamic> json) {
  return Waifu(
    name: json['name'] as String?,
    about: json['about'] as String?,
    image_url: json['image_url'] as String?,
    animeography: (json['animeography'] as List<dynamic>?)
        ?.map((e) => AnimeInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
    mangaography: (json['mangaography'] as List<dynamic>?)
        ?.map((e) => AnimeInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
    voice_actors: (json['voice_actors'] as List<dynamic>?)
        ?.map((e) => AnimeInformation.fromJson(e as Map<String, dynamic>))
        .toList(),
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
    name: json['name'] as String?,
    image_url: json['image_url'] as String?,
    role: json['role'] as String?,
    language: json['language'] as String?,
  )..mal_id = json['mal_id'] as int?;
}

Map<String, dynamic> _$AnimeInformationToJson(AnimeInformation instance) =>
    <String, dynamic>{
      'mal_id': instance.mal_id,
      'name': instance.name,
      'image_url': instance.image_url,
      'role': instance.role,
      'language': instance.language,
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
