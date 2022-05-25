part of 'character_bloc.dart';

enum CharacterStatus { initial, success, failure }

class CharacterState extends Equatable {
  final List<Character> allCharacters;
  final CharacterPaginator? charactersPaginator;
  final bool isLoading;
  final CharacterStatus status;

  const CharacterState({
    required this.allCharacters,
    required this.charactersPaginator,
    required this.isLoading,
    required this.status,
  });

  CharacterState copyWith({
    List<Character>? allCharacters,
    CharacterPaginator? charactersPaginator,
    bool? isLoading,
    CharacterStatus? status,
  }) {
    return CharacterState(
      allCharacters: allCharacters ?? this.allCharacters,
      charactersPaginator: charactersPaginator ?? this.charactersPaginator,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
    );
  }

  bool get hasReachedMax {
    return charactersPaginator != null && charactersPaginator!.next == null;
  }

  @override
  List<Object?> get props => [allCharacters, charactersPaginator, isLoading];
}

class CharacterInitial extends CharacterState {
  CharacterInitial()
      : super(
          allCharacters: [],
          charactersPaginator: null,
          isLoading: true,
          status: CharacterStatus.initial,
        );
}
