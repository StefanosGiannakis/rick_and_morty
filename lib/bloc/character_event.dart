part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class FetchCharacters extends CharacterEvent {}

class FetchCharactersNextPage extends CharacterEvent {
  FetchCharactersNextPage();
}
