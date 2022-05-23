part of 'character_bloc.dart';

class CharacterState {
  List<dynamic> allCharacters;
  CharacterPaginator? charactersPaginator;
  CharacterState(
      {required this.allCharacters, required this.charactersPaginator});
}

class CharacterInitial extends CharacterState {
  CharacterInitial() : super(allCharacters: [], charactersPaginator: null);
}
