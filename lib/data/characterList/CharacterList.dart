import 'dart:collection';

class CharacterList{
  static final HashSet<String> whitelist = HashSet.from([
    "Aqua",
    "Megumin",
    "Lalatina Dustiness Ford",
    "Ai Hayasaka",
    "Mai Sakurajima",
    "Chika Fujiwara",
    "Wiz"
  ]);

  static final HashSet<String> blacklist = HashSet.from([
    "Karasuba",
    "Ryuuji Shirogami",
    "Shinji Ikari"
  ]);
}