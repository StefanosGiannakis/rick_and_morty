import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'views_counter_state.dart';

class ViewsCounterCubit extends HydratedCubit<ViewsCounterState> {
  ViewsCounterCubit() : super(const ViewsCounterInitial(0));

  void increment() => emit(ViewsCounterState(counter: state.counter + 1));

  @override
  ViewsCounterState? fromJson(Map<String, dynamic> json) {
    return ViewsCounterState(counter: json['counter']);
  }

  @override
  Map<String, dynamic>? toJson(ViewsCounterState state) {
    return {'counter': state.counter};
  }
}
