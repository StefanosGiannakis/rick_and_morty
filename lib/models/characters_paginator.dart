class CharacterPaginator {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterPaginator.fromJson(Map<String, dynamic> json)
      : count = json["count"],
        pages = json["pages"],
        next = json["next"],
        prev = json["prev"];
}
