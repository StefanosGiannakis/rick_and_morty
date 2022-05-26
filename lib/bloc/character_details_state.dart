part of 'character_details_bloc.dart';

enum CharacterDetailsStatus { initial, success, failure }

class CharacterDetailsState extends Equatable {
  final CharacterDetails? characterDetails;
  final bool isLoading;
  final CharacterDetailsStatus status;

  const CharacterDetailsState({
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

class CharacterDetailsInitial extends CharacterDetailsState {
  const CharacterDetailsInitial()
      : super(
          characterDetails: null,
          isLoading: true,
          status: CharacterDetailsStatus.initial,
        );
}
