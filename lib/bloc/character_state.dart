part of 'character_bloc.dart';

class CharacterState {
  List<dynamic> allCharacters;
  CharacterPaginator? charactersPaginator;
  bool isLoading;

  CharacterState(
      {required this.allCharacters,
      required this.charactersPaginator,
      required this.isLoading});

  CharacterState copyWith(
      {List<dynamic>? allCharacters,
      CharacterPaginator? charactersPaginator,
      bool? isLoading}) {
    return CharacterState(
        allCharacters: allCharacters ?? this.allCharacters,
        charactersPaginator: charactersPaginator ?? this.charactersPaginator,
        isLoading: isLoading ?? this.isLoading);
  }
}

class CharacterInitial extends CharacterState {
  CharacterInitial()
      : super(allCharacters: [], charactersPaginator: null, isLoading: false);
}
