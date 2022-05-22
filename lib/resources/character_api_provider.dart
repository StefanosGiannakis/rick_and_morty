import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/characters_paginator.dart';
import '../models/character.dart';

const rootUrl = 'https://rickandmortyapi.com/api/character';

class CharacterApiProvider {
  Client client = Client();
  late List<dynamic> characterModels;
  late CharacterPaginator characterPaginatorModel;

  void fetchCharacters() async {
      var response = await client.get(Uri.parse(rootUrl));
      var responseBody = json.decode(response.body);

      characterModels = responseBody['results'].map((item) => Character.fromJson(item)).toList();
      characterPaginatorModel = CharacterPaginator.fromJson(responseBody['info']);
  }
}
