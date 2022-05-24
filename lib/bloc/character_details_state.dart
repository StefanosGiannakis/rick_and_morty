part of 'character_details_bloc.dart';

class CharacterDetailsState {
  Character? characterDetails;

  CharacterDetailsState({required this.characterDetails});
}

class CharacterDetailsInitial extends CharacterDetailsState {
  CharacterDetailsInitial() : super(characterDetails: null);
}
