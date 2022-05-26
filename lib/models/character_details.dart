import 'character.dart';

class CharacterDetails extends Character {
  final List<String>? episodes;
  final String created;

  CharacterDetails.fromJson(Map<String, dynamic> json)
      : episodes = json["episodes"],
        created = json["created"],
        super.fromJson(json);
}
