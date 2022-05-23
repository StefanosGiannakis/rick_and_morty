import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/characters_paginator.dart';
import '../models/character.dart';

class CharacterApiProvider {
  Client client = Client();
  List<dynamic> characterModels = [];
  late CharacterPaginator characterPaginatorModel;
  late Map<String, dynamic> fetchedModels = {};
  String charactersUrl = 'https://rickandmortyapi.com/api/character';

  Future<Map<String, dynamic>> fetchCharacters({String? nextPageUrl}) async {
    if (nextPageUrl != null) {
      charactersUrl = nextPageUrl;
    }

    var response = await client.get(Uri.parse(charactersUrl));
    var responseBody = json.decode(response.body);

    if (characterModels.isEmpty) {
      characterModels = responseBody['results']
          .map((item) => Character.fromJson(item))
          .toList();
    } else {
      characterModels.addAll(responseBody['results']
          .map((character) => Character.fromJson(character))
          .toList());
    }

    characterPaginatorModel = CharacterPaginator.fromJson(responseBody['info']);
    print('length' + characterModels.length.toString());

    fetchedModels['characterModels'] = characterModels;
    fetchedModels['characterPaginatorModel'] = characterPaginatorModel;

    return fetchedModels;
  }
}
