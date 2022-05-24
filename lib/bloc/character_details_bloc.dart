import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/models/character.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  CharacterDetailsBloc() : super(CharacterDetailsInitial()) {
    on<CharacterDetailsEvent>((event, emit) {
      print("character details" + event.toString());
      if (event is FetchCharacterDetails) {

      }
    });
  }
}
