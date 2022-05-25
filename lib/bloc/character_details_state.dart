part of 'character_details_bloc.dart';

enum CharacterDetailsStatus { initial, success, failure }

abstract class AbstractCharacterDetailsState extends Equatable {}

class CharacterDetailsState extends AbstractCharacterDetailsState {
  final CharacterDetails characterDetails; //@note
  final bool isLoading;
  final CharacterDetailsStatus status;

  CharacterDetailsState({
    required this.characterDetails,
    required this.isLoading,
    required this.status,
  });

  CharacterDetailsState copyWith({
    CharacterDetails? characterDetails,
    bool? isLoading,
    CharacterDetailsStatus? status,
  }) {
    return CharacterDetailsState(
      characterDetails: characterDetails ?? this.characterDetails,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [characterDetails, isLoading, status];
}

// class CharacterDetailsInitial extends AbstractCharacterDetailsState {
//   final CharacterDetailsStatus status = CharacterDetailsStatus.initial;

//   @override
//   List<Object?> get props => [status];
// }
class CharacterDetailsInitial extends CharacterDetailsState {
  CharacterDetailsInitial()
      : super(
          characterDetails: CharacterDetails.fromJson({
            "id": 1,
            "name": "Rick Sanchez",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
              "name": "Earth (C-137)",
              "url": "https://rickandmortyapi.com/api/location/1"
            },
            "location": {
              "name": "Citadel of Ricks",
              "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "episode": ["https://rickandmortyapi.com/api/episode/1"],
            "url": "https://rickandmortyapi.com/api/character/1",
            "created": "2017-11-04T18:48:46.250Z"
          }),
          isLoading: true,
          status: CharacterDetailsStatus.initial,
        );
}
