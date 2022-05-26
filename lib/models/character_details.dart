import 'character.dart';

class CharacterDetails extends Character {
  final List<dynamic> episode;
  final String created;

  CharacterDetails.fromJson(Map<String, dynamic> json)
      : episode = json["episode"],
        created = json["created"],
        super.fromJson(json);
}
