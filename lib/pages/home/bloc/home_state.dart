part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Note> listNote;
  final List<Note> listSearch;

  HomeSuccess({required this.listNote, this.listSearch = const []});
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}
