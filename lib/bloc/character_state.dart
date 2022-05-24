part of 'character_bloc.dart';

class CharacterState { // extend equetable
  final List<Character> allCharacters;
  final CharacterPaginator? charactersPaginator;
  final bool isLoading;

  CharacterState({
    required this.allCharacters,
    required this.charactersPaginator,
    required this.isLoading,
  });

  CharacterState copyWith({
    List<Character>? allCharacters,
    CharacterPaginator? charactersPaginator,
    bool? isLoading,
  }) {
    return CharacterState(
      allCharacters: allCharacters ?? this.allCharacters,
      charactersPaginator: charactersPaginator ?? this.charactersPaginator,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  bool get hasReachedMax {
    return charactersPaginator != null && charactersPaginator!.next == null;
  }
}

class CharacterInitial extends CharacterState {
  CharacterInitial()
      : super(
          allCharacters: [],
          charactersPaginator: null,
          isLoading: true,
        );
}
