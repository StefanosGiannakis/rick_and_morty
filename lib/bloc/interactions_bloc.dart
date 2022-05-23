import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'interactions_event.dart';
part 'interactions_state.dart';

class InteractionsBloc extends Bloc<InteractionsEvent, InteractionsState> {
  InteractionsBloc() : super(InteractionsInitial()) {
    on<InteractionsEvent>((event, emit) {
      if (event is StartLoading) {
        emit(InteractionsState(isLoading: true));
      }
      if (event is StopLoading) {
        emit(InteractionsState(isLoading: false));
      }
    });
  }
}
