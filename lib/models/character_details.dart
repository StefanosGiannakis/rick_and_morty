import 'package:rick_and_morty/models/abstract_character.dart';

class CharacterDetails extends AbstractCharacter {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String>? episodes;
  final String url;
  final String created;

  CharacterDetails.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        status = json["status"],
        species = json["species"],
        type = json["type"],
        gender = json["gender"],
        origin = Location.fromJson(json["origin"]),
        location = Location.fromJson(json["location"]),
        image = json["image"],
        episodes = json["episodes"],
        url = json["url"],
        created = json["created"];
}

class Location {
  String name;
  String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );
}
