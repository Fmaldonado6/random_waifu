import 'package:random_waifu/data/models/ApiModels/SavedCharacter.dart';

class SavedInformation{
  final int today;
  final List<SavedCharacter> savedCharacters;

  SavedInformation({this.today,this.savedCharacters});
}