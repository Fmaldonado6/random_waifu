import 'package:hive/hive.dart';
import 'package:random_waifu/data/models/ApiModels/KitsuData.dart';

part 'SavedCharacter.g.dart';

@HiveType(typeId: 0)
class SavedCharacter {
  @HiveField(0)
  final int characterId;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final KitsuData data;
  SavedCharacter({this.characterId, this.imageUrl, this.name,this.data});
}
