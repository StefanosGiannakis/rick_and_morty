part of 'character_details_bloc.dart';

@immutable
abstract class CharacterDetailsEvent extends Equatable {}

class FetchCharacterDetails extends CharacterDetailsEvent {
  final int characterId;
  FetchCharacterDetails({required this.characterId});

  @override
  List<Object> get props => [characterId];
}
