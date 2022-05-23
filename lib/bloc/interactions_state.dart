part of 'interactions_bloc.dart';

class InteractionsState {
  bool isLoading;
  InteractionsState({required this.isLoading});
}

class InteractionsInitial extends InteractionsState {
  InteractionsInitial() : super(isLoading: false);
}
