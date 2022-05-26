part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CharacterFetched extends CharacterEvent {}

class CharactersNextPageFetched extends CharacterEvent {
  CharactersNextPageFetched();
}
