import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/characters_paginator.dart';
import 'package:rick_and_morty/resources/character_api_provider.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterApiProvider apiProvider = CharacterApiProvider();

  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async {
      if (event is FetchCharacters) {
        emit(state.copyWith(isLoading: true));
        print('BLOC FETCH 1 ');
        final characterResponse = await apiProvider.fetchCharacters();
        emit(CharacterState(
          allCharacters: characterResponse.characters,
          charactersPaginator: characterResponse.paginator,
          isLoading: false,
        ));
      }
      if (event is FetchCharactersNextPage) {
        if (state.charactersPaginator!.next == null || state.isLoading) {
          return;
        }

        emit(state.copyWith(isLoading: true));
        print('BLOC FETCH MORE');
        final characterResponse = await apiProvider.fetchCharacters(
          nextPageUrl: state.charactersPaginator!.next,
        );

        emit(CharacterState(
          allCharacters: List.of(state.allCharacters)..addAll(characterResponse.characters),
          charactersPaginator: characterResponse.paginator,
          isLoading: false,
        ));
      }
    });

    add(FetchCharacters()); //init
  }
}
