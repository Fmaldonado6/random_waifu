// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SavedCharacter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedCharacterAdapter extends TypeAdapter<SavedCharacter> {
  @override
  final typeId = 0;

  @override
  SavedCharacter read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedCharacter(
      characterId: fields[0] as int,
      imageUrl: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedCharacter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.characterId)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.name);
  }
}
