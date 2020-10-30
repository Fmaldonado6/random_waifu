import 'package:hive/hive.dart';

part 'SavedCharacter.g.dart';

@HiveType(typeId: 0)
class SavedCharacter {
  @HiveField(0)
  final int characterId;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String name;

  SavedCharacter({this.characterId, this.imageUrl, this.name});
}
