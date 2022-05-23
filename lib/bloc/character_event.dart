part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {}

class FetchCharacters extends CharacterEvent {}

class FetchCharactersNextPage extends CharacterEvent {
  // final Function whenDone;
  // FetchCharactersNextPage({required this.whenDone});
  FetchCharactersNextPage();
}
