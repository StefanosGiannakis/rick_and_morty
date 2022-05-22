class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final String url;

  Character.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        status = json["status"],
        species = json["species"],
        type = json["type"],
        gender = json["gender"],
        origin = Location.fromJson(json["origin"]),
        location = Location.fromJson(json["location"]),
        image = json["image"],
        url = json["url"];
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );
}
