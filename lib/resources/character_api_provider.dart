import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/character_details.dart';
import 'package:rick_and_morty/models/characters_paginator.dart';
import 'package:rick_and_morty/models/characters_response.dart';
import '../models/character.dart';

class CharacterApiProvider {
  var dio = Dio();

  String charactersUrl = 'https://rickandmortyapi.com/api/character';

  Future<CharacterResponse> fetchCharacters({String? nextPageUrl}) async {
    if (nextPageUrl != null) {
      charactersUrl = nextPageUrl;
    }

    var response = await dio.get(charactersUrl);

    if (response.statusCode != 200) {
      throw Exception();
    }

    return CharacterResponse(
      characters: (response.data['results'] as List)
          .map((item) => Character.fromJson(item))
          .toList(),
      paginator: CharacterPaginator.fromJson(response.data['info']),
    );
  }

  Future<CharacterDetails> fetchCharacterDetails({
    required int characterId,
  }) async {
    var response = await dio.get(charactersUrl + "/" + characterId.toString());

    if (response.statusCode != 200) {
      throw Exception();
    }

    return CharacterDetails.fromJson(response.data);
  }
}
