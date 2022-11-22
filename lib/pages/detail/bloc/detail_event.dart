part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class LoadNote extends DetailEvent {
  LoadNote({required this.note});
  final Note note;
}

class DeleteNote extends DetailEvent {
   DeleteNote({required this.note});
  final Note note;
}

class ToggleEditNote extends DetailEvent {}
