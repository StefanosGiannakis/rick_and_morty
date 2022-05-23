part of 'interactions_bloc.dart';

@immutable
abstract class InteractionsEvent {}

class StartLoading extends InteractionsEvent {}

class StopLoading extends InteractionsEvent {}
