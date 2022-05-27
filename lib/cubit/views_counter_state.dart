part of 'views_counter_cubit.dart';

class ViewsCounterState extends Equatable {
  final int counter;
  const ViewsCounterState({required this.counter});

  @override
  List<Object> get props => [counter];
}

class ViewsCounterInitial extends ViewsCounterState {
  const ViewsCounterInitial(int counter) : super(counter: 0);
}
