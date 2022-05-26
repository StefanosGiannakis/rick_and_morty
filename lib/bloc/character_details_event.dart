part of 'character_details_bloc.dart';

@immutable
abstract class CharacterDetailsEvent extends Equatable {}

class CharacterDetailsFetched extends CharacterDetailsEvent {
  final int characterId;
  CharacterDetailsFetched({required this.characterId});

  @override
  List<Object> get props => [characterId];
}
