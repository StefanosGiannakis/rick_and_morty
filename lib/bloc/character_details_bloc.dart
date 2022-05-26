import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/models/character_details.dart';
import 'package:rick_and_morty/resources/character_api_provider.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  final apiProvider = CharacterApiProvider();

  CharacterDetailsBloc() : super(const CharacterDetailsInitial()) {
    on<CharacterDetailsEvent>((event, emit) async {
      if (event is CharacterDetailsFetched) {
        try {
          emit(state.copyWith(isLoading: true));

          final characterDetails = await apiProvider.fetchCharacterDetails(
            characterId: event.characterId,
          );

          emit(state.copyWith(
            characterDetails: characterDetails,
            isLoading: false,
            status: CharacterDetailsStatus.success,
          ));
        } catch (_) {
          emit(state.copyWith(
            status: CharacterDetailsStatus.failure,
            isLoading: false,
          ));
        }
      }
    });
  }
}
