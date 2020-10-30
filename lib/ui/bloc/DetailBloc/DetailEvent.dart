abstract class DetailEvent{}

class GetCharacterInformation extends DetailEvent{
  final int id;
  GetCharacterInformation(this.id);
}