part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CharactersFetched extends CharacterEvent {}

class CharactersNextPageFetched extends CharacterEvent {
  CharactersNextPageFetched();
}
