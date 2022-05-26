import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/models/characters_paginator.dart';
import 'package:rick_and_morty/resources/character_api_provider.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'character_event.dart';
part 'character_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final apiProvider = CharacterApiProvider();

  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterEvent>(
      (event, emit) async {
        if (event is CharacterFetched) {
          try {
            emit(state.copyWith(isLoading: true));

            debugPrint('BLOC FETCH FIRST PAGE');

            final characterResponse = await apiProvider.fetchCharacters();
            emit(state.copyWith(
              allCharacters: characterResponse.characters,
              charactersPaginator: characterResponse.paginator,
              isLoading: false,
              status: CharacterStatus.success,
            ));
          } catch (_) {
            emit(state.copyWith(
              status: CharacterStatus.failure,
              isLoading: false,
            ));
          }
        }
        if (event is CharactersNextPageFetched) {
          if (state.charactersPaginator!.next == null || state.isLoading) {
            return;
          }

          try {
            emit(state.copyWith(isLoading: true));

            debugPrint('BLOC FETCH NEXT PAGE');
            final characterResponse = await apiProvider.fetchCharacters(
              nextPageUrl: state.charactersPaginator!.next,
            );

            emit(state.copyWith(
              allCharacters: List.of(state.allCharacters)
                ..addAll(characterResponse.characters),
              charactersPaginator: characterResponse.paginator,
              isLoading: false,
              status: CharacterStatus.success,
            ));
          } catch (_) {
            emit(state.copyWith(
              isLoading: false,
              status: CharacterStatus.failure,
            ));
          }
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );

    add(CharacterFetched()); // init
  }
}
