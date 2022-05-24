import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/models/characters_paginator.dart';
import 'package:rick_and_morty/resources/character_api_provider.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  late Map<String, dynamic> fetchedModels;
  CharacterApiProvider apiProvider = CharacterApiProvider();
  late StreamSubscription otherBlocSubscription;
  late bool isLoading;

  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async {
      // CharacterState characterState = C
      if (event is FetchCharacters) {
        emit(state.copyWith(isLoading: true));
        fetchedModels = await apiProvider.fetchCharacters();
        emit(CharacterState(
          allCharacters: fetchedModels["characterModels"],
          charactersPaginator: fetchedModels["characterPaginatorModel"],
          isLoading: false,
        ));
      }
      if (event is FetchCharactersNextPage) {
        if (state.charactersPaginator!.next == null) {
          return;
        }

        // emit(state.copyWith(isLoading: true));
        print('BLOC FETCH MORE');

        fetchedModels = await apiProvider.fetchCharacters(
            nextPageUrl: state.charactersPaginator!.next);

        emit(CharacterState(
          allCharacters: fetchedModels["characterModels"],
          charactersPaginator: fetchedModels["characterPaginatorModel"],
          isLoading: false,
        ));
      }
    });
  }
}
