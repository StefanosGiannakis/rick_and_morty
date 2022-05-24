
import 'package:rick_and_morty/models/characters_paginator.dart';

import 'character.dart';

class CharacterResponse {
  final List<Character> characters;
  final CharacterPaginator paginator;

  CharacterResponse({required this.characters, required this.paginator});
}