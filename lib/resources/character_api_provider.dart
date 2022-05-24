import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/characters_paginator.dart';
import 'package:rick_and_morty/models/characters_response.dart';
import '../models/character.dart';

class CharacterApiProvider {
  Client client = Client();

  String charactersUrl = 'https://rickandmortyapi.com/api/character';

  Future<CharacterResponse> fetchCharacters({String? nextPageUrl}) async {
    if (nextPageUrl != null) {
      charactersUrl = nextPageUrl;

      print(nextPageUrl);
    }

    var response = await client.get(Uri.parse(charactersUrl));
    var responseBody = json.decode(response.body);

    return CharacterResponse(
      characters: (responseBody['results'] as List)
          .map((item) => Character.fromJson(item))
          .toList(),
      paginator: CharacterPaginator.fromJson(responseBody['info']),
    );
  }
}
